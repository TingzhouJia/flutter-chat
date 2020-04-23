import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/friends/friend_screen_view.dart';

class FriendScreen extends StatefulWidget {
  @override
  _FriendScreenState createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;

  String _getGender(int gender) {
    if (gender == 1) {
      return "Male";
    } else if (gender == 2) {
      return "Female";
    } else {
      return "Secret";
    }
  }

  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.offset < 100 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 200 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  _builtView(context, FriendScreenViewModel vm) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new PreferredSize(
          child: AppBar(
            elevation: 0.0,
            title:
                !showToTopBtn ? Text('Firend Profile') : Text(vm.friend.user.name),
          ),
          preferredSize: Size.fromHeight(40.0)),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            child: SingleChildScrollView(
                controller: _controller,
                padding: EdgeInsets.only(bottom: 0),
                child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 100),
                                    padding: EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        //border: Border.all(),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
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
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(5.0),
                                          margin: EdgeInsets.only(top: 50),
                                          child: Text(
                                            vm.friend.user.name,
                                            style: TextStyle(
                                                fontSize: 22.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'Description ',
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        color: Color(
                                                            0xff67696d)),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Text(
                                                      vm.friend.user.description,
                                                      style: TextStyle(
                                                          fontSize: 22.0,
                                                          fontWeight:
                                                          FontWeight
                                                              .w600,
                                                          color:
                                                          Colors.black),
                                                      overflow: TextOverflow
                                                          .visible,
                                                      maxLines: 99,
                                                      softWrap: true,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 20,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 15.0, bottom: 10.0),
                                          // A fixed-height child.
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
//                                          boxShadow: [
//                                            BoxShadow(
//                                                color: Color.fromRGBO(100, 0, 0, 0.25),
//                                                offset: Offset(-4.0, -2.0)),
//                                            BoxShadow(
//                                                color: Color.fromRGBO(255, 255, 255, 0.3),
//                                                offset: Offset(20.0, 0))
//                                          ]
                                          ),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 60.0,
                                            backgroundImage:
                                            vm.friend.user.imgUrl == ""
                                                ? AssetImage(
                                                "assets/male1.jpg")
                                                : NetworkImage(
                                                vm.friend.user.imgUrl),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ),

                          Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                // margin: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 10,right: 10),
                                padding: EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    //border: Border.all(),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0)),
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
                                //padding:EdgeInsets.symmetric(vertical: 10.0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'user id ',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff67696d)),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                         vm.friend.user.uid.substring(0,18),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff2c2c2c)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    //border: Border.all(),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0)),
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
                                //padding:EdgeInsets.symmetric(vertical: 10.0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Gender ',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff67696d)),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          _getGender(vm.friend.user.gender),
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff2c2c2c)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    //border: Border.all(),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0)),
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
                                //padding:EdgeInsets.symmetric(vertical: 10.0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Birthday ',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff67696d)),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          new DateFormat("yyyy-MM-dd ")
                                              .format(vm.friend.user.birthday),
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff2c2c2c)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    //border: Border.all(),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0)),
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
                                //padding:EdgeInsets.symmetric(vertical: 10.0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Status ',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff67696d)),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          vm.friend.user.status,
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff2c2c2c)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    //border: Border.all(),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0)),
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
                                //padding:EdgeInsets.symmetric(vertical: 10.0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Address ',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff67696d)),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            vm.friend.user.address,
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff2c2c2c)),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                //border: Border.all(),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20.0)),
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
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Start Chat",
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blueGrey),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                //border: Border.all(),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20.0)),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Remove User",
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ))),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FriendScreenViewModel>(
      converter: FriendScreenViewModel.fromStore(),
      distinct: true,
      builder: (context, vm) => _builtView(context, vm),
    );
  }
}
