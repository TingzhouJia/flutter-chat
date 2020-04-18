import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnflutter/model/channel.dart';
import 'package:learnflutter/model/group.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/screen/main/mainMessage/RecentChats.dart';
import 'package:learnflutter/service/messageService.dart';
import 'package:learnflutter/service/userInfoService.dart';

import 'firestoreService.dart';
class ChannelExistsError extends Error {}
class GroupRepository {
  static const String NAME = "name";
  static const String VISIBILITY = "visibility";
  static const String DESCRIPTION = "description";

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
  static const String MARKREAD="marked";
  static const String RECEIVED='received';
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
      String groupId, String userId,bool choice) async {
    final channelUsersPath =
    FirestorePaths.channelUsersPath(userId,groupId);
    // We're removing the indicator for the group then the channel.
    try {
      return await _firestore
          .document(channelUsersPath)
          .updateData({MARKREAD: choice});
    } catch (e) {
      return Future.error("Error marking channel as read");
    }
  }
  Future<void> markChannelReceived(
      String groupId, String userId,bool choice) async {
    final channelUsersPath =
    FirestorePaths.channelUsersPath(userId,groupId);
    // We're removing the indicator for the group then the channel.
    try {
      return await _firestore
          .document(channelUsersPath)
          .updateData({RECEIVED: choice});
    } catch (e) {
      return Future.error("Error marking channel as read");
    }
  }

  Future<void> leaveChannel(
      String groupId,
      String userId,
      List<String> memebers,
      ) async {
    //delete info of userGroup
    await  _firestore.document(FirestorePaths.channelUsersPath(userId, groupId)).delete();

  //delete from group
    await _firestore.collection(FirestorePaths.PATH_GROUPS).document(groupId).updateData({MEMBERS:memebers});
  }

  Future<Group> joinChannel(
      String groupId,
      Group group,
      String userId,
      ) async {
    
    final channelUsersPath =
    FirestorePaths.channelUsersPath(userId,groupId);

    await _firestore
        .collection(channelUsersPath).add({MARKREAD:false,RECEIVED:true});

     _firestore.collection(FirestorePaths.PATH_USERS).document(userId).snapshots().map((snap){
        return UserRepository.fromDoc(snap);
    }).listen((data){
      group.rebuild((c)=>c ..users.add(data));
    });
   List<String> listString= group.users.map((each){
      return each.uid;
    }).toList();
    await _firestore.collection(FirestorePaths.PATH_GROUPS).document(groupId).updateData({MEMBERS:listString});
    return group;
  }

  Future<void> inviteToChannel({
    String groupId,
    String groupName,
    Group group,
    List<String> members,
    String invitingUsername,
  }) async {



    members.map((user) async{
        final data = {'body':'You have been invited by $invitingUsername to join $groupName','messageType':MessageType.SYSTEM,'pending':true,
          'userId':user,'userName':'SYSTEM','timestamp':DateTime.now()
        };
        await _firestore
            .document(FirestorePaths.RecentPath(user))
            .collection('info').add(data);
      });

      _firestore.document(FirestorePaths.groupPath(groupId)).snapshots().map((each) {
        return each[INVITEDMEMBERS];
      }).listen((data) async{
       await  _firestore.document(FirestorePaths.groupPath(groupId)).updateData({INVITEDMEMBERS:data.addAll(members)});
      });

  }

  Future<Channel> createChannel(Channel channel, List<String> members, String authorUid) async {
    final data = toGroupMap(authorId: authorUid,group: channel,members: members);
    String docuId=await _firestore
        .collection(FirestorePaths.PATH_GROUPS).add(data).then((val){
          return val.documentID;
    });

    await _firestore.collection(FirestorePaths.USER_GROUP).document(authorUid).collection('info').
    document(docuId).setData({RECEIVED:true,MARKREAD:false});

    members.map((each) async{

      await _firestore.collection(FirestorePaths.PATH_MESSAGES).document('group').collection(docuId).add({
        'authorId':'SYSTEM','body':"$each is joined in group chat",'messageType':MessageType.SYSTEM,'pending':true,'timestamp':DateTime.now()
      });
    });


  }


  static toGroupMap({authorId, Channel group,List<String> members}){
    return {
      AUTHORID:authorId,
      DESCRIPTION:group.description,
      HEXCOLOR:group.hexColor,
      VISIBILITY:group.visibility,
      NAME:group.name,
      MEMBERS:members,
      START_DATE:DateTime.now()
    };
  }
}
