import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:learnflutter/redux/auth/auth_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/redux/userRedux/user_action.dart';
import 'dart:async';
import 'dart:io';

import 'package:learnflutter/screen/user/reset_avatar.dart';
import 'package:learnflutter/screen/user/user_view.dart';
import 'package:learnflutter/service/userInfoService.dart';
import 'package:learnflutter/widgets/InfoList.dart';
import 'package:oktoast/oktoast.dart';

class MyProfile extends StatefulWidget {
//  LinkedHashMap info;
//  UserInfo myInfo;
//  Function SignOutFunc;
//  MyProfile(this.info,this.myInfo,this.SignOutFunc);
//
//  MyProfile.origin(this.myInfo);

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

  void submit(user,String description) async {
      await StoreProvider.of<AppState>(context).dispatch(UpdateUserDescription(user:user ,description: description));
      setState(() {
        onUse=false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,UserScreenViewModel>(
        builder: (context,vm)=>_buildscaford(context, vm),
        converter: UserScreenViewModel.fromStore(),
        distinct: true,

    );
  }

  Scaffold _buildscaford(context,UserScreenViewModel vm){

    return  new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
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
          )),
      body: OKToast(
        child: GestureDetector(
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
                padding: EdgeInsets.only(bottom: 0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: Container(

                      child:Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,

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
                                  GestureDetector(
                                    onTap:(){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => MyAvatarPage(
                                                imageFile: vm.user.imgUrl,

                                              )));
                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 60.0,
                                      backgroundImage: vm.user.imgUrl == ""
                                          ? AssetImage("assets/male1.jpg")
                                          : NetworkImage(vm.user.imgUrl),
                                    ),
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
                                                  builder: (_) => MyAvatarPage(
                                                    imageFile: vm.user.imgUrl,

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
                              vm.user.name,
                              style: TextStyle(
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InfoList(

                              info: 'Username',
                              index: vm.user.name,
                            ),
                            InfoList(
                              info: "Status",
                              index: vm.user.status,
                            ),
                            InfoList(

                                info: 'UID',
                                index: vm.user.uid),
                            InfoList(

                                info: 'Location',
                                index:vm.user.address

                            ),
                            InfoList(

                              info: 'Gender',
                              index: vm.user.gender,
                            ),
                            InfoList(

                                info: 'Birthday',
                                index:  new DateFormat("yyyy-MM-dd ")
                                    .format(vm.user.birthday)),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(left: 10.0,right: 10.0),
                              decoration: BoxDecoration(

                                  border: Border(
                                      top: BorderSide(
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
                                            submit(vm.user,Intro);
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
                                          hintText: vm.user.description == ''
                                              ? 'Add some description for yourself, and let more people know you'
                                              : vm.user.description),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                              child: Container(
                                color: Theme.of(context).accentColor
                              ),
                            ),
                            GestureDetector(
                              onTap:() async {
                                StoreProvider.of<AppState>(context).dispatch(LogOut());
                              },
                              child: Container(


                                padding:EdgeInsets.all(10.0),
                                child: Text("Logout Current Account",style: TextStyle(
                                    color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold
                                ),),
                                width:MediaQuery.of(context).size.width,

                                alignment:Alignment.center,
                                decoration: BoxDecoration(

                                    border:Border(top: BorderSide(color: Colors.white,width: 2.0),)
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                              child: Container(
                                  color: Theme.of(context).accentColor
                              ),
                            ),
                            GestureDetector(
                              onTap:() async {
                                StoreProvider.of<AppState>(context).dispatch(LogOut());
                              },
                              child: Container(


                                padding:EdgeInsets.all(10.0),
                                child: Text("Change Another Account",style: TextStyle(
                                    color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold
                                ),),
                                width:MediaQuery.of(context).size.width,

                                alignment:Alignment.center,
                                decoration: BoxDecoration(

                                    border:Border(top: BorderSide(color: Colors.white,width: 2.0),)
                                ),
                              ),
                            )
                          ],
                        ),



                      ],
                    ),
                    ),
                  ));
            },
          ),
        ),
      ),
    );
  }

}
