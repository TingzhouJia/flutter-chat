import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:learnflutter/redux/friend/friend_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/chat/chat_screen.dart';
import 'package:learnflutter/screen/friends/sendRequest.dart';
import 'package:learnflutter/screen/friends/stranger_view.dart';
import 'package:learnflutter/screen/main/mainRequests/RequestFriends.dart';
import 'package:learnflutter/widgets/loading.dart';

class StrangerScreen extends StatefulWidget {
  String type;

  StrangerScreen(this.type);

  @override
  _StrangerScreenState createState() => _StrangerScreenState();
}

class _StrangerScreenState extends State<StrangerScreen> {
  String _getGender(int gender) {
    if (gender == 1) {
      return "Male";
    } else if (gender == 2) {
      return "Female";
    } else {
      return "Secret";
    }
  }

  _builtView(context, StrangerViewModel vm) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new PreferredSize(
          child: AppBar(
            elevation: 0.0,
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
          preferredSize: Size.fromHeight(40.0)),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xfff1f1f1),
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

                            child: Column(
                              children: <Widget>[
                                Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.all(20.0),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 35.0,
                                            backgroundImage: vm.target.imgUrl == ""
                                                ? AssetImage(
                                                "assets/default_img.jpg")
                                                : NetworkImage(vm.target.imgUrl),
                                          ),
                                          SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                vm.target.name,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff2c2c2c)),
                                              ),
                                              Text(
                                                'gender: ${_getGender(vm.target.gender)}',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff2c2c2c)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20,),
                                      widget.type=="REQUEST"?SizedBox():Container(
                                        padding: EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xffaaaaaa).withOpacity(0.5),
                                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                            border: Border.all(color: Color(0xffeeeeee))),
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(

                                              maxWidth:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.9),
                                          child: Text(vm.target.description,

                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.0)),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                Container(
                                  //padding: EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 20,),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Color(0xffeeeeee)))),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.person,size: 16.0,),
                                                Text(
                                                  'Id',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16.0),
                                                )
                                              ],
                                            ),
                                            Text(
                                              vm.target.uid,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Color(0xffeeeeee)))),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.home,size: 16.0,),
                                                Text(
                                                  'Location',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 16.0),
                                                )
                                              ],
                                            ),
                                            Text(
                                              vm.target.address,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        ),
                                      ),

                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border(

                                                bottom: BorderSide(
                                                    color: Color(0xffeeeeee)))),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.cake,size: 16.0,),
                                                Text(
                                                  'Birthday',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16.0),
                                                )
                                              ],
                                            ),
                                            Text(
                                              new DateFormat("yyyy-MM-dd ")
                                                  .format(
                                                  vm.target.birthday),
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff2c2c2c)),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border(
                                                top: BorderSide(
                                                    color: Color(0xffeeeeee)),
                                                bottom: BorderSide(
                                                    color: Color(0xffeeeeee)))),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Icon(Icons.description,size: 16.0,),
                                              Text(
                                                'Description',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16.0),
                                              )
                                            ],
                                          ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(5.0),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                  border: Border.all(color: Color(0xffeeeeee))),
                                              child: ConstrainedBox(
                                                constraints: BoxConstraints(

                                                    maxWidth:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        0.9),
                                                child: Text(vm.target.description,

                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 18.0)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border(

                                                bottom: BorderSide(
                                                    color: Color(0xffeeeeee)))),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(Icons.mood,size: 16.0,),
                                                Text(
                                                  'Status',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16.0),
                                                )
                                              ],
                                            ),
                                            Text(
                                              vm.target.status,
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff2c2c2c)),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      widget.type=='REQUEST'?
                                      GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border(
                                                  top: BorderSide(
                                                      color: Color(0xffeeeeee)),
                                                  bottom: BorderSide(
                                                      color:
                                                      Color(0xffeeeeee)))),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 20.0),
                                          child: GestureDetector(
                                            onTap: (){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) => SendRequest(
                                                          vm.target
                                                      )));
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  'Add as friend',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      fontSize: 18.0),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ):
                                      Column(
                                        children: <Widget>[
                                          GestureDetector(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border(
                                                      top: BorderSide(
                                                          color: Color(0xffeeeeee)),
                                                      bottom: BorderSide(
                                                          color:
                                                          Color(0xffeeeeee)))),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.0, horizontal: 20.0),
                                              child: GestureDetector(
                                                onTap: (){
                                                  circularLoading(context,'Preparing');
                                                  StoreProvider.of(context).dispatch(AgreeAddFriend(vm.target.uid,vm.target.imgUrl));
                                                  Future.delayed(Duration(seconds: 2),(){
                                                    Navigator.pop(context);
                                                    //Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen()));
                                                    Navigator.of(context).pop();
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'Accept',
                                                      style: TextStyle(
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          fontSize: 18.0),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30.0,
                                          ),
                                          GestureDetector(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border(
                                                      top: BorderSide(
                                                          color: Color(0xffeeeeee)),
                                                      bottom: BorderSide(
                                                          color:
                                                          Color(0xffeeeeee)))),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.0, horizontal: 20.0),
                                              child: GestureDetector(
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      'Refuse',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                          FontWeight.w600,
                                                          fontSize: 18.0),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, StrangerViewModel>(
      converter: StrangerViewModel.fromStore(),
      builder: (context, vm) => _builtView(context, vm),
      distinct: true,
    );
  }
}
