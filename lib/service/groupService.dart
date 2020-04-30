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
        .asyncMap((snapShot)   {
           return  snapShot.documents.map((doc)  {
            return fromChannelDoc(doc);
          }).toList();
    }).map((data){
      return data.map((each){
        getUserGroup(each.id, userId).listen((ele){
          each.rebuild((c)=>c ..marked=ele[MARKREAD] ..received=ele[RECEIVED]);
        });
        return each;
      }).toList();
    });
  }
  Stream<Channel> getChannel(channelId){
    return _firestore.collection(FirestorePaths.PATH_GROUPS).document(channelId).snapshots().map((document)=>fromChannelDoc(document));
  }

  Stream<Map> getUserGroup(String groupid,String uid) {
    final channelUsersPath = FirestorePaths.channelUsersPath(uid,groupid);
   return  _firestore.document(channelUsersPath).snapshots().map((each){
      return {MARKREAD:each[MARKREAD],RECEIVED:each[RECEIVED]};
    });
  }


  static Channel fromChannelDoc(DocumentSnapshot document,  ){

    return Channel((c)=>c
        ..authorId=document[AUTHORID]
        ..id=document.documentID
        ..visibility=document[VISIBILITY]==true?ChannelVisibility.OPEN:ChannelVisibility.CLOSED
        ..hexColor=document[HEXCOLOR]
        ..description=document[DESCRIPTION]
        ..name=document[NAME]
        ..received=true
        ..marked=true
    );
  }


  Stream<Group> getStreamForChannel(String channelId) {
    return _firestore
        .document(FirestorePaths.groupPath(channelId))
        .snapshots()
        .asyncMap((document) async {
      return  fromDoc( document);
    });
  }


   Group fromDoc( DocumentSnapshot document) {
      List<User> userList=  getGroupUsers(document[MEMBERS]);
      List<User> iniList=  getGroupUsers(document[INVITEDMEMBERS]);
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

  List<User> getGroupUsers(List<String> documentString) {
    List<User> a;
     documentString.map((item) {
        _firestore.collection(FirestorePaths.PATH_USERS).document(item).snapshots().map((repo) {
        return  UserRepository.fromDoc(repo);
      }).listen((User data){
        a.add(data);
      });
    });
     return a;
  }


  Future<void> markChannelRead(String groupId, String userId,bool choice) async {
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

  Future<void> markChannelReceived(String groupId, String userId,bool choice) async {
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

  Future<void> leaveChannel(String groupId, String userId, List<String> memebers,) async {
    //delete info of userGroup
    await  _firestore.document(FirestorePaths.channelUsersPath(userId, groupId)).delete();

  //delete from group
    await _firestore.collection(FirestorePaths.PATH_GROUPS).document(groupId).updateData({MEMBERS:memebers});
  }

  Future<Group> joinChannel(Group group, String userId,) async {

    final channelUsersPath =
    FirestorePaths.channelUsersPath(userId,group.id);

    await _firestore
        .collection(channelUsersPath).add({MARKREAD:false,RECEIVED:true});

     _firestore.collection(FirestorePaths.PATH_USERS).document(userId).snapshots().map((snap){
        return UserRepository.fromDoc(snap);
    }).listen((data){

       final a=group.newInvitation.where((user)=>user.uid!=userId);
       group.rebuild((c)=>c ..users.add(data) ..newInvitation=ListBuilder(a));
    });
   List<String> listString= group.users.map((each){
      return each.uid;
    }).toList();
   List<String> inivi=group.newInvitation.map((a){return a.uid;});
    await _firestore.collection(FirestorePaths.PATH_GROUPS).document(group.id).updateData({MEMBERS:listString,INVITEDMEMBERS:inivi});
    return group;
  }

  Future<void> inviteToChannel({Group group, List<String> members, User invitingUser,}) async {
    members.map((user) async{
        final data3={
          'body':'','messageType':MessageType.INVITATION,'pending':false, 'name':group.name,'imgUrl':group.hexColor,
          'authorId':invitingUser.uid,'timestamp':DateTime.now(),'targetId':group.id,'targetName':group.name
        };
        final recentpath=_firestore.collection(FirestorePaths.Path_RECENT).document(invitingUser.uid).collection("info").document(user);
        final path2=_firestore.collection(FirestorePaths.Path_RECENT).document(user).collection("info").document(invitingUser.uid);
        final targte= await recentpath.get();
        final target2=await path2.get();
        if(targte.data==null||targte.data.length == 0){
          await recentpath.setData({'body':'You have been invited by ${invitingUser.name} to join groupchat ${group.name}','messageType':MessageType.INVITATION,'pending':false,
            'userId':invitingUser.uid,'userName':user,'timestamp':DateTime.now()});
        }else{
          await recentpath.updateData({'body':'You have been invited by ${invitingUser.name} to join groupchat ${group.name}','messageType':MessageType.INVITATION,'pending':false,
          'userId':invitingUser.uid,'userName':user,'timestamp':DateTime.now()});
        }
        if(target2.data==null||target2.data.length==0){
          await path2.setData({'body':'You have been invited by ${invitingUser.name} to join groupchat ${group.name}','messageType':MessageType.INVITATION,'pending':true,
            'userId':invitingUser.uid,'userName':user,'timestamp':DateTime.now()});
        }else{
          await path2.updateData({'body':'You have been invited by ${invitingUser.name} to join groupchat ${group.name}','messageType':MessageType.INVITATION,'pending':true,
            'userId':invitingUser.uid,'userName':user,'timestamp':DateTime.now()});
        }

        await _firestore.collection(FirestorePaths.messagePath(user, invitingUser.uid)).add(data3);
        await _firestore.collection(FirestorePaths.messagePath(invitingUser.uid,user)).add(data3);
      });

      _firestore.document(FirestorePaths.groupPath(group.id)).snapshots().map((each) {
        return each[INVITEDMEMBERS];
      }).listen((data) async{
       await  _firestore.document(FirestorePaths.groupPath(group.id)).updateData({INVITEDMEMBERS:data.addAll(members)});
      });

  }

  Future<void> notJoinChannel({Channel group, String uid,}) async{
    _firestore.document(FirestorePaths.groupPath(group.id)).snapshots().map((each) {
      return  each[INVITEDMEMBERS];
    }).listen((data) async{
      final data1=data.where((u)=>u!=uid);
      await  _firestore.document(FirestorePaths.groupPath(group.id)).updateData({INVITEDMEMBERS:data1});

    });
  }

  Future<void> applyToChannel({Channel group, String uid, String username}) async{
    _firestore.document(FirestorePaths.groupPath(group.id)).snapshots().map((each) {
      return  each[INVITEDMEMBERS];
    }).listen((data) async{
      await  _firestore.document(FirestorePaths.groupPath(group.id)).updateData({INVITEDMEMBERS:data.add(uid)});
      final data1 = {'body':'$username is expecting to join ${group.name}','messageType':MessageType.SYSTEM,'pending':true,
        'userId':uid,'userName':'SYSTEM','timestamp':DateTime.now()
      };
      await _firestore.collection(FirestorePaths.messagePath(group.authorId, 'system')).add(data1);
      await _firestore
          .document(FirestorePaths.RecentPath(group.authorId))
          .collection('info').document('system').updateData(data);
    });
  }


  Future<Stream<Group>> createChannel(Channel channel, List<String> members, String authorUid) async {
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
   return  _firestore.collection(FirestorePaths.PATH_GROUPS).document(docuId).snapshots().asyncMap((data){
     return fromDoc(data);
   });


  }

  Future<void> updateChannel(String groupId, Group group) async {
    await _firestore
        .document(FirestorePaths.groupPath(groupId))
        .updateData({
      DESCRIPTION: group.description,
      NAME:group.name,
      START_DATE: _formatToTimestamp(group.startDate),
      HEXCOLOR:group.hexColor
    });

  }

  static Timestamp _formatToTimestamp( DateTime time) {


    return Timestamp.fromDate(time);
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
