


import 'package:flutter/material.dart';
import 'package:learnflutter/model/message_model.dart';
import 'package:intl/intl.dart';

class ChatList extends StatelessWidget {
  _buildMessage(Message message, bool isMe,BuildContext context) {
    final time = new DateFormat.jm().format(DateTime.parse(message.time));
    final msg= Container(
      width: MediaQuery.of(context).size.width*0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(time, style: TextStyle(color: Colors.blueGrey,
              fontWeight: FontWeight.w600,
              fontSize: 16.0),),
          SizedBox(height: 8.0,),
          Text(message.text, style: TextStyle(color: Colors.blueGrey,
              fontWeight: FontWeight.w600,
              fontSize: 16.0),)
        ],
      ),

      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0,),
      decoration: BoxDecoration(
          color: isMe ? Color(0xffffbaba) : Color(0xffffeadb),
          borderRadius: isMe ? BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0)) : BorderRadius.only(
              topRight: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0))
      ),
    );
    if(isMe){
      return msg;
    }
    return Row(
      children: <Widget>[

       msg,
       !message.isLiked? IconButton(
          icon: message.isLiked?Icon(Icons.favorite):Icon(Icons.favorite_border),

          iconSize: 30.0,
          color:message.isLiked?Theme.of(context).primaryColor: Colors.blueGrey,
          onPressed: (){

          },
        ):SizedBox.shrink(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      child: ListView.builder(
          padding: EdgeInsets.only(top: 15.0),
          itemCount: messageList.length,
          itemBuilder: (BuildContext context, int index) {
            final Message message = messageListDemo[index];
            final bool isMe = message.sender.uid == currentUser.uid;

            return _buildMessage(message, isMe,context);
          }),
    );
  }
}
