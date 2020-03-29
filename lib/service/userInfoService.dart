import 'dart:async';
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnflutter/model/userModel.dart';

abstract class BaseUserInfo {
  Future<LinkedHashMap<String,dynamic>> getUserInfo();

  Future<String> setUserAddress(String uid, String address);
  Future<String> setUserDescription(String uid, String description);
  Future<String> setUserGender(String uid, int gender);
  Future<String> setUserAvatar(String uid, String imgUrl);


}

class UserInfo implements BaseUserInfo{
  final databaseReference = Firestore.instance;

  UserInfo(this.userId);

  final String userId;

  @override
  Future<LinkedHashMap<String,dynamic>> getUserInfo() async {
    LinkedHashMap<String,dynamic> user=new LinkedHashMap();
   await databaseReference.collection("user").where('uid',isEqualTo: userId).getDocuments().then((val){
     val.documents.forEach((f)=>user.addAll(f.data));
   });


    return user;
  }

  @override
  Future<String> setUserAddress(String uid, String address) {
    // TODO: implement setUserAddress
    return null;
  }

  @override
  Future<String> setUserAvatar(String uid, String imgUrl) {
    // TODO: implement setUserAvatar
    return null;
  }

  @override
  Future<String> setUserDescription(String uid, String description) {
    // TODO: implement setUserDescription
    return null;
  }

  @override
  Future<String> setUserGender(String uid, int gender) {
    // TODO: implement setUserGender
    return null;
  }

}
main(){
  UserInfo a=new UserInfo("WKZy0HfxNfUOanjspZ7Tbjt62cA2");
  a.getUserInfo();
}