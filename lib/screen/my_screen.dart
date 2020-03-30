import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:io';

import 'package:learnflutter/screen/a.dart';
import 'package:learnflutter/service/userInfoService.dart';
import 'package:learnflutter/widgets/InfoList.dart';

class MyProfile extends StatefulWidget {
  LinkedHashMap info;
  UserInfo myInfo;

  MyProfile(this.info, this.myInfo);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      appBar: PreferredSize(

          preferredSize: Size.fromHeight(45.0),
          child: Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              actions: <Widget>[

                GestureDetector(

                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Finished", style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 22.0), textAlign: TextAlign.center,),
                ),
                SizedBox(width: 15,)
              ],
            ),
          )
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(

                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Container(

                    margin: EdgeInsets.only(top: 15.0, bottom: 10.0),
                    // A fixed-height child.
                    child: Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,

                          radius: 60.0,
                          backgroundImage: widget.info == null ? AssetImage(
                              "assets/male1.jpg") : NetworkImage(
                              widget.info['imgUrl']),
                        ),
                        Positioned(
                          bottom: 0,
                          right: -15.0,
                          child: Container(
                            width: 35.0,


                            decoration: BoxDecoration(

                                color: Colors.white,
                                shape: BoxShape.circle
                            ),

                            child: IconButton(
                              iconSize: 20.0,
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            MyHomePage(
                                              imageFile: widget.info['imgUrl'],
                                              userInfo: widget.myInfo,
                                            )));
                              },
                              icon: Icon(
                                Icons.photo_camera, color: Colors.grey,),

                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Text(widget.info == null ? 'User' : widget.info['name'],
                    style: TextStyle(fontSize: 26.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),),
                  SizedBox(height: 10,),
                  InfoList(info: 'Username',
                      index: widget.info == null ? null : widget.info['name']),
                  InfoList(info: 'Location',
                      index: widget.info == null ? null : widget
                          .info['address']),
                  InfoList(info: 'Gender',
                    index: widget.info == null ? null : widget.info['gender'],),
                  InfoList(info: 'Birthday',
                      index: widget.info == null ? null : new DateFormat(
                          "yyyy-MM-dd ").format(
                          widget.info['birthday'].toDate())),
                  Container(

                      child: Column(
                        children:<Widget>[
                      Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20.0),

                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(width: 1.0, color: Colors
                                        .white))
                            ),
                            child:  Text('Introduction',style: TextStyle(
                                  color: Colors.white,
                                  fontWeight:FontWeight.w600 ,fontSize: 20.0
                              ),)
                          )

                        ],
                      ),
                      Container(
                        height: 100,
                        child: TextField(

                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: widget.info??'Add some description for yourself, and let more people know you'
                          ),
                        ),
                      )
                ],
              ),
            )
            ],
          ),)
          );
        },
      ),


    );
  }
}
