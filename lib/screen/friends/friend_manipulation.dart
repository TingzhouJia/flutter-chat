import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/friends/friend_screen_view.dart';

class FriendManipulation extends StatefulWidget {
  @override
  _FriendManipulationState createState() => _FriendManipulationState();
}

class _FriendManipulationState extends State<FriendManipulation> {

  _builtVIew(context,FriendScreenViewModel vm){
    return Scaffold(

      appBar: AppBar(
        title: Text('Profile Setting'),
        elevation: 0.0,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return  Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.82,
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
                      //padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                            Container(
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))
                            ),
                              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Set Nickname',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.0),),
                                    Row(
                                      children: <Widget>[
                                       Text( vm.friend.nickName,style: TextStyle(color: Color(0xffe3e3e3)),),
                                        Icon(Icons.keyboard_arrow_right)
                                      ],
                                    )
                                  ],
                              ),
                            )



                        ],
                      ),
                    ))),
          );
        },
      )


    );
  }
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,FriendScreenViewModel>(
      distinct: true,
      converter: FriendScreenViewModel.fromStore(),
      builder: (context,vm)=>_builtVIew(context, vm),
    );
  }
}
