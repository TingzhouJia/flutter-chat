import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/model/friend.dart';
import 'package:learnflutter/redux/friend/friend_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/friends/friend_screen_view.dart';
import 'package:learnflutter/screen/friends/friend_select.dart';
import 'package:learnflutter/utils/helper.dart';

class FriendManipulation extends StatefulWidget {
  @override
  _FriendManipulationState createState() => _FriendManipulationState();
}

class _FriendManipulationState extends State<FriendManipulation> {
  bool strong_notification;
  bool notification;
  _builtVIew(context, FriendScreenViewModel vm) {
    notification=vm.friend.notification;
    strong_notification=vm.friend.strongNotification;
    return Scaffold(
      backgroundColor: Color(0xfff0efef),
        appBar: AppBar(
          title: Text('Profile Setting'),
          elevation: 0.0,
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.82,
              decoration: BoxDecoration(
                  color: Color(0xfff0efef),
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
                        //padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: <Widget>[
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
                                  Text(
                                    'Set Nickname',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(vm.friend.nickName,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18.0)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(Icons.keyboard_arrow_right,size: 30.0,color: Colors.grey,)
                                    ],
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
                                  Text(
                                    'Friend Permission',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0),
                                  ),
                                  Icon(Icons.keyboard_arrow_right,size: 30.0,color: Colors.grey,)
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
                                  vertical: 10.0, horizontal:15.0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => FriendSelect(SYSTEM_DISPATCH.RECOMMEND)));
                                },
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Recommand To Friend',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.0),
                                    ),
                                    Icon(Icons.keyboard_arrow_right,size: 30.0,color: Colors.grey,)
                                  ],
                                ),
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Set As Special Care',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0),
                                  ),
                                  CupertinoSwitch(
                                    value: strong_notification,
                                    onChanged: (_){
                                      StoreProvider.of<AppState>(context).dispatch(UpdateSetting(FriendSetting.STRONG_NOTIFICATION,!strong_notification));
                                    },
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
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
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Add To Blacklist',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0),
                                  ),
                                  CupertinoSwitch(

                                    value: notification,
                                    onChanged: (_){
                                      StoreProvider.of<AppState>(context).dispatch(UpdateSetting(FriendSetting.NOTIFICATION,!notification));
                                    },
                                  )
                                ],
                              ),
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
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Complainment',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.0),
                                  ),
                                  Icon(Icons.keyboard_arrow_right,size: 30.0,color: Colors.grey,)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                           GestureDetector(
                             onTap: (){
                               showModalBottomSheet(
                                   context: context,
                                   elevation: 10,
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(10.0),
                                   ),
                                   isScrollControlled: true,
                                   builder: (BuildContext bc) {
                                     return Container(
                                       height: 170,
                                       child: ClipRRect(
                                         borderRadius: BorderRadius.only(topRight: Radius.circular(35.0)),
                                         child: new Wrap(
                                           children: <Widget>[
                                             Container(

                                               padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
                                               decoration: BoxDecoration(
                                                 border: Border(bottom: BorderSide(color: Color(0xfff0efef)))
                                               ),
                                               child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.center,
                                                 children: <Widget>[
                                                   Text('Delete friend ${vm.friend.nickName},and delete all records',style: TextStyle(
                                                       color: Colors.blueGrey,fontSize: 14.0
                                                   ))
                                                 ],
                                               ),
                                             ),
                                             ListTile(
                                               title: new Text('Delete Friend',style: TextStyle(color: Colors.red,fontSize: 18.0),textAlign: TextAlign.center,),
                                               onTap: () {
                                                 //StoreProvider.of(context).dispatch()
                                                 Navigator.pop(context);
                                                 showCupertinoDialog(context: context, builder: (context){
                                                   return Dialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                                                    child: Container(
                                                      height: 40.0,
                                                      width: 40,
                                                      child: Text('Loading'),
                                                    ),
                                                   );
                                                 });
                                                 Future.delayed(Duration(seconds: 2),(){
                                                   Navigator.pop(context);
                                                 });
                                               },
                                             ),
                                             ListTile(
                                               title: new Text('Cancel',style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                               onTap: () {
                                                 //StoreProvider.of(context).dispatch()
                                                 Navigator.pop(context);
                                               },
                                             )
                                           ],
                                         ),
                                       ),
                                     );
                                   });
                             },
                             child:  Container(
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   border: Border(
                                       top: BorderSide(
                                           color: Color(0xffeeeeee)),
                                       bottom: BorderSide(
                                           color: Color(0xffeeeeee)))),
                               padding: EdgeInsets.symmetric(
                                   vertical: 10.0, horizontal: 20.0),
                               child:GestureDetector(
                                 child:  Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.center,
                                   children: <Widget>[
                                     Text(
                                       'Delete',
                                       style: TextStyle(
                                           color: Colors.red,
                                           fontWeight: FontWeight.w600,
                                           fontSize: 18.0),
                                     )
                                   ],
                                 ),

                               ),
                             ),
                           ),
                          ],
                        ),
                      ))),
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FriendScreenViewModel>(
      distinct: true,
      converter: FriendScreenViewModel.fromStore(),
      builder: (context, vm) => _builtVIew(context, vm),
    );
  }
}
