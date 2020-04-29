import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/model/friend.dart';
import 'package:learnflutter/redux/friend/friend_action.dart';
import 'package:learnflutter/redux/messages/message_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/chat/chat_detail_view.dart';
import 'package:learnflutter/screen/friends/friend_screen.dart';
import 'package:learnflutter/screen/friends/friend_select.dart';
import 'package:learnflutter/utils/bottomUpAnimation.dart';
import 'package:learnflutter/utils/helper.dart';

class ChatDetail extends StatefulWidget {
  @override
  _ChatDetailState createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  bool notification;
  bool strong_notification;
  bool setTop;


  _buildView(context, ChatDetailViewModel vm){
    notification=vm.target.notification;
    strong_notification=vm.target.strongNotification;
    setTop=vm.target.setTop;
    return Scaffold(
      backgroundColor:Theme.of(context).primaryColor,
      appBar:AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Chat Details' ),
      ) ,
      body:LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                     Radius.circular(30.0))),
            child: SingleChildScrollView(
              child:Column(
                children: <Widget>[
                  Container(

                    margin: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 10,right: 10),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        //border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(color: Color(0xfff2f6f5),offset: Offset(-5,-1.0),blurRadius: 3.0),
                          BoxShadow(color: Colors.grey.withOpacity(0.4),offset: Offset(0,1.0),spreadRadius: 0.5,blurRadius: 3.0),
                          //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (_) => FriendScreen()));
                          },
                          child: CircleAvatar(
                            radius: 25.0,
                            backgroundImage:  vm.target.user.imgUrl==""?AssetImage('assets/default_img.jpg'):NetworkImage(vm.target.user.imgUrl),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(color: Color(0xfff2f6f5),offset: Offset(-5,-1.0),blurRadius: 3.0),
                                BoxShadow(color: Colors.grey.withOpacity(0.4),offset: Offset(0,1.0),spreadRadius: 0.5,blurRadius: 3.0),
                                //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                              ]
                          ),
                          child: IconButton(
                            iconSize: 25.0,
                            icon: Icon(Icons.add),
                            onPressed: (){
                              jumpToProfile(
                                      (BuildContext context, Animation animation,
                                      Animation secondaryAnimation) =>
                                      FriendSelect(SYSTEM_DISPATCH.GROUP),
                                  context);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(

                    margin: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 10,right: 10),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        //border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(color: Color(0xfff2f6f5),offset: Offset(-5,-1.0),blurRadius: 3.0),
                          BoxShadow(color: Colors.grey.withOpacity(0.4),offset: Offset(0,1.0),spreadRadius: 0.5,blurRadius: 3.0),
                          //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Search information in chat',
                          style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(color: Color(0xfff2f6f5),offset: Offset(-5,-1.0),blurRadius: 3.0),
                                BoxShadow(color: Colors.grey.withOpacity(0.4),offset: Offset(0,1.0),spreadRadius: 0.5,blurRadius: 3.0),
                                //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                              ]
                          ),
                          child: IconButton(
                            iconSize: 25.0,
                            icon: Icon(Icons.search),
                            onPressed: (){

                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 10,right: 10),
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Color(0xfffafafa),
                        //border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(color: Color(0xfff2f6f5),offset: Offset(-5,-1.0),blurRadius: 3.0),
                          BoxShadow(color: Colors.grey.withOpacity(0.4),offset: Offset(0,1.0),spreadRadius: 0.5,blurRadius: 3.0),
                          //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                        ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                       Container(
                         padding:EdgeInsets.symmetric(vertical: 15.0),
                         child:  Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: <Widget>[
                                 Text(
                                   'Notification',style: TextStyle(
                                     fontSize: 18.0,
                                     fontWeight: FontWeight.bold,
                                     color: Color(0xff0c0b0f)
                                 ),

                                 ),
                                 notification?Text(
                                     'Receive messages but not notified'
                                 ):SizedBox(width: 0,)
                               ],
                             ),
                             CupertinoSwitch(
                               value: notification,
                               onChanged: (_){
                                StoreProvider.of<AppState>(context).dispatch(UpdateSetting(FriendSetting.NOTIFICATION,!notification));

                               },
                             )
                           ],
                         ),
                         decoration: BoxDecoration(
                           border:Border(bottom: BorderSide(color: Color(0xffe3e3e3)))
                         ),
                       ),
                        Container(
                          padding:EdgeInsets.symmetric(vertical: 15.0),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Strong Notification',style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff0c0b0f)
                                  ),

                                  ),
                                  strong_notification?Text(
                                      'Receive messages and remind by email'
                                  ):SizedBox(width: 0,)
                                ],
                              ),
                              CupertinoSwitch(
                                value: strong_notification,
                                onChanged: (_){
                                  StoreProvider.of<AppState>(context).dispatch(UpdateSetting(FriendSetting.STRONG_NOTIFICATION,!strong_notification));

                                },
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border:Border(bottom: BorderSide(color: Color(0xffe3e3e3)))
                          ),
                        ),
                        Container(
                          padding:EdgeInsets.symmetric(vertical: 15.0),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Set-Top',style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff0c0b0f)
                                  ),

                                  ),
                                  setTop?Text(
                                      'Always show message on recent chat '
                                  ):SizedBox(width: 0,)
                                ],
                              ),
                              CupertinoSwitch(
                                value: setTop,
                                onChanged: (_){
                                  StoreProvider.of<AppState>(context).dispatch(UpdateSetting(FriendSetting.SET_TOP,!setTop));
                                },
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              border:Border(bottom: BorderSide(color: Color(0xffe3e3e3)))
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 10,right: 10),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        //border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(color: Color(0xfff2f6f5),offset: Offset(-5,-1.0),blurRadius: 3.0),
                          BoxShadow(color: Colors.grey.withOpacity(0.4),offset: Offset(0,1.0),spreadRadius: 0.5,blurRadius: 3.0),
                          //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                        ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Setup background image', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(color: Color(0xfff2f6f5),offset: Offset(-5,-1.0),blurRadius: 3.0),
                                    BoxShadow(color: Colors.grey.withOpacity(0.4),offset: Offset(0,1.0),spreadRadius: 0.5,blurRadius: 3.0),
                                    //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                                  ]
                              ),
                              child: IconButton(
                                iconSize: 25.0,
                                icon: Icon(Icons.arrow_forward_ios),
                                onPressed: (){

                                },
                              ),
                            )

                          ],
                        )


                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 10,right: 10),
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        //border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(color: Color(0xfff2f6f5),offset: Offset(-5,-1.0),blurRadius: 3.0),
                          BoxShadow(color: Colors.grey.withOpacity(0.4),offset: Offset(0,1.0),spreadRadius: 0.5,blurRadius: 3.0),
                          //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                        ]
                    ),
                    child:GestureDetector(
                      onTap: (){
                        showCupertinoDialog(context: context, builder: (context){
                            return CupertinoAlertDialog(
                              content: Text('Are you sure to delete all records'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Cancel'),
                                  onPressed: ()=>Navigator.of(context).pop(),
                                ),
                                FlatButton(
                                  child: Text('Delete'),
                                  onPressed: (){
                                    StoreProvider.of(context).dispatch(DeleteAllMessage());
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[ Text(
                          'Clean Up Chat Rcord',
                          style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.redAccent),

                        )],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 10,right: 10),
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        //border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(color: Color(0xfff2f6f5),offset: Offset(-5,-1.0),blurRadius: 3.0),
                          BoxShadow(color: Colors.grey.withOpacity(0.4),offset: Offset(0,1.0),spreadRadius: 0.5,blurRadius: 3.0),
                          //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                        ]
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Complaint', style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(color: Color(0xfff2f6f5),offset: Offset(-5,-1.0),blurRadius: 3.0),
                                    BoxShadow(color: Colors.grey.withOpacity(0.4),offset: Offset(0,1.0),spreadRadius: 0.5,blurRadius: 3.0),
                                    //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                                  ]
                              ),
                              child: IconButton(
                                iconSize: 25.0,
                                icon: Icon(Icons.arrow_forward_ios),
                                onPressed: (){

                                },
                              ),
                            )

                          ],
                        )


                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ) ,
            ),
          ) ;
        },
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,ChatDetailViewModel>(
      converter: ChatDetailViewModel.fromStore(),
      builder: (context,vm)=>_buildView(context,vm),
      distinct: true,
    );
  }
}
