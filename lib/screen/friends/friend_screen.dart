import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/friends/friend_screen_view.dart';

class FriendScreen extends StatefulWidget {
  @override
  _FriendScreenState createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {


  _builtView(context, FriendScreenViewModel vm){
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 0),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Container(
                  child:Column(
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
                          Text(
                            vm.friend.name,
                            style: TextStyle(
                                fontSize: 26.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
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
                        decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: Color(0xffA0ADA7)))
                        ),

                      )
                    ],
                  ),
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
