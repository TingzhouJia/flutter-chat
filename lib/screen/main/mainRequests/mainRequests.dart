import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnflutter/screen/main/mainRequests/RequestFriends.dart';
import 'package:learnflutter/widgets/SearchBar.dart';

class Requests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      child: Column(
        children: <Widget>[SearchBar(), RequestFriends()],
      ),
    );
  }
}