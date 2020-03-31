import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:learnflutter/screen/user_reset_screen.dart';
import 'package:learnflutter/service/userInfoService.dart';
import 'package:learnflutter/utils/bottomUpAnimation.dart';

class InfoList extends StatelessWidget {
 final String info;
 final String index;
 final UserInfo userInfo;
  InfoList( {this.info,this.index,this.userInfo});

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){
          jumpToProfile((BuildContext context, Animation animation,
              Animation secondaryAnimation)=>ResetInfo(userinfo: userInfo,title: info,), context);
      },
      child: Container(
        padding: EdgeInsets.all(20.0),

        decoration: BoxDecoration(
            border:Border(bottom: BorderSide(width: 1.0,color: Colors.white))
        ),
        child: Row(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('$info: ',style: TextStyle(
              color: Colors.white,
                fontWeight:FontWeight.w600 ,fontSize: 20.0
            ),),
            Row(
              children: <Widget>[

                info=='UID'?Text(index==null?'':'${index.substring(0,7)}...',style: TextStyle(
                    color: Colors.white,

                    fontWeight:FontWeight.w600 ,fontSize: 20.0
                ),):Text(index==null?'':index,style: TextStyle(
                    color: Colors.white,
                    fontWeight:FontWeight.w600 ,fontSize: 20.0
                ),),
                info=='UID'?SizedBox(width: 0,):Icon(Icons.arrow_forward_ios,size: 20.0, color: Colors.white,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
