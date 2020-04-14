import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:learnflutter/model/message_model.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/screen/chat/chat_screen.dart';
class FavoriteContact extends StatelessWidget {
  BuiltList<User> favor;

  FavoriteContact(this.favor);

//  final  currentUser= User((b)=>b ..uid='0' ..name="Current" ..imgUrl='assets/female1.jpg' ..lastOnline=DateTime.now() ..birthday=DateTime.now() ..description='goof' ..gender=1 ..address="aaa" ..status="aaa");
//  final  james= User((b)=>b ..uid='1' ..name="james" ..imgUrl='assets/female2.jpg' ..lastOnline=DateTime.now() ..birthday=DateTime.now() ..description='goof' ..gender=1 ..address="aaa" ..status="aaa");
//  final  kevin= User((b)=>b ..uid='2' ..name="kevin" ..imgUrl='assets/female1.jpg' ..lastOnline=DateTime.now() ..birthday=DateTime.now() ..description='goof' ..gender=1 ..address="aaa" ..status="aaa");
//  final  nacho= User((b)=>b ..uid='3' ..name="nacho" ..imgUrl='assets/male1.jpg' ..lastOnline=DateTime.now() ..birthday=DateTime.now() ..description='goof' ..gender=1 ..address="aaa" ..status="aaa");
//  final  mila= User((b)=>b ..uid='4' ..name="mila" ..imgUrl='assets/male3.jpgg' ..lastOnline=DateTime.now() ..birthday=DateTime.now() ..description='goof' ..gender=1 ..address="aaa" ..status="aaa");
//  final  henry= User((b)=>b ..uid='5' ..name="henry" ..imgUrl='assets/male4.jpg' ..lastOnline=DateTime.now() ..birthday=DateTime.now() ..description='goof' ..gender=1 ..address="aaa" ..status="aaa");
//

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
            height: 120,
            child: ListView.builder(
                padding: EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: favor.length,
                itemBuilder: (BuildContext context,int index){
                  var favorOne=favor[index];
                  return GestureDetector(
                      onTap:(){
                        Navigator.push(context,MaterialPageRoute(builder: (_)=>ChatScreen(username: favorOne.name,)));
                      },
                      onLongPress: ()=>{

                      },
                      child:  Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 35.0,
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
