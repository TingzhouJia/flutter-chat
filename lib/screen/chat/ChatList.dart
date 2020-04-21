


import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/model/message.dart';

import 'package:intl/intl.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/chat/chat_view.dart';
import 'package:transparent_image/transparent_image.dart';

class ChatList extends StatelessWidget {

  _buildBody(Message message){
    if(message.messageType==MessageType.USER){
      return Text(message.body, style: TextStyle(color: Colors.blueGrey,
          fontWeight: FontWeight.w600,
          fontSize: 16.0),);
    }else{
      if(message.media.length==1){
        return FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: message.media[0],height: 200, width: 200,);
      }else{
        return(
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, //每行三列
                    childAspectRatio: 1.0 //显示区域宽高相等
                ),
                itemCount: message.media.length,
                itemBuilder: (context, index) {

                  return FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: message.media[index]);
                }
            )
        );
      }
    }
  }

  _buildMessage(Message message, bool isMe,BuildContext context,User me,User target) {

    final curwidth=MediaQuery.of(context).size.width;
    final msg= Container(
      width: curwidth,
      decoration: BoxDecoration(

      ),
      child:!isMe? Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 20.0,
            backgroundImage: target.imgUrl==""?AssetImage('assets/default_img.jpg'):NetworkImage(target.imgUrl),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
            decoration: BoxDecoration(
                color:  Colors.white,
                borderRadius:  BorderRadius.all(Radius.circular(15.0))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildBody(message)
              ],
            ),
          )
        ],
      ):Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.0))
                    
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
//                Text(message.body, style: TextStyle(color: Colors.blueGrey,
//                    fontWeight: FontWeight.w600,
//                    fontSize: 16.0),)
              _buildBody(message)
              ],
            ),
          ),
          SizedBox(
            width: 5,
          ),
        CircleAvatar(
        radius: 20.0,
        backgroundImage: me.imgUrl==""?AssetImage('assets/default_img.jpg'):NetworkImage(me.imgUrl),
      )
        ],
      ) ,
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
//      margin: isMe
//          ? EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80.0)
//          : EdgeInsets.only(top: 8.0, bottom: 8.0,right: 80.0),

    );

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
                  child:  Scrollbar(
                    child: ListView.builder(

                        reverse: true,
                        padding: EdgeInsets.only(top: 15.0),
                        itemCount: vm.messageList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Message message = vm.messageList[index];
                          final bool isMe = message.authorId == vm.me.uid;
                          return _buildMessage(message, isMe,context,vm.me,vm.target );
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
      converter: ChatScreenViewModel.fromStore(),
      builder: (context,vm)=>_buildView(context, vm),
      distinct: true,
    );
  }
}
