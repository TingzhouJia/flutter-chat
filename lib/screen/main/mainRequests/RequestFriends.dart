import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:learnflutter/model/message_model.dart';
import 'package:learnflutter/model/stranger.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/main/mainRequests/request_view.dart';
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
//            borderRadius: BorderRadius.only(
//                topLeft: Radius.circular(30.0),
//                topRight: Radius.circular(30.0))),
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
                      children: <Widget>[
                        Row(
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
                        Row(
                          children: <Widget>[
                            Container(

                            ),
                            Container(

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
