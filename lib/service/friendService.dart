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
import 'package:learnflutter/model/user.dart';
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
      //..user=UserRepository.fromDoc(user).toBuilder()
        ..background=friend[BACKGROUND]
        ..nickName=friend[NICKNAME]
        ..setTop=friend[SETTOP]
        ..notification=friend[NOTIFICATION]
        ..strongNotification=friend[STRONGNOTIFI]
    );
  }

  Future<void> recommendToFriends(List<String> toList,Friend target,User sender) async{
    toList.map((user) async{
      final data3={
        'body':target.user.uid,'messageType':MessageType.RECOMMEND,'pending':false,
        'authorId':sender.uid,'timestamp':DateTime.now()
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

  Future<void> deleteFriend(String uid,String targteid){
    final a=_firestore.document(FirestorePaths.RecentPath(uid));
    if(a.get()==null){
      a.delete();
    }
    _firestore.document(FirestorePaths.friendPath(uid, targteid)).delete();
    _firestore.document(FirestorePaths.friendPath(targteid, uid)).delete();
  }
//
//  Future<Channel> documentToChannel(
//      String groupId,
//      String userId,
//      DocumentSnapshot document,
//      ) async {
//    final snapshot = await document.reference.collection(USERS).getDocuments();
//    final usersDocuments = snapshot.documents;
//
//    final users = usersDocuments.map((data) => channelUserFromDoc(data));
//
//    final userDocument = usersDocuments
//        .firstWhere((doc) => doc.documentID == userId, orElse: () => null);
//
//    final hasUpdates =
//    (userDocument == null || userDocument.data[HASUPDATES] == null)
//        ? false
//        : userDocument.data[HASUPDATES];
//
//    return fromDocWithUsers(
//        doc: document,
//        users: BuiltList<ChannelUser>.of(users),
//        hasUpdates: hasUpdates);
//  }





}

