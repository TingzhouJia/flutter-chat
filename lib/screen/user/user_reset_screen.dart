import 'package:flutter/material.dart';
import 'package:learnflutter/service/userInfoService.dart';
class ResetInfo extends StatefulWidget {

  String title;
  final callFunc;
  ResetInfo({ this.title,this.callFunc});

  @override
  _ResetInfoState createState() => _ResetInfoState();
}

class _ResetInfoState extends State<ResetInfo> {
//
//  Widget getInput(title){
//    switch(title){
//      case "Username":
//        return
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Revise ${widget.title}'),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: (){

            },
            child: Text('Save'),
          )
        ],
      ),
      body: TextField(
        autofocus: true,
      ),
    );
  }
}
