import 'dart:async';
import 'dart:io';
import 'dart:collection';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:learnflutter/model/user.dart';
import 'package:path/path.dart' as Path;

import 'firestoreService.dart';

class FriendRepository {
  static const NAME = "name";
  static const BIRTHDAY = "birthday";
  static const IMAGE = "imgUrl";
  static const UID = "uid";

  // static const TOKEN = "token";
  static const ADDRESS = "address";
  static const LASTONLINE = "lastOnline";
  static const DESCRIPTION = "description";

//  static const UPDATEDGROUPS = "updatedGroups";
//  static const JOINEDGROUPS = "joinedGroups";
  static const STATUS = "status";
  static const GENDER = "gender";

  // final firebaseStorage=FirebaseStorage.instance;
  // final FirebaseAuth _firebaseAuth;
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

