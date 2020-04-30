import 'dart:async';
import 'dart:io';
import 'dart:collection';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:learnflutter/model/friend.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/stranger.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/service/messageService.dart';
import 'package:learnflutter/service/userInfoService.dart';
import 'package:path/path.dart' as Path;

import 'firestoreService.dart';

class FriendRepository {
  static const NAME = "name";
  static const BIRTHDAY = "birthday";
  static const IMAGE = "imgUrl";
  static const UID = "uid";

   static const SETTOP = "setTop";
  static const STRONGNOTIFI = "strongNotif";
  static const ADDRESS = "address";
  static const LASTONLINE = "lastOnline";
  static const DESCRIPTION = "description";

  static const BACKGROUND = "Image";
  static const NOTIFICATION = "notification";
  static const STATUS = "status";
  static const GENDER = "gender";
  static const NICKNAME = "nickName";
   final firebaseStorage=FirebaseStorage.instance;

  final Firestore _firestore;

  FriendRepository(this._firestore);


  Stream<List<User>> getFavoriteStream( String userId) {
    return _firestore
        .collection(FirestorePaths.PATH_FAVOR)
        .document(userId)
        .snapshots()
        .asyncMap((DocumentSnapshot d) async{
      List<dynamic> a=d.data['favorList'];
      var aList = <User>[];
      for (var groceryPath in a) {
        aList.add(await _firestore.collection('user').document(groceryPath).get().then((value){
          return UserRepository.fromDoc(value);
        }));
      }

      return aList;
    });
  }

  Stream<List<Stranger>> getRequestStream(String userId){
    return _firestore.collection('request').document(userId).collection('requests').snapshots().asyncMap((query) async{
      List<Stranger> list=new List();
      for(DocumentSnapshot a in query.documents){
        list.add(await _firestore.document(FirestorePaths.userPath(a.documentID)).get().then((data){
          return getStrangerDoc(data).rebuild((c)=>c ..RequestInfo=a['message']);
        }));
      }
      return list;

    });
  }

  Stream<Stranger> getStranger(String uid){
    return _firestore.document(FirestorePaths.userPath(uid)).snapshots().map((snap){
      return getStrangerDoc(snap);
    });
  }

  Stream<Friend> getFriend(String uid,String targetId)  {
      return _firestore.document(FirestorePaths.friendPath(uid, targetId)).snapshots().map((data){
        return getFriendDoc(data);
      });
  }

