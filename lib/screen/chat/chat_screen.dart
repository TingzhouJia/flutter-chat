
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/chat/ChatList.dart';
import 'package:learnflutter/screen/chat/chatDetail.dart';
import 'package:learnflutter/screen/chat/chatUtils.dart';
import 'package:learnflutter/screen/chat/chat_view.dart';


class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final homeScaffoldKey=new GlobalKey<ScaffoldState>();
  bool onUse = false;


  _built(context, ChatScreenViewModel vm) {
    return Scaffold(
      key: homeScaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          centerTitle: true,
          title: Text(vm.target.user.name,
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff333333))),
          elevation: 0.0,

          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              iconSize: 30.0,
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ChatDetail()));
              },
            ),
          ],
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          homeScaffoldKey.currentState.hideCurrentSnackBar();
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            onUse = false;
          });
        },
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                child: ChatList(false),
              ),
            ),
            BuildKeyboard(vm,onUse)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChatScreenViewModel>(
      converter: ChatScreenViewModel.fromStore(false),
      builder: (context, vm) => _built(context, vm),
      distinct: true,
    );
  }
}
