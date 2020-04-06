import 'dart:async';
import 'dart:io';
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:learnflutter/model/user.dart';
import 'package:path/path.dart' as Path;

import 'firestoreService.dart';


class UserRepository {
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
  static const GENDER="gender";

  final firebaseStorage=FirebaseStorage.instance;
  final FirebaseAuth _firebaseAuth;
  final Firestore _firestore;

   UserRepository(
      this._firebaseAuth,
      this._firestore,
      );


  Future<User> signIn(String email, String password) async {
    final firebaseUser = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return await _fromFirebaseUser(firebaseUser.user);
  }

  Future<User> signUp(String email,String password) async {
    final firebaseUser=await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return await _fromFirebaseUser(firebaseUser.user);
  }

  Future<User> _fromFirebaseUser(FirebaseUser firebaseUser) async {

    if (firebaseUser == null) return Future.value(null);

    final documentReference =
    _firestore.document(FirestorePaths.userPath(firebaseUser.uid));
    final snapshot = await documentReference.get();
    User user;
    if (snapshot.data==null||snapshot.data.length == 0) {

      user = User((u) => u
        ..uid = firebaseUser.uid
        ..gender=3
        ..description=''
        ..imgUrl=''
        ..status='Online'
        ..address=''
        ..birthday=DateTime.now()
        ..lastOnline=DateTime.now()
        ..name = firebaseUser
            .email // Default name will be the email, let user change later
      );
      await documentReference.setData(toMap(user));
    } else {
      user = fromDoc(snapshot);
    }


    return user;
  }

  Future<void> logOut() async {
    await updateStatus("Offline");
    await updateLastOnline(DateTime.now());
    await _firebaseAuth.signOut();
  }

//  Future<void> updateUserToken(String token) async {
//    final firebaseUser = await _firebaseAuth.currentUser();
//    if (firebaseUser != null) {
//      final documentReference =
//      _firestore.document(FirestorePaths.userPath(firebaseUser.uid));
//      return documentReference.updateData({
//        TOKEN: token,
//      });
//    }
//  }

  ///
  /// Allows to update the User, but only the following fields:
  /// - name
  /// - status
  /// - image
  ///
  Future<void> updateStatus(String status) async {
    final firebaseUser = await _firebaseAuth.currentUser();
    if (firebaseUser != null) {
      final documentReference =
      _firestore.document(FirestorePaths.userPath(firebaseUser.uid));
      return documentReference.updateData({STATUS:status});
    }
  }

  Future<void> updateLastOnline(DateTime lastonline) async{
    final firebaseUser = await _firebaseAuth.currentUser();
    if (firebaseUser != null) {
      final documentReference =
      _firestore.document(FirestorePaths.userPath(firebaseUser.uid));
      return documentReference.updateData({LASTONLINE:lastonline});
    }
  }

  // Sets a users locale on our backend.
  // The locale is used to send localized notifications.
//  Future<void> updateUserLocale(String locale) async {
//    final firebaseUser = await _firebaseAuth.currentUser();
//    if (firebaseUser != null) {
//      final documentReference =
//      _firestore.document(FirestorePaths.userPath(firebaseUser.uid));
//      return documentReference.updateData({
//        LOCALE: locale,
//      });
//    }
//  }
  Stream<User> getUserStream(userId) {
    return _firestore
        .collection(FirestorePaths.PATH_USERS)
        .document(userId)
        .snapshots()
        .map((userSnapshot) {
      return fromDoc(userSnapshot);
    });
  }



   Future<String> updateUserAvatar( File imgUrl) async{
    StorageReference storageReference=firebaseStorage.ref().child('avatar/${Path.basename(imgUrl.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(imgUrl);
    await uploadTask.onComplete;
    print('finished');
    String img;
    storageReference.getDownloadURL().then((fileURL) async{
      final firebaseUser = await _firebaseAuth.currentUser();
      final documentReference = _firestore.document(FirestorePaths.userPath(firebaseUser.uid));
      await documentReference.updateData({IMAGE:fileURL});
       img= fileURL;
    });
    return img;
    // databaseReference.collection('user').document(userId).updateData();
    // TODO: implement setUserAvatar

  }


  Future<void> updateUserDescription( String description) async {
    final firebaseUser = await _firebaseAuth.currentUser();
    if (firebaseUser != null) {
      final documentReference =
      _firestore.document(FirestorePaths.userPath(firebaseUser.uid));
      return documentReference.updateData({DESCRIPTION:description});
    }
    print('finished');
  }
  Future<void> updateUserName( String name) async {
    final firebaseUser = await _firebaseAuth.currentUser();
    if (firebaseUser != null) {
      final documentReference =
      _firestore.document(FirestorePaths.userPath(firebaseUser.uid));
      return documentReference.updateData({NAME:name});
    }
    print('finished');
  }
  Future<void> updateUserLocation( String location) async {
    final firebaseUser = await _firebaseAuth.currentUser();
    if (firebaseUser != null) {
      final documentReference =
      _firestore.document(FirestorePaths.userPath(firebaseUser.uid));
      return documentReference.updateData({ADDRESS:location});
    }
    print('finished');
  }


  Future<void> updateUserGender( int gender) async {
    final firebaseUser = await _firebaseAuth.currentUser();
    if (firebaseUser != null) {
      final documentReference =
      _firestore.document(FirestorePaths.userPath(firebaseUser.uid));
      return documentReference.updateData({GENDER:gender});
    }
    return null;
  }
  Future<void> updateUserBirthday( DateTime birthday) async {
    final firebaseUser = await _firebaseAuth.currentUser();
    if (firebaseUser != null) {
      final documentReference =
      _firestore.document(FirestorePaths.userPath(firebaseUser.uid));
      return documentReference.updateData({BIRTHDAY:birthday});
    }
    return null;
  }

  Stream<User> getAuthenticationStateChange() {

    return _firebaseAuth.onAuthStateChanged.asyncMap((firebaseUser) {

      return _fromFirebaseUser(firebaseUser);
    });
  }





  static User fromDoc(DocumentSnapshot document) {

    return User((u) => u
      ..uid = document.documentID
      ..name = document[NAME]
      ..gender = document[GENDER]
      ..imgUrl = document[IMAGE]
      ..status = document[STATUS]
        ..description=document[DESCRIPTION]
        ..lastOnline=DateTime.parse(document[LASTONLINE].toDate().toString())
        ..address=document[ADDRESS]
        ..birthday=DateTime.parse(document[BIRTHDAY].toDate().toString())
    );
      //..unreadUpdates = MapBuilder(_parseUnreadChannels(document)));
  }


  static toMap(User user) {
    return {
    UID :user.uid,
    GENDER:user.gender,
    DESCRIPTION:user.description,
    IMAGE:user.imgUrl,
    STATUS:user.status,
    ADDRESS:user.address,
    LASTONLINE:user.lastOnline,
      BIRTHDAY:user.birthday,
    NAME:user.name
    };
  }


}
