

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

enum FriendSetting { NOTIFICATION, STRONG_NOTIFICATION,SET_TOP }

class FriendHelper {
  static String stringOf(FriendSetting visibility) {
    switch (visibility) {
      case FriendSetting.NOTIFICATION:
        return "notification";
      case FriendSetting.STRONG_NOTIFICATION:
        return "strongNotif";
      case FriendSetting.SET_TOP:
        return "setTop";
    }
    return null;
  }
  static FriendSetting valueOf(String string) {
    switch (string) {
      case "notification":
        return FriendSetting.NOTIFICATION;
      case "strongNotif":
        return FriendSetting.STRONG_NOTIFICATION;
      case "setTop":
        return FriendSetting.SET_TOP;

    }
    return null;
  }
}

