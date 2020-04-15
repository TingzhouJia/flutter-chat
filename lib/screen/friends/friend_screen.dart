import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendScreen extends StatefulWidget {
  @override
  _FriendScreenState createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.black,
            onPressed: () {

            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Container(

//                  child:Column(
//                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                    children: <Widget>[
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: <Widget>[
//                          Container(
//                            margin: EdgeInsets.only(top: 15.0, bottom: 10.0),
//                            // A fixed-height child.
//                            child: Stack(
//                              overflow: Overflow.visible,
//                              alignment: Alignment.center,
//                              children: <Widget>[
//                                CircleAvatar(
//                                  backgroundColor: Colors.white,
//                                  radius: 60.0,
//                                  backgroundImage: vm.user.imgUrl == ""
//                                      ? AssetImage("assets/male1.jpg")
//                                      : NetworkImage(vm.user.imgUrl),
//                                ),
//                                Positioned(
//                                  bottom: 0,
//                                  right: -15.0,
//                                  child: Container(
//                                    width: 35.0,
//                                    decoration: BoxDecoration(
//                                        color: Colors.white, shape: BoxShape.circle),
//                                    child: IconButton(
//                                      iconSize: 20.0,
//                                      color: Colors.white,
//                                      onPressed: () {
//                                        Navigator.push(
//                                            context,
//                                            MaterialPageRoute(
//                                                builder: (_) => MyAvatarPage(
//                                                  imageFile: vm.user.imgUrl,
//
//                                                )));
//                                      },
//                                      icon: Icon(
//                                        Icons.photo_camera,
//                                        color: Colors.grey,
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                          Text(
//                            vm.user.name,
//                            style: TextStyle(
//                                fontSize: 26.0,
//                                fontWeight: FontWeight.w600,
//                                color: Colors.black),
//                          ),
//                          SizedBox(
//                            height: 10,
//                          ),
//
//
//
//                        ],
//                      ),
//
//
//
//                    ],
//                  ),
                ),
              ));
        },
      ),
    );
  }
}
