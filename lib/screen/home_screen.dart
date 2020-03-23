import 'package:flutter/material.dart';
import 'package:learnflutter/widgets/RecentChats.dart';
import 'package:learnflutter/widgets/categorySelector.dart';
import 'package:learnflutter/widgets/favoriteContact.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() =>_HomeScreenState();

}
class _HomeScreenState extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.menu),iconSize: 30.0,color: Colors.white,onPressed:()=>{},),
          title: Text('Chats',style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold),),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search),iconSize: 30.0,color: Colors.white,onPressed:()=>{},),
          ],
        ),
        body:Column(
          children: <Widget>[
            CategorySelector(),
            Expanded(
              child:  Container(
                height: 500.0,
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)
                    )),
                child: Column(
                  children: <Widget>[
                      FavoriteContact(),
                     RecentChat()
                  ],
                ),
              )
              ,
            )

          ],
        ),
   );
  }

}