  Future<String> updateBackground( File imgUrl,String uid,String targteid) async{
    StorageReference storageReference=firebaseStorage.ref().child('background/${Path.basename(imgUrl.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(imgUrl);
    await uploadTask.onComplete;
    String img;
    storageReference.getDownloadURL().then((fileURL) async{
      final documentReference = _firestore.document(FirestorePaths.friendPath(uid, targteid));
      await documentReference.updateData({BACKGROUND:fileURL});
      img= fileURL;
    });
    return img;
    // databaseReference.collection('user').document(userId).updateData();
    // TODO: implement setUserAvatar

  }

  Future<void> updateNotification(FriendSetting setting,String uid,String targetId,bool result) async{
    await _firestore.document(FirestorePaths.friendPath(uid, targetId)).updateData({FriendHelper.stringOf(setting):result});
  }

  Future<void>  updateNickName(String newName,String uid,String targetId) async{
    await _firestore.document(FirestorePaths.friendPath(uid, targetId)).updateData({NICKNAME:newName});
}

  static Friend getFriendDoc(DocumentSnapshot friend){
    return Friend((c)=>c

        ..background=friend[BACKGROUND]
        ..nickName=friend[NICKNAME]
        ..setTop=friend[SETTOP]
        ..notification=friend[NOTIFICATION]
        ..strongNotification=friend[STRONGNOTIFI]
    );
  }

  static Stranger getStrangerDoc(DocumentSnapshot stranger){
    return Stranger((c)=>c
        ..uid=stranger.documentID
        ..name=stranger[NAME]
        ..imgUrl=stranger['imgUrl']
        ..description=stranger[DESCRIPTION]
        ..gender=stranger[GENDER]
        ..address=stranger[ADDRESS]
        ..status=stranger[STATUS]
        ..birthday=DateTime.parse(stranger[BIRTHDAY].toDate().toString())
    );
  }

  Future<void> recommendToFriends(List<String> toList,Friend target,User sender) async{
    toList.map((user) async{
      final data3={
        'imgUrl':target.user.imgUrl,'messageType':MessageType.RECOMMEND,'pending':false,'targetId':target.user.uid,'body':'',
        'authorId':sender.uid,'timestamp':DateTime.now(),'targetName':target.user.name,
      };
      final recentpath=_firestore.collection(FirestorePaths.Path_RECENT).document(sender.uid).collection("info").document(user);
      final path2=_firestore.collection(FirestorePaths.Path_RECENT).document(user).collection("info").document(sender.uid);
      final targte= await recentpath.get();
      final target2=await path2.get();
      if(targte.data==null||targte.data.length == 0){
        await recentpath.setData({'body':'You have recommend a friend ','messageType':MessageType.RECOMMEND,'pending':false,
          'userId':sender.uid,'userName':user,'timestamp':DateTime.now()});
      }else{
        await recentpath.updateData({'body':'You have recommend a friend ','messageType':MessageType.RECOMMEND,'pending':false,
          'userId':sender.uid,'userName':user,'timestamp':DateTime.now()});
      }
      if(target2.data==null||target2.data.length==0){
        await path2.setData({'body':'You have been receive a recommendation from ${sender.name}','messageType':MessageType.RECOMMEND,'pending':true,
          'userId':sender.uid,'userName':user,'timestamp':DateTime.now()});
      }else{
        await path2.updateData({'body':'You have been receive a recommendation from ${sender.name}','messageType':MessageType.RECOMMEND,'pending':true,
          'userId':sender.uid,'userName':user,'timestamp':DateTime.now()});
      }
      await _firestore.collection(FirestorePaths.messagePath(user, sender.uid)).add(data3);
      await _firestore.collection(FirestorePaths.messagePath(sender.uid,user)).add(data3);
    });
  }

  static User get(document){
    return User((u) => u
      ..uid = document.documentID
      ..name = document['name']
      ..gender = document['gender']
      ..imgUrl = document['imgUrl']
      ..status = document['status']
      ..description=document['description']
      ..lastOnline=DateTime.parse(document['lastOnline'].toDate().toString())
      ..address=document['address']
      ..birthday=DateTime.parse(document['birthday'].toDate().toString())
    );
  }

  Future<void> deleteFriend(String uid,String targteid,String targetName){
    final a=_firestore.document(FirestorePaths.RecentPath(uid));
    if(a.get()==null){
      a.delete();
    }
    final data={
      'authorId':'SYSTEM','body':'Your relationship with $targetName (id:$targteid ) have been relieved',
      'userId':targteid,'messageType':MessageType.SYSTEM,'pending':true,'userImage':"",'userName':'system','timestamp':DateTime.now(),
    };
    _firestore.document(FirestorePaths.friendPath(uid, targteid)).delete();
    _firestore.document(FirestorePaths.friendPath(targteid, uid)).delete();
    _firestore.collection(FirestorePaths.RecentPath(targteid)).document('system').updateData(data);
   return  _firestore.collection(FirestorePaths.PATH_MESSAGES).document(targteid).collection('system').add(data);

  }

  //target is someone want to add uid
  Future<Friend> agreeFriend(String uid,String targetId,String imgUrl) async{

       await _firestore.document(FirestorePaths.requestpath(uid,targetId)).get().then((snap)async{

         await _firestore.collection(FirestorePaths.PATH_FRIEND).document(targetId).collection('info').document(uid).setData({
           'Image':"",'nickName':snap[NICKNAME],'notification':snap[NOTIFICATION],'setTop':snap[SETTOP],'strongNotif':snap[STRONGNOTIFI]
         });
         await _firestore.collection(FirestorePaths.messagePath(targetId, uid)).add({
           'authorId':"",'body':'say hello to your new friend','timestamp':DateTime.now(),'messageType':'SYSTEM','pending':true
         });
         await _firestore.collection(FirestorePaths.Path_RECENT).document(targetId).collection('info').document(uid).setData({
           'Id':uid,'body':'say hello to your new friend','timestamp':DateTime.now(),'messageType':'SYSTEM','pending':true,'userId':"",
           'userImage':imgUrl,'userName':snap[NICKNAME]
         });
       });


     return  await _firestore.document(FirestorePaths.userPath(targetId)).get().then((snap) async {
         User a=UserRepository.fromDoc(snap);
         await _firestore.collection(FirestorePaths.PATH_FRIEND).document(uid).collection('info').document(targetId).setData({
           'Image':"",'nickName':a.name,'notification':false,'setTop':false,'strongNotif':false
         });
         await _firestore.collection(FirestorePaths.Path_RECENT).document(uid).collection('info').document(targetId).setData({
           'Id':targetId,'body':'say hello to your new friend','timestamp':DateTime.now(),'messageType':'SYSTEM','pending':true,'userId':"",
           'userImage':a.imgUrl,'userName':a.name
         });
         await _firestore.collection(FirestorePaths.messagePath(uid, targetId)).add({
           'authorId':"",'body':'say hello to your new friend','timestamp':DateTime.now(),'messageType':'SYSTEM','pending':true
         });
         Friend b=Friend((c)=>c ..nickName=a.name ..user=a.toBuilder() ..setTop=false ..strongNotification=false ..background="" ..notification=false);
         return b;
       });


  }

  Future<void> refuseFriend(String uid,String targetId)async{
      await _firestore.collection('request').document(uid).collection('requests').document(targetId).delete();
  }

  Future<void> addFriend(String uid,String target,String remarks,String message,bool notification,bool setTop,bool strongnotif) async{
    await _firestore.collection('request').document(target).collection('requests').document(uid).setData({'remark':remarks,'message':message,
    SETTOP:setTop,NOTIFICATION:notification,STRONGNOTIFI:strongnotif});
    await _firestore.collection('message').document(uid).collection('system').add({
      'body':'You have sent your request to uid $target','authorId':'SYSTEM','messageType':'SYSTEM','pending':true,'timestamp':DateTime.now()
    });
    await _firestore.collection(FirestorePaths.RecentPath(uid)).document('system').setData({
      'userImage':"",'userId':"",'pending':true,'messageType':'SYSTEM','userName':target,
      'body':"You have sent your request to",'timestamp':DateTime.now()
    });
  }





}

