


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/model/message.dart';

import 'package:intl/intl.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/messages/message_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/chat/chat_view.dart';
import 'package:learnflutter/screen/friends/friend_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class ChatList extends StatelessWidget {

    _buildSnackBar(Message message,context){
      return SnackBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
//        shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.only(topLeft:Radius.circular(22),topRight:Radius.circular(22))),
        content: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

             GestureDetector(
               child:  Text(
                 'Delete',style: TextStyle(color: Colors.black,fontSize: 20.0),
               ),
               onTap: (){

                  StoreProvider.of<AppState>(context).dispatch(DeleteMessage(message.id));

               },
             ),
              Text(
                'Repost',style: TextStyle(color: Colors.black,fontSize: 20.0),
              ),
              Text(
                'Copy',style: TextStyle(color: Colors.black,fontSize: 20.0),

              )
            ],
          ),
        ),
      );
    }


  _buildBody(Message message){
      switch(message.messageType){

        case MessageType.USER:
          return  Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.0))
            ),
            child:  Text(message.body, style: TextStyle(color: Colors.blueGrey,
                fontWeight: FontWeight.w600,
                fontSize: 16.0),softWrap: true,)
        );



        case MessageType.MEDIA:
          if(message.media.length==1){
            return ClipRRect(
              borderRadius: BorderRadius.circular(8.0),

              child: Image.network(

                message.media[0],
                fit: BoxFit.cover, width: 200,height: 200,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null)
                    return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                          : null,
                    ),
                  );
                },
              ),
              //FadeInImage.assetNetwork(placeholder: 'assets/loadinggif.gif' , image: message.media[0],fit: BoxFit.cover, width: 200,height: 200,)
            );

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
          break;
        case MessageType.INVITATION:
          // TODO: Handle this case.
          break;
        case MessageType.RECOMMEND:
          final a=message.recommendationInvitation;
          return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))
              ),

            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            constraints: BoxConstraints(minWidth: 200),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey))
                            ),
                            child: Text('A Recommended Friend',style: TextStyle(
                                fontSize: 10.0,fontWeight: FontWeight.bold
                            ),),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child:
                        Row(

                          children: <Widget>[
                            ClipOval(
                              child:a.imgUrl==""?Image.asset('assets/default_img.jpg',width: 40.0,height: 40.0,): FadeInImage.assetNetwork(placeholder: 'assets/default_img.jpg', image: a.imgUrl,width: 40.0,height: 40.0,),
                            ),
                            Text(a.name)
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
          );
        default:
          return null;
      }
    if(message.messageType==MessageType.USER){

    }else if(message.messageType==MessageType.MEDIA){

    }
  }

  _buildMessage(Message message, bool isMe,BuildContext context,User me,User target) {

    final msg=ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 300),
      child: Container(

        child:!isMe? Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage: target.imgUrl==""?AssetImage('assets/default_img.jpg'):NetworkImage(target.imgUrl),
              ),
              onTap: ()=>  Navigator.push(
                  context, MaterialPageRoute(builder: (_) => FriendScreen())),
            )
            ,
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onLongPress: ()async{
                final snackBar=_buildSnackBar(message,context);
                Scaffold.of(context).showSnackBar(snackBar);

              },
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 230.0),
                child: _buildBody(message),
              ),
            )
          ],
        ):Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              onLongPress: () async {
                final snackBar=_buildSnackBar(message,context);
                Scaffold.of(context).showSnackBar(snackBar);
              },
              child:ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 230.0),
                child: _buildBody(message),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            CircleAvatar(
              radius: 20.0,
              backgroundImage: me.imgUrl==""?AssetImage('assets/default_img.jpg'):NetworkImage(me.imgUrl),
            ),
          ],
        ) ,
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),


      ) ,
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
                          return _buildMessage(message, isMe,context,vm.me,vm.target.user );
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
