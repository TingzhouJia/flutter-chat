import "package:built_collection/built_collection.dart";
import "package:built_value/built_value.dart";
import 'package:learnflutter/model/user.dart';

// ignore: prefer_double_quotes
part 'group.g.dart';

abstract class Group implements Built<Group, GroupBuilder> {
  @nullable
  String get id;

  String get name;

  @nullable
  String get description;

  GroupVisibility get visibility;

  BuiltList<User> get users;


  @nullable
  String get authorId;

  @nullable
  bool get hasUpdates;

  @nullable
  BuiltList<User> get newInvitation;
  String get hexColor;


  @nullable
  DateTime get startDate;



  Group._();

  factory Group([void Function(GroupBuilder) updates]) = _$Group;
}

enum GroupVisibility { OPEN, CLOSED }

class GroupVisibilityHelper {
  static String stringOf(GroupVisibility visibility) {
    switch (visibility) {
      case GroupVisibility.OPEN:
        return "OPEN";
      case GroupVisibility.CLOSED:
        return "CLOSED";
    }
    return null;
  }
  static GroupVisibility valueOf(String string) {
    switch (string) {
      case "OPEN":
        return GroupVisibility.OPEN;
      case "CLOSED":
        return GroupVisibility.CLOSED;
    }
    return null;
  }
}