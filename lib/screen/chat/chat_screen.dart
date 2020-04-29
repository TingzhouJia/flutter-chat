import 'dart:io';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_pickers/CropConfig.dart';
import 'package:image_pickers/Media.dart';
import 'package:image_pickers/UIConfig.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/model/message_model.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/messages/message_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/chat/ChatList.dart';
import 'package:learnflutter/screen/chat/callRoom.dart';
import 'package:learnflutter/screen/chat/chatDetail.dart';
import 'package:learnflutter/screen/chat/chat_view.dart';
import 'package:learnflutter/screen/friends/friend_screen.dart';
import 'package:learnflutter/screen/main/home_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  MessageType sendType;
  bool isShowEmoji=false;
  List<Media> _listImagePaths = List();
  TextEditingController _textController = TextEditingController();
  String dataImagePath = "";
  GalleryMode _galleryMode = GalleryMode.image;
  FocusNode node=FocusNode();
  Future<void> selectImages() async {
    _galleryMode = GalleryMode.image;
    _listImagePaths = await ImagePickers.pickerPaths(
      galleryMode: _galleryMode,
      selectCount: 8,
      showCamera: true,
      cropConfig: CropConfig(enableCrop: true, height: 1, width: 1),
      compressSize: 500,
      uiConfig: UIConfig(uiThemeColor: Theme.of(context).primaryColor),
    );
    List<String> a = _listImagePaths.map((media) {
      return media.path;
    }).toList();


    StoreProvider.of<AppState>(context).dispatch(SendMessage('', MessageType.MEDIA, a));
  }

  final homeScaffoldKey=new GlobalKey<ScaffoldState>();
  sendMessage() async {
    final content=_textController.text.trim();
    if(content.length==0){
        await showCupertinoDialog(context: context,builder: (context){
          return AlertDialog(
              title: Text('Reminder'),
            content: Text('You cannot send empty message!') ,
            actions: <Widget>[
              FlatButton(
                child: Text('Back'),
                onPressed: ()=>Navigator.of(context).pop(),
              )
            ],
          );
        });
      return;
    }
    StoreProvider.of<AppState>(context)
        .dispatch(SendMessage(_textController.text, MessageType.USER, []));
    _textController.clear();
  }

  bool onUse = false;
  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }


Future<void> onJoin(id) async {
  // update input validation

  await _handleCameraAndMic();
  // push video page with given channel name
  await Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => CallPage(
    roomId:id
  ),
  ));
}
  _buildMessageComposer(ChatScreenViewModel vm) {
    return Stack(
      children: <Widget>[
//        isShowEmoji?buildSticker():Container(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.0),
          height: 70.0,
          color: Theme.of(context).primaryColor,
          child: Row(
            children: <Widget>[
              Offstage(
                offstage: onUse,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.photo_library,
                        color: Colors.white,
                      ),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () {
                        selectImages();
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.photo_camera,
                      ),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () {
                        ImagePickers.openCamera().then((Media media) {
                          /// media 包含照片路径信息 Include photo path information
                          _listImagePaths.add(media);
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.tag_faces,
                        color: Colors.white,
                      ),
                      iconSize: 30.0,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          isShowEmoji=!isShowEmoji;
                        });
                      },
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
                  onPressed: () {
                    setState(() {
                      onUse = false;
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
                    boxShadow: [BoxShadow(color: Colors.white70, blurRadius: 5.0)],
                  ),
                  child: TextField(
                    focusNode: node,
                    controller: _textController,
                    maxLines: 99,
                    autocorrect: true,
                    onTap: () {
                      setState(() {
                        isShowEmoji=false;
                        onUse = true;
                      });
                    },
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration.collapsed(
                      // border: InputBorder.none,
                        hintText: "Aa",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),

              Offstage(
                offstage: !onUse,
                child: IconButton(
                    icon: Icon(Icons.send),
                    iconSize: 30.0,
                    color: Colors.red,
                    onPressed: () => sendMessage()),
              ),
              Offstage(
                offstage: onUse,
                child: GestureDetector(
                  onTap:() {
                    onJoin(vm.target.user.uid);
                    StoreProvider.of(context).dispatch(SendMessage('',MessageType.VIDEO,[]));
                  },
                  child: IconButton(
                    icon: Icon(Icons.phone),
                    iconSize: 30.0,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ),

      ],
    );
//      WillPopScope(
//
//      child: ,
//      onWillPop: onBackPress,
//    );
  }

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
                child: ChatList(),
              ),
            ),
            _buildMessageComposer(vm)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChatScreenViewModel>(
      converter: ChatScreenViewModel.fromStore(),
      builder: (context, vm) => _built(context, vm),
      distinct: true,
    );
  }
}
