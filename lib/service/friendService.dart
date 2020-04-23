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
          return get(value);
        }));
      }

      return aList;
    });
  }

  Stream<List<Friend>> getFriendStream( String userId) {

    return _firestore
        .collection(FirestorePaths.PATH_FRIEND)
        .document(userId).collection('info').orderBy(NICKNAME,descending: true)
        .snapshots().map((QuerySnapshot content) {
            List<Friend> listFriend=new List();
           content.documents.map((DocumentSnapshot each) {

             return  _firestore.collection('user').document(each.documentID).snapshots().map((DocumentSnapshot data){
                return (getFriendDoc(data, each));
              }).listen((inn){
              listFriend.add(inn);
               });
           });
           return listFriend;
     });

  }
  Stream<Friend> getFriend(String uid,String targetId) {
   Friend a;
    return _firestore
        .collection(FirestorePaths.PATH_FRIEND)
        .document(uid).collection('info').document(targetId).snapshots().map((item){
           _firestore.collection('user').document(item.documentID).snapshots().map(( DocumentSnapshot each){
             return each;
           }).listen((co){
             a= getFriendDoc(co, item);
          });
           print(a);
           return a;
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

  static Friend getFriendDoc(DocumentSnapshot user,DocumentSnapshot friend){
    return Friend((c)=>c
      ..user=UserRepository.fromDoc(user).toBuilder()
        ..background=friend[BACKGROUND]
        ..nickName=friend[NICKNAME]
        ..setTop=friend[SETTOP]
        ..notification=friend[NOTIFICATION]
        ..strongNotification=friend[STRONGNOTIFI]
    );
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

