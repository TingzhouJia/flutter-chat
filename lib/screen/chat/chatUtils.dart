import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_pickers/CropConfig.dart';
import 'package:image_pickers/Media.dart';
import 'package:image_pickers/UIConfig.dart';
import 'package:image_pickers/image_pickers.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/friend/friend_action.dart';
import 'package:learnflutter/redux/messages/message_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/chat/chat_view.dart';
import 'package:learnflutter/screen/friends/friend_screen.dart';
import 'package:learnflutter/screen/friends/strangerScreen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:transparent_image/transparent_image.dart';

import 'callRoom.dart';

class buildMessage extends StatelessWidget {
  Message message;
  bool isMe;
  BuildContext context;
  User me;

  buildMessage(this.message, this.isMe, this.context, this.me, this.target,
      this.isFriend);

  User target;
  bool isFriend;

  _buildBody(Message message,context){
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
      case MessageType.VIDEO:
        return Container(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.0))
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.phone_forwarded),
                Text('You hold a video chat', style: TextStyle(color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0),softWrap: true,)
              ],
            )
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
        final a=message.recommendationInvitation;
        return GestureDetector(
          onTap: (){
            showCupertinoDialog(
                context: context,builder: (context){
              return Material(
                type: MaterialType.transparency,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Loading...',style: TextStyle(fontSize: 16.0,color: Colors.white)),
                      SpinKitFadingCircle(
                        itemBuilder: (BuildContext context,int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.white
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            }
            );
            String k=message.recommendationInvitation.targetId;
//              bool a=false;
//              if(StoreProvider.of<AppState>(context).state.Friends.firstWhere((i)=>i.uid==k)!=null){
//
//                StoreProvider.of<AppState>(context).dispatch(UpdateCurrentTarget(k));
//                a=true;
//              }else{
//                StoreProvider.of<AppState>(context).dispatch(GetStranger(k));
//              }
            StoreProvider.of<AppState>(context).dispatch(SelectChannel(k));

            Future.delayed(Duration(seconds: 2),(){
              Navigator.pop(context);
//                if(a){
//                  Navigator.push(
//                      context, MaterialPageRoute(builder: (_) => FriendScreen()));
//                }else{
//                  Navigator.push(
//                      context, MaterialPageRoute(builder: (_) => StrangerScreen()));
//                }
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => StrangerScreen('REQUEST')));
            });
          },
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))
              ),

              child:  Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey))
                      ),
                      child:Row(
                        children: <Widget>[
                          Text('An Invitation to Group',style: TextStyle(
                              fontSize: 10.0,fontWeight: FontWeight.bold
                          ),),
                        ],
                      )
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 7.0),
                    child:
                    Row(
                      children: <Widget>[
                        ClipOval(
                          child:a.imgUrl==""?Image.asset('assets/group_default.png',width: 40.0,height: 40.0,):
                          FadeInImage.assetNetwork(placeholder: 'assets/group_default.png', image: a.imgUrl,width: 40.0,height: 40.0,),
                        ),
                       SizedBox(
                         width: 10,
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Text(a.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                           ConstrainedBox(
                             constraints: BoxConstraints(maxWidth: 160),
                             child: Text('You have been invitied to join a new group, you can either comfirm join or reject this inivitation'),
                           )
                         ],
                       )
                      ],
                    ),
                  )
                ],
              )
          ),
        );
        break;
      case MessageType.RECOMMEND:
        final a=message.recommendationInvitation;
        return GestureDetector(
          onTap: (){
            showCupertinoDialog(
                context: context,builder: (context){
              return Material(
                type: MaterialType.transparency,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Loading...',style: TextStyle(fontSize: 16.0,color: Colors.white)),
                      SpinKitFadingCircle(
                        itemBuilder: (BuildContext context,int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.white
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            }
            );
            String k=message.recommendationInvitation.targetId;
//              bool a=false;
//              if(StoreProvider.of<AppState>(context).state.Friends.firstWhere((i)=>i.uid==k)!=null){
//
//                StoreProvider.of<AppState>(context).dispatch(UpdateCurrentTarget(k));
//                a=true;
//              }else{
//                StoreProvider.of<AppState>(context).dispatch(GetStranger(k));
//              }
            StoreProvider.of<AppState>(context).dispatch(GetStranger(k));

            Future.delayed(Duration(seconds: 2),(){
              Navigator.pop(context);
//                if(a){
//                  Navigator.push(
//                      context, MaterialPageRoute(builder: (_) => FriendScreen()));
//                }else{
//                  Navigator.push(
//                      context, MaterialPageRoute(builder: (_) => StrangerScreen()));
//                }
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => StrangerScreen('REQUEST')));
            });
          },
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))
              ),

              child:  Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 15.0),
                      decoration: BoxDecoration(

                          border: Border(bottom: BorderSide(color: Colors.grey))
                      ),
                      child:Row(
                        children: <Widget>[
                          Text('A Recommended Friend',style: TextStyle(
                              fontSize: 10.0,fontWeight: FontWeight.bold
                          ),),
                        ],
                      )
                  )
                  ,
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          ),
        );
      default:
        return null;
    }

  }

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

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
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
              onTap: (){
                if(isFriend){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => FriendScreen()));
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (_) => StrangerScreen('REQUEST')));
                }

              },
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
                child: _buildBody(message,context),
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
                child: _buildBody(message,context),
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
  }
}



class BuildKeyboard extends StatefulWidget {
  ChatScreenViewModel vm;
  bool onUse;

  @override
  _BuildKeyboardState createState() => _BuildKeyboardState();

  BuildKeyboard(this.vm,this.onUse);
}

class _BuildKeyboardState extends State<BuildKeyboard> {
  List<Media> _listImagePaths = List();
  TextEditingController _textController = TextEditingController();
  String dataImagePath = "";
  GalleryMode _galleryMode = GalleryMode.image;
  bool isShowEmoji=false;
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
                offstage: widget.onUse,
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
                offstage: !widget.onUse,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  iconSize: 30.0,
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      widget.onUse = false;
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
                        widget.onUse = true;
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
                offstage: !widget.onUse,
                child: IconButton(
                    icon: Icon(Icons.send),
                    iconSize: 30.0,
                    color: Colors.red,
                    onPressed: () => sendMessage()),
              ),
              Offstage(
                offstage: widget.onUse,
                child: IconButton(
                  icon: Icon(Icons.phone),
                  iconSize: 30.0,
                  color: Colors.red,
                  onPressed: () {
                    onJoin(vm.target.user.uid);
                    StoreProvider.of(context).dispatch(SendMessage('',MessageType.VIDEO,[]));
                  },
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
  @override
  Widget build(BuildContext context) {
    return _buildMessageComposer(widget.vm);
  }
}






