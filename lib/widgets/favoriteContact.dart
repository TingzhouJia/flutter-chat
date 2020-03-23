import 'package:flutter/material.dart';
import 'package:learnflutter/model/message_model.dart';
import 'package:learnflutter/screen/chat_screen.dart';
class FavoriteContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child:  Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Favorite Contacts",style: TextStyle(color: Colors.blueGrey,fontSize: 18.0,fontWeight: FontWeight.bold,letterSpacing: 1.5),),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  iconSize: 30.0,
                  color: Colors.blueGrey,
                  onPressed: (){},

                )
              ],
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
                padding: EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: favoriteList.length,
                itemBuilder: (BuildContext context,int index){
                  return
                  GestureDetector(
                    onTap:()=> Navigator.push(context,MaterialPageRoute(builder: (_)=>ChatScreen(user: favoriteList[index],))),
                    child:  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 35.0,
                            backgroundImage: AssetImage(favoriteList[index].imgUrl),),
                          Text(
                            favoriteList[index].name,
                            style: TextStyle(
                                color:Colors.blueGrey,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(height:6.0),


                        ],
                      ),
                    ),
                  )
                   ;
                }),
          )
        ],
      ),
    );
  }
}
