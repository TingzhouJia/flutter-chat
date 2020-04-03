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