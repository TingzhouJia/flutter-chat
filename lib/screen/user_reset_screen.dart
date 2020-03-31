import 'package:flutter/material.dart';
import 'package:learnflutter/service/userInfoService.dart';
class ResetInfo extends StatefulWidget {
  UserInfo userinfo;
  String title;

  ResetInfo({this.userinfo, this.title});

  @override
  _ResetInfoState createState() => _ResetInfoState();
}

class _ResetInfoState extends State<ResetInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Revise ${widget.title}'),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: (){},
            child: Text('Save'),
          )
        ],
      ),
    );
  }
}
