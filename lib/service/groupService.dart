import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnflutter/model/channel.dart';
import 'package:learnflutter/model/group.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/service/userInfoService.dart';

import 'firestoreService.dart';
class ChannelExistsError extends Error {}
class GroupRepository {
  static const String NAME = "name";
  static const String VISIBILITY = "visibility";
  static const String DESCRIPTION = "description";
  static const String USERS = "users";
  static const String USERID = "uid";
  static const String HASUPDATES = "hasUpdates";
  static const String AUTHORID = "authorId";
  static const String TYPE = "type";
  static const String VENUE = "venue";
  static const String START_DATE = "startDate";
  static const String HAS_START_TIME = "startDate";
  static const String RSVP_FIELD = "rsvp";
  static const String HEXCOLOR = "hexColor";
  // The offset is used on backend side to send out notifications
  // with the correct time since it's stored in utc and we need
  // the offset of the event creator.
  static const String TIMEZONE_SECONDS_OFFSET = "timezone_seconds_offset";
  static const String INVITATION = "invitation";
  static const String CHANNELNAME = "channel_name";
  static const String INVITINGUSER = "inviting_user";
  static const String GROUPNAME = "group_name";
  static const String INVITEDMEMBERS = "newInvitation";
  static const String METADATA = "metadata";
  static const String MEMBERS = "users";

  final Firestore _firestore;
  const GroupRepository(this._firestore);

//  Stream<List<Group>> getGroupStream(userId) {
//    return _firestore
//        .collection(FirestorePaths.PATH_GROUPS)
//        .where(MEMBERS, arrayContains: userId)
//        .snapshots()
//        .asyncMap((snapShot){
//      return Future.wait(snapShot.documents.map((DocumentSnapshot f) async{
//        return await fromDoc(f);
//      }).toList());
//    });
//  }
  Stream<List<Channel>> getGroupsStream(userId) {
    return _firestore
        .collection(FirestorePaths.PATH_GROUPS)
        .where(MEMBERS, arrayContains: userId)
        .snapshots()
        .map((snapShot){
          return snapShot.documents.map((doc)=>fromChannelDoc(doc)).toList();
    });
  }
  static Channel fromChannelDoc(DocumentSnapshot document){
    return Channel((c)=>c
        ..id=document.documentID
        ..visibility=document[VISIBILITY]
        ..hexColor=document[HEXCOLOR]
        ..description=document[DESCRIPTION]
        ..name=document[NAME]
    );
  }

  Stream<Group> getStreamForChannel(
      String groupId, String channelId) {
    return _firestore
        .document(FirestorePaths.groupPath( channelId))
        .snapshots()
        .asyncMap((document) async {
      return await fromDoc( document);
    });
  }


   Future<Group> fromDoc( DocumentSnapshot document) async{
      List<User> userList= await getGroupUsers(document[MEMBERS]);
      List<User> iniList= await getGroupUsers(document[INVITEDMEMBERS]);
      return Group((c)=>c
          ..name=document[NAME]
          ..description=document[DESCRIPTION]
          ..id=document.documentID
          ..users=ListBuilder(userList)
          ..authorId=document[AUTHORID]
          ..startDate=document[START_DATE]
          ..hexColor=document[HEXCOLOR]
          ..visibility=GroupVisibilityHelper.valueOf(document[VISIBILITY])
          ..hasUpdates=document[HASUPDATES]
          ..newInvitation=ListBuilder(iniList)
      );
  }

  Future<List<User>> getGroupUsers(List<String> documentString) async{
    List<User> a;
     documentString.map((item) async{
       await _firestore.collection(FirestorePaths.PATH_USERS).document(item).snapshots().map((repo){
        return UserRepository.fromDoc(repo);
      }).listen((User data){
        a.add(data);
      });
    });
     return a;
  }


  Future<void> markChannelRead(
      String groupId, String channelId, String userId) async {
    final channelUsersPath =
    FirestorePaths.channelUsersPath(groupId, channelId);

    // We're removing the indicator for the group then the channel.
    try {
      await _firestore
          .collection(FirestorePaths.PATH_USERS)
          .document(userId)
          .updateData({
        groupId: FieldValue.arrayRemove([channelId])
      });

      return await _firestore
          .collection(channelUsersPath)
          .document(userId)
          .updateData({HASUPDATES: false});
    } catch (e) {


      return Future.error("Error marking channel as read");
    }
  }

  Future<void> leaveChannel(
      String groupId,
      String channelId,
      String userId,
      ) async {
    final channelUsersPath =
    FirestorePaths.channelUsersPath(groupId, channelId);
    await _firestore.collection(channelUsersPath).document(userId).delete();
  }

  Future<Channel> joinChannel(
      String groupId,
      Channel channel,
      String userId,
      ) async {
    final channelUser = ChannelUser((c) => c
      ..id = userId
      ..rsvp = RSVP.UNSET);
    final channelUsersPath =
    FirestorePaths.channelUsersPath(groupId, channel.id);
    final data = toChannelUserMap(channelUser);

    await _firestore
        .collection(channelUsersPath)
        .document(userId)
        .setData(data);

    return channel.rebuild((c) => c..users.add(channelUser));
  }

  Future<Channel> inviteToChannel({
    String groupId,
    String groupName,
    Channel channel,
    List<String> members,
    String invitingUsername,
  }) async {
    final channelUsersPath =
    FirestorePaths.channelUsersPath(groupId, channel.id);

    final users = members.map((userId) {
      return ChannelUser((c) => c
        ..id = userId
        ..rsvp = RSVP.UNSET);
    });

    for (final user in users) {
      final data = toChannelUserInviteMap(
          user: user,
          channel: channel,
          invitingUsername: invitingUsername,
          groupName: groupName);
      await _firestore
          .collection(channelUsersPath)
          .document(user.id)
          .setData(data);
    }

    return channel.rebuild((c) => c..users.addAll(users));
  }

  Future<Channel> createChannel(
      String groupId, Channel channel, List<String> members, String authorUid) async {
    final data = toMap(channel, members);
    final snapshot = await _firestore
        .collection(FirestorePaths.channelsPath(groupId))
        .getDocuments();

    final channelExists = snapshot.documents
        .any((doc) => doc[NAME].toLowerCase() == channel.name.toLowerCase());
    if (channelExists) {
      return Future.error(ChannelExistsError());
    }

    final reference = await _firestore
        .collection(FirestorePaths.channelsPath(groupId))
        .add(data);
    final doc = await reference.get();

    final users = members.map((userId) {
      return ChannelUser((c) => c
        ..id = userId
        ..rsvp = userId == authorUid ? RSVP.YES : RSVP.UNSET);
    }).toList();

    return fromDocWithUsers(doc: doc, users: BuiltList<ChannelUser>(users));
  }


}
