

import "package:built_collection/built_collection.dart";
import "package:built_value/built_value.dart";
import 'package:learnflutter/model/user.dart';

// ignore: prefer_double_quotes
part 'friend.g.dart';

abstract class Friend implements Built<Friend, FriendBuilder> {
  User get user;

  String get background;

  bool get notification;

  bool get strongNotification;

  bool get setTop;

  String get nickName;




  Friend._();

  factory Friend([void Function(FriendBuilder) updates]) = _$Friend;
}

