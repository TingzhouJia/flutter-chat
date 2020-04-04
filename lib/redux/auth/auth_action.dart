
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnflutter/model/user.dart';
class Login{
  String email;
  String password;

  Login({this.email, this.password});

}
class Signup{
  String email;
  String password;

  Signup({this.email, this.password});

}

class LogOut{

}
@immutable
class OnAuthenticated {
  final User user;

  const OnAuthenticated({@required this.user});

  @override
  String toString() {
    return "OnAuthenticated{user: ${user.uid}}";
  }
}

class VerifyAuth{}

class OnLogoutSuccess{

  OnLogoutSuccess();

}