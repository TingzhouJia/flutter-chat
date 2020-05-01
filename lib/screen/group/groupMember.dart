import 'package:flutter/cupertino.dart';
import 'package:learnflutter/model/user.dart';

class GroupMember extends StatefulWidget {
  final List<User> userList;

  GroupMember(this.userList);

  @override
  _GroupMemberState createState() => _GroupMemberState();
}

class _GroupMemberState extends State<GroupMember> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
