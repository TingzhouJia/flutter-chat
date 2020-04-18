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
  String _getGender(int gender){
    if(gender==1){
      return "Male";
    }else if(gender==2){
      return "Female";
    }else{
      return "Secret";
    }

  }

  _builtView(context, FriendScreenViewModel vm){
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(

                children: <Widget>[
                  Column(

                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 15.0, bottom: 10.0),
                            // A fixed-height child.
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(color: Color.fromRGBO(100, 0, 0, 0.25),offset: Offset(-4.0,-2.0)),
                                  BoxShadow(color: Color.fromRGBO(255, 255, 255, 0.3),offset: Offset(20.0,0))
                                ]
                            ),
                            child:
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 60.0,
                              backgroundImage: vm.friend.imgUrl == ""
                                  ? AssetImage("assets/male1.jpg")
                                  : NetworkImage(vm.friend.imgUrl),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: Color(0xffD3C2BC),
                                borderRadius: BorderRadius.all(Radius.circular(10.0))
                            ),
                            child: Text(
                              vm.friend.name,
                              style: TextStyle(
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                          Text(
                            vm.friend.description,
                            style: TextStyle(
                                fontSize: 26.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: Color(0xffA0ADA7)))

                        ),
                        child: Column(
                          mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(

                              padding:EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'user id ',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    width: 300,
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        border: Border.all(color: Color(0xffB0A9AA))
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '${vm.friend.uid.substring(0,15)}...',
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.blueGrey),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(

                              padding:EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Gender: ',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    width: 300,
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        border: Border.all(color: Color(0xffB0A9AA))
                                    ),
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          _getGender(vm.friend.gender),
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.blueGrey),
                                        )
                                      ],
                                    ),
                                  )

                                ],
                              ),
                            ),
                            Container(

                              padding:EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Birthday: ',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    width: 300,
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        border: Border.all(color: Color(0xffB0A9AA))
                                    ),
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          new DateFormat("yyyy-MM-dd ")
                                              .format(vm.friend.birthday),
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.blueGrey),
                                        )
                                      ],
                                    ),
                                  )

                                ],
                              ),
                            ),
                            Container(

                              padding:EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Status: ',
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    width: 300,
                                    padding: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        border: Border.all(color: Color(0xffB0A9AA))
                                    ),
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          vm.friend.status,
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.blueGrey),
                                        )
                                      ],
                                    ),
                                  ),


                                ],
                              ),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 300,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        border: Border.all(color: Color(0xffB0A9AA))
                    ),
                    child:Row(
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        border: Border.all(color: Color(0xffB0A9AA))
                    ),
                    child:Row(
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
                  )
                ],

              ),
            ));
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new PreferredSize(child: AppBar(
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {

            },
          ),
        ],
      ), preferredSize: Size.fromHeight(40.0)),
      body: StoreConnector<AppState,FriendScreenViewModel>(
        converter: FriendScreenViewModel.fromStore(),
        distinct: true,
        builder: (context,vm)=>_builtView(context, vm),
      ) ,
    );
  }
}
