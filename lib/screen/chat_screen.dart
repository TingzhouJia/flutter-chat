import 'package:flutter/material.dart';
import 'package:learnflutter/model/userModel.dart';
import 'package:learnflutter/model/message_model.dart';
import 'package:learnflutter/widgets/ChatList.dart';
class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessageComposer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_library),
            iconSize: 30.0,
            color: Colors.red,

          ),
          IconButton(
            icon: Icon(Icons.photo_camera),
            iconSize: 30.0,
            color: Colors.red,

          ),
          IconButton(
            icon: Icon(Icons.mic),
            iconSize: 30.0,
            color: Colors.red,

          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            iconSize: 30.0,
            color: Colors.red,

          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(
                hintText: "Aa",
                hintStyle: TextStyle(color: Colors.grey)
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 30.0,
            color: Colors.red,

          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(

        title: Text(widget.user.name,style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold)),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () => {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0))
              ),
              child: ChatList() ,
            ),
          ),
          _buildMessageComposer()
        ],
      ),
    );
  }
}
