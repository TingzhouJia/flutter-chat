import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:learnflutter/model/user.dart';

@immutable
class OnUserUpdateAction {
  final User user;

  const OnUserUpdateAction(this.user);
}
@immutable
class UpdateUserAction {
  final User user;


  const UpdateUserAction(this.user);
}

class UpdateCurrentTarget{
  final String uid;

  UpdateCurrentTarget(this.uid);

}
class OnUpdateCurrentTarget{
  final User user;
  OnUpdateCurrentTarget(this.user);
}
class UpdateUserDescription{
   User user;
   String description;
  UpdateUserDescription({this.user,this.description});
}
class UpdateUserGender{
  User user;
  int gender;
  UpdateUserGender({this.user,this.gender});
}
class UpdateUserAvatar{
  User user;
  File img;
  UpdateUserAvatar({this.user,this.img});
}

class UpdateUserStatus{
  User user;
  String status;
  UpdateUserStatus({this.user,this.status});
}

class UpdateUserBirthday{
  User user;
  DateTime birthday;
  UpdateUserBirthday({this.user,this.birthday});
}
class UpdateUserName{
  User user;
  String name;
  UpdateUserName({this.user,this.name});
}
class UpdateUserLocation{
  User user;
  String Location;
  UpdateUserLocation({this.user,this.Location});
}