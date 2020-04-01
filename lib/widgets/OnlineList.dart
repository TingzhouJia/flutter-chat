import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learnflutter/model/message_model.dart';
import 'package:learnflutter/model/user.dart';


class OnlineList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        child: ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0)),
            child: ListView.builder(
                itemCount: onlineUsers.length,

                itemBuilder: (BuildContext context, int index) {
                  User each=onlineUsers[index];
                  String lasttime=DateFormat("dd-MM-yyyy").format(each.lastOnline);
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(top: 5.0,bottom: 5.0,right: 5.0,left: 5.0),
                      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 35.0,
                            backgroundImage: AssetImage(each.imgUrl),
                          ),
                          SizedBox(width: 10.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                each.name,
                                style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                               lasttime,
                                style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
            )
        ),
      ),
    );
  }
}


