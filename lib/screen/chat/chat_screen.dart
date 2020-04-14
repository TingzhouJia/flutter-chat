import 'package:flutter/material.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/model/message_model.dart';
import 'package:learnflutter/widgets/ChatList.dart';
class ChatScreen extends StatefulWidget {
  final String userID;

  ChatScreen({this.userID});


  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool onUse=false;
  _buildMessageComposer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(

        children: <Widget>[

         Offstage(
           offstage: onUse,
           child: Row(
             children: <Widget>[
               IconButton(
                 icon: Icon(Icons.photo_library),
                 iconSize: 30.0,
                 color: Colors.blue,

               ),
               IconButton(
                 icon: Icon(Icons.photo_camera),
                 iconSize: 30.0,
                 color: Colors.red,

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
              height: 45,
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
                decoration: InputDecoration.collapsed(

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(

        title: Text(widget.user.name,style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.bold)),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () => {},
          ),
        ],
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
}
