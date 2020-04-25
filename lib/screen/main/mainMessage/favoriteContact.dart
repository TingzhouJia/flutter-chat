import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/model/message_model.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/friend/friend_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/redux/userRedux/user_action.dart';
import 'package:learnflutter/screen/chat/chat_screen.dart';
class FavoriteContact extends StatelessWidget {
  BuiltList<User> favor;

  FavoriteContact(this.favor);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child:  Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Favorite Contacts",style: TextStyle(color: Colors.blueGrey,fontSize: 18.0,fontWeight: FontWeight.bold,letterSpacing: 1.5),),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  iconSize: 30.0,
                  color: Colors.blueGrey,
                  onPressed: (){
                  },
                )
              ],
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
                padding: EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: favor.length,
                itemBuilder: (BuildContext context,int index){
                  var favorOne=favor[index];
                  return GestureDetector(
                      onTap:(){
                        StoreProvider.of<AppState>(context).dispatch(UpdateCurrentTarget(favorOne.uid));
                        StoreProvider.of<AppState>(context).dispatch(SelectChat(favorOne.uid));
                        Navigator.push(context,MaterialPageRoute(builder: (_)=>ChatScreen()));
                      },
                      onLongPress: ()=>{

                      },
                      child:  Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 30.0,
                                backgroundImage: favorOne.imgUrl==""? AssetImage('assets/male1.jpg')
                                    : NetworkImage(favorOne.imgUrl)),
                            Text(
                              favorOne.name,
                              style: TextStyle(
                                  color:Colors.blueGrey,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                }),
          )
        ],
      ),
    );
  }
}
