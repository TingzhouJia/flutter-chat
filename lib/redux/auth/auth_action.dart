
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Login{
  String email;
  String password;

  Login(this.email, this.password);

}

class LogOut{

}
@immutable
class OnAuthenticated {
  final String user_id;

  const OnAuthenticated({@required this.user_id});

  @override
  String toString() {
    return "OnAuthenticated{user: $user_id}";
  }
}

class VerifyAuth{}

class OnLogoutSuccess{

  OnLogoutSuccess();

}