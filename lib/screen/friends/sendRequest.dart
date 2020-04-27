import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/model/stranger.dart';
import 'package:learnflutter/redux/friend/friend_action.dart';
import 'package:learnflutter/redux/state.dart';

class SendRequest extends StatefulWidget {
  final Stranger target;

  SendRequest(this.target);

  @override
  _SendRequestState createState() => _SendRequestState();
}

class _SendRequestState extends State<SendRequest> {
  TextEditingController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=new TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 20.0,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        elevation: 0.0,
        actions: <Widget>[
          GestureDetector(
          onTap: (){
              StoreProvider.of<AppState>(context).dispatch(AddFriend(widget.target.uid,_controller.text));
              },
            child: Row(
              children: <Widget>[
                Container(
                    margin:EdgeInsets.only(right: 15.0),
                    padding:EdgeInsets.symmetric(vertical:10.0,horizontal: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(3.0))
                        ,
                      color: Color(0xff1aad19),
                    ),

                    child: Text('Send',style: TextStyle(color: Colors.white),)
                )
              ],
            ),
          )

        ],

      ),
      body:  GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0))),
                    child: SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: 0),
                        child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: viewportConstraints.maxHeight,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 30.0),
                                    padding: EdgeInsets.symmetric(vertical: 15.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Send Friend Request',style: TextStyle(
                                            color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22.0
                                        ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,

                                    children: <Widget>[
                                      Text('Send message in request',style: TextStyle(color: Colors.grey,fontSize: 17.0),),
                                      SizedBox(height: 10.0,),
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xfff1f1f1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color(0xfff2f6f5),
                                                  offset: Offset(-5, -1.0),
                                                  blurRadius: 3.0),
                                              BoxShadow(
                                                  color:
                                                  Colors.grey.withOpacity(0.4),
                                                  offset: Offset(0, 1.0),
                                                  spreadRadius: 0.5,
                                                  blurRadius: 3.0),
                                              //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                                            ]),
                                        child:  Container(
                                          height: 100.0,
                                          padding: EdgeInsets.only(top: 5.0, left: 20.0),
                                          child: TextField(
                                            onTap: (){

                                            },
                                            maxLines: 5,
                                            controller: _controller,
                                            onChanged: (value){


                                            },

                                            textAlign: TextAlign.justify,
                                            decoration: InputDecoration(
                                                contentPadding: EdgeInsets.all(2.0),
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                border: InputBorder.none,
                                                hintText: 'I am ${StoreProvider.of<AppState>(context).state.user.name}'
                                                    ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Set remarks for friend',style: TextStyle(color: Colors.grey,fontSize: 17.0),),
                                      SizedBox(height: 10.0,),
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xfff1f1f1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color(0xfff2f6f5),
                                                  offset: Offset(-5, -1.0),
                                                  blurRadius: 3.0),
                                              BoxShadow(
                                                  color:
                                                  Colors.grey.withOpacity(0.4),
                                                  offset: Offset(0, 1.0),
                                                  spreadRadius: 0.5,
                                                  blurRadius: 3.0),
                                              //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                                            ]),
                                        child:  Container(
                                          height: 100.0,
                                          padding: EdgeInsets.only(top: 5.0, left: 20.0),
                                          child: TextField(
                                            onTap: (){

                                            },
                                            maxLines: 5,
                                            controller: _controller,
                                            onChanged: (value){


                                            },

                                            textAlign: TextAlign.justify,
                                            decoration: InputDecoration(
                                                contentPadding: EdgeInsets.all(2.0),
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                border: InputBorder.none,
                                                hintText: 'I am ${StoreProvider.of<AppState>(context).state.user.name}'
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ))),
                  ),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}
