import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:learnflutter/model/message_model.dart';
import 'package:learnflutter/model/stranger.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/friend/friend_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/chat/chat_screen.dart';
import 'package:learnflutter/screen/friends/strangerScreen.dart';
import 'package:learnflutter/screen/main/mainRequests/request_view.dart';
import 'package:learnflutter/widgets/loading.dart';
class RequestFriends extends StatefulWidget {
  @override
  _RequestFriendsState createState() => _RequestFriendsState();
}


class _RequestFriendsState extends State<RequestFriends> {
  List<Stranger> a=new List();

  @override
  void initState(){
    super.initState();

  }

  _buildView(context,RequestScreenViewModel vm){
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0)),
          child:
          ListView.builder(
              //itemCount: vm.requesterList.length,
            itemCount: onlineUsers.length,
              itemBuilder: (BuildContext context, int index) {
                //Stranger each=vm.requesterList[index];
                User each=onlineUsers[index];
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 25.0,
                                backgroundImage: AssetImage(each.imgUrl),
                              ),
                              SizedBox(width: 10.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    each.name,
                                    style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "I am ${each.name}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          onTap: (){

                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 7),
                                decoration: BoxDecoration(
                                    color: Color(0xfff0efef),
                                    borderRadius: BorderRadius.all(Radius.circular(3.0))
                                ),
                                child: Text('remove',style: TextStyle(color: Colors.black54),),
                              ),
                              onTap: (){
                                StoreProvider.of(context).dispatch(RefuseAddFriend(each.uid));
                                Navigator.of(context).pop();
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 7),
                                decoration: BoxDecoration(
                                    color: Color(0xff1aad19),
                                    borderRadius: BorderRadius.all(Radius.circular(3.0))
                                ),
                                child: Text('agree',style: TextStyle(color: Colors.white),),
                              ),
                              onTap: (){
                                   circularLoading(context,'Preparing');
                                   StoreProvider.of(context).dispatch(AgreeAddFriend(each.uid,each.imgUrl));
                                   Future.delayed(Duration(seconds: 2),(){
                                     Navigator.pop(context);
                                     Navigator.of(context).pop();

                                   });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
          )
          ,







        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,RequestScreenViewModel>(
      converter: RequestScreenViewModel.fromStore(),
      builder: (context,vm)=>_buildView(context, vm),
      distinct: true,
    ) ;
  }
}
