import 'package:flutter/material.dart';
import 'package:learnflutter/model/message_model.dart';
class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount:messageList.length,itemBuilder:(BuildContext context,int index){
      return Text(messageList[index].text);
    });
  }
}
