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
  Function SignOutFunc;
  MyProfile(this.info,this.myInfo,this.SignOutFunc);

  MyProfile.origin(this.myInfo);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController _textEditingController;
  String Intro;
  bool onUse=false;
  @override
  void initState() {
    // TODO: implement initState
    _textEditingController = new TextEditingController();
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();

  }

  void submit() async {
      await widget.myInfo.setUserDescription(Intro.trim());
      setState(() {
        onUse=false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
                  child: Text(
                    "Finished",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 15,
                )
              ],
            ),
          )),
      body: GestureDetector(
        onTap: () {
           FocusScope.of(context).requestFocus(FocusNode());
           _textEditingController.clear();
           setState(() {
             onUse=false;
           });
        },
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
                child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
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
                              backgroundImage: widget.info == null
                                  ? AssetImage("assets/male1.jpg")
                                  : NetworkImage(widget.info['imgUrl']),
                            ),
                            Positioned(
                              bottom: 0,
                              right: -15.0,
                              child: Container(
                                width: 35.0,
                                decoration: BoxDecoration(
                                    color: Colors.white, shape: BoxShape.circle),
                                child: IconButton(
                                  iconSize: 20.0,
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => MyHomePage(
                                              imageFile: widget.info['imgUrl'],
                                              userInfo: widget.myInfo,
                                            )));
                                  },
                                  icon: Icon(
                                    Icons.photo_camera,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        widget.info == null ? 'User' : widget.info['name'],
                        style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InfoList(
                          userInfo: widget.myInfo,
                          info: 'Username',
                          index: widget.info == null ? null : widget.info['name']),
                      InfoList(
                          userInfo: widget.myInfo,
                          info: 'UID',
                          index: widget.info == null ? null : widget.info['uid']),
                      InfoList(
                          userInfo: widget.myInfo,
                          info: 'Location',
                          index:
                          widget.info == null ? null : widget.info['address']),
                      InfoList(
                        userInfo: widget.myInfo,
                        info: 'Gender',
                        index: widget.info == null ? null : widget.info['gender'],
                      ),
                      InfoList(
                          userInfo: widget.myInfo,
                          info: 'Birthday',
                          index: widget.info == null
                              ? null
                              : new DateFormat("yyyy-MM-dd ")
                              .format(widget.info['birthday'].toDate())),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.0,
                                    color: Colors.white))),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                      padding: EdgeInsets.only(
                                          top: 10.0, bottom: 10.0, left: 20.0),

                                      child: Text(
                                        "Introduction",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.0),
                                      )),
                                ),
                                Offstage(
                                  offstage:!onUse,
                                  child: GestureDetector(
                                    child: Container(

                                      child: Text('Save',style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20.0),
                                      ),
                                      padding: EdgeInsets.only(right: 20.0),
                                    ),
                                    onTap: ()  {
                                      submit();
                                      _textEditingController.clear();
                                      FocusScope.of(context).requestFocus(FocusNode());
                                    },
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 100.0,
                              padding: EdgeInsets.only(top: 5.0, left: 20.0),
                              child: TextField(
                                onTap: (){
                                  setState(() {
                                    onUse=true;
                                  });
                                },
                                maxLines: 5,
                                controller: _textEditingController,
                                onChanged: (value){

                                  setState(() {

                                    Intro=value;
                                  });
                                },
                                textAlign: TextAlign.justify,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(2.0),
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    border: InputBorder.none,
                                    hintText: widget.info == null
                                        ? 'Add some description for yourself, and let more people know you'
                                        : widget.info['description']),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap:() async {
                      print('a');
                       await widget.SignOutFunc();
            },
                    child: Container(
                      padding:EdgeInsets.all(10.0),
                      child: Text("Logout Current Account",style: TextStyle(
                        color: Colors.white,fontSize: 30.0,fontWeight: FontWeight.bold
                      ),),
                      width:MediaQuery.of(context).size.width,

                      alignment:Alignment.center,
                      decoration: BoxDecoration(

                        border:Border(top: BorderSide(color: Colors.white,width: 2.0),bottom: BorderSide(color: Colors.white,width: 2.0))
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  )
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
