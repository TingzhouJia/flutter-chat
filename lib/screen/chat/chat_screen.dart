
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/model/message_model.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/messages/message_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/chat/ChatList.dart';
import 'package:learnflutter/screen/chat/chat_view.dart';
import 'package:learnflutter/screen/friends/friend_screen.dart';
class ChatScreen extends StatefulWidget {





  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  File _imageFile;
  dynamic _pickImageError;
  bool isVideo = false;
//  VideoPlayerController _controller;
  String _retrieveDataError;
  void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {

    if (isVideo) {
      final File file = await ImagePicker.pickVideo(source: source);
      //await _playVideo(file);
    } else {
              File imageFile = await ImagePicker.pickImage(source: source,);
              setState(() {
                _imageFile=imageFile;
              });

    }
  }

  bool onUse=false;
  _buildMessageComposer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      height:  70.0,
      color: Theme.of(context).primaryColor,
      child: Row(

        children: <Widget>[

         Offstage(
           offstage: onUse,
           child: Row(
             children: <Widget>[
               IconButton(
                 icon: Icon(Icons.photo_library,color: Colors.white,),
                 iconSize: 30.0,
                 color: Colors.white,

               ),
               IconButton(
                 icon: Icon(Icons.photo_camera,),
                 iconSize: 30.0,
                 color: Colors.white,
                 onPressed: (){

                 },
               ),
               IconButton(
                 icon: Icon(Icons.phone),
                 iconSize: 30.0,
                 color: Colors.red,

               ),
             ],
           ),
         ),
          Offstage(
            offstage: !onUse,
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              iconSize: 30.0,
              color: Colors.red,
              onPressed: (){
                setState(() {
                  onUse=false;
                });
              },
            ),
          ),
          Expanded(
            
            child: Container(
             alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 3.0),
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Color(0xfff3f8ff),
                boxShadow: [BoxShadow(color: Colors.white70,blurRadius: 5.0)],
              ),
              child: TextField(
              autocorrect: true,
                onTap: (){setState(() {
                  onUse=true;
                });},

                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  border: InputBorder.none,
                    hintText: "Aa",
                    hintStyle: TextStyle(color: Colors.grey)
                ),
              ),
            ),
          )
          ,
          Offstage(
            offstage: !onUse,
            child: IconButton(
              icon: Icon(Icons.send),
              iconSize: 30.0,
              color: Colors.red,

            ),
          ),
          Offstage(
            offstage: onUse,
            child: IconButton(
              icon: Icon(Icons.thumb_up),
              iconSize: 30.0,
              color: Colors.red,

            ),
          )
        ],
      ),
    );
  }
  _built(context,ChatScreenViewModel vm){
    return  Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          centerTitle: true,

          title: Text(vm.target.name,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold, color: Color(0xff333333))),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              iconSize: 30.0,
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FriendScreen()));
              },
            ),
          ],
        ),
      ),
      body:
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            onUse=false;
          });
        },
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child:  Container(
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

      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,ChatScreenViewModel>(
      converter: ChatScreenViewModel.fromStore(),
      builder: (context,vm)=>_built(context, vm),
      distinct: true,
    );
  }
}
