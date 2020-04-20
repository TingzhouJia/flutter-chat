


import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/model/message.dart';

import 'package:intl/intl.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/chat/chat_view.dart';

class ChatList extends StatelessWidget {


  _buildMessage(Message message, bool isMe,BuildContext context,User me,) {
    final time = new DateFormat.jm().format(DateTime.parse(message.timestamp.toString()));
    final msg= Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Text(time, style: TextStyle(color: Colors.blueGrey,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0),),
              SizedBox(height: 8.0,),
              Text(message.body, style: TextStyle(color: Colors.blueGrey,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0),)
            ],
          )
        ],
      ) ,

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
//    if(isMe){
//      return msg;
//    }
//    return Row(
//      children: <Widget>[
//
//       msg,
//       !message.isLiked? IconButton(
//          icon: message.isLiked?Icon(Icons.favorite):Icon(Icons.favorite_border),
//
//          iconSize: 30.0,
//          color:message.isLiked?Theme.of(context).primaryColor: Colors.blueGrey,
//          onPressed: (){
//
//          },
//        ):SizedBox.shrink(),
//      ],
//    );
  return msg;
  }

  _buildView(context,ChatScreenViewModel vm){
    return GestureDetector(

      child:ClipRRect(

        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/loadingPage.jpeg'),repeat: ImageRepeat.noRepeat,fit: BoxFit.cover)
              ),
            ),
            Column(
              children: <Widget>[
                Expanded(
                  child:  ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.only(top: 15.0),
                      itemCount: vm.messageList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Message message = vm.messageList[index];
                        final bool isMe = message.authorId == vm.me.uid;
                        return _buildMessage(message, isMe,context,vm.me,);
                      }),
                )
              ],
            )
          ],
        ),
      ) ,
    ) ;
  }
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,ChatScreenViewModel>(
      converter: ChatScreenViewModel.fromStore(),
      builder: (context,vm)=>_buildView(context, vm),
      distinct: true,
    );
  }
}
