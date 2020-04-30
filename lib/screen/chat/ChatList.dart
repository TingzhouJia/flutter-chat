


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learnflutter/model/message.dart';

import 'package:intl/intl.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/friend/friend_action.dart';
import 'package:learnflutter/redux/messages/message_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/chat/chat_view.dart';
import 'package:learnflutter/screen/friends/friend_screen.dart';
import 'package:learnflutter/screen/friends/friend_select.dart';
import 'package:learnflutter/screen/friends/strangerScreen.dart';
import 'package:transparent_image/transparent_image.dart';

import 'chatUtils.dart';

class ChatList extends StatelessWidget {

  bool isGroup;


  ChatList(this.isGroup);

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
                  child:  Scrollbar(
                    child: ListView.builder(
                        reverse: true,
                        padding: EdgeInsets.only(top: 15.0),
                        itemCount: vm.messageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Message message = vm.messageList[index];
                          final bool isMe = message.authorId == vm.me.uid;
                          final bool isFriend=isGroup?vm.group.users.indexWhere((k)=>k.uid==message.authorId)>=0:true;
                          final target=isGroup?vm.group.users.firstWhere((user)=>user.uid==message.authorId):vm.target.user;
                          return buildMessage(message, isMe,context,vm.me,target,isFriend);
                        }),
                  ),
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
      converter: ChatScreenViewModel.fromStore(isGroup),
      builder: (context,vm)=>_buildView(context, vm),
      distinct: true,
    );
  }


}
