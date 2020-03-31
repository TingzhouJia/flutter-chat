import 'dart:async';
import 'dart:io';
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
abstract class BaseUserInfo {
  Future<LinkedHashMap<String,dynamic>> getUserInfo();

  Future<void> setUserAddress( String address);
  Future<void> setUserDescription( String description);
  Future<void> setUserGender( int gender);
  Future<void> setUserAvatar( File imgUrl);


}

class UserInfo implements BaseUserInfo{
  final databaseReference = Firestore.instance;
  final firebaseStorage=FirebaseStorage.instance;
  UserInfo(this.userId);

  final String userId;

  @override
  Future<LinkedHashMap<String,dynamic>> getUserInfo() async {
    LinkedHashMap<String,dynamic> user=new LinkedHashMap();

//   await databaseReference.collection("user").where('uid',isEqualTo: userId).getDocuments().then((val){
//     val.documents.forEach((f)=>user.addAll(f.data));
//   });

    await databaseReference.collection("user").document(userId).get().then((val) {user.addAll(val.data);});


    return user;
  }

  @override
  Future<String> setUserAddress( String address) {
    // TODO: implement setUserAddress
    return null;
  }

  @override
   setUserAvatar( File imgUrl) async{
    StorageReference storageReference=firebaseStorage.ref().child('avatar/${Path.basename(imgUrl.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(imgUrl);
    await uploadTask.onComplete;
    print('finished');
    storageReference.getDownloadURL().then((fileURL) async{
      await databaseReference.collection('user').document(userId).updateData({'imgUrl':fileURL,'lastOnline':new DateTime.now()});
    }).then((_) async{
      await getUserInfo();
    });
    // databaseReference.collection('user').document(userId).updateData();
    // TODO: implement setUserAvatar

  }

  @override
  Future<void> setUserDescription( String description) async {
    // TODO: implement setUserDescription
    await databaseReference.collection('user').document(userId).updateData({'description':description,'lastOnline':new DateTime.now()}).then((_) async{
      await getUserInfo();
    });
    print('finished');
  }

  @override
  Future<String> setUserGender( int gender) {
    // TODO: implement setUserGender
    return null;
  }

}
main(){
  UserInfo a=new UserInfo("WKZy0HfxNfUOanjspZ7Tbjt62cA2");
  a.getUserInfo();
}