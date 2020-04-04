import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';


import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/user/user_reset_screen.dart';
import 'package:learnflutter/screen/user/user_reset_view.dart';
import 'package:learnflutter/service/userInfoService.dart';
import 'package:learnflutter/utils/bottomUpAnimation.dart';
import 'package:oktoast/oktoast.dart';

class InfoList extends StatelessWidget {
  final String info;
  final index;
  var onshow=false;
  InfoList({this.info, this.index});

  void show(){
    showToast(
      "uid has been copied",
      duration: Duration(seconds: 3),
      position: ToastPosition.center,
      backgroundColor: Colors.black.withOpacity(0.8),
      radius: 13.0,
      textStyle: TextStyle(fontSize: 18.0),
      animationBuilder: Miui10AnimBuilder(),
    );
  }

  @override
  Widget build(BuildContext context) {

      return
         Stack(
           children: <Widget>[
             GestureDetector(

               onTap: () {
                 if(info=='UID'){
                   Clipboard.setData(ClipboardData(text: index));
                    showToast('uid has been copied',duration: Duration(seconds: 1));
                 }else{
                   jumpToProfile(
                           (BuildContext context, Animation animation,
                           Animation secondaryAnimation) =>
                           ResetInfo(
                             title: info,
                             callFunc: index,
                           ),
                       context);
                 }

               },
               child: Container(
                 padding: EdgeInsets.all(20.0),
                 decoration: BoxDecoration(
                     border:
                     Border(bottom: BorderSide(width: 1.0, color: Colors.white))),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Text(
                       '$info: ',
                       style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.w600,
                           fontSize: 20.0),
                     ),
                     Row(
                       children: <Widget>[
                         info == 'UID'
                             ?Text(
                           '${index.substring(0, 10)}...',
                           style: TextStyle(
                               color: Colors.white,
                               fontWeight: FontWeight.w600,
                               fontSize: 20.0),
                         )
                             : Text(
                           index,
                           style: TextStyle(
                               color: Colors.white,
                               fontWeight: FontWeight.w600,
                               fontSize: 20.0),
                         ),
                         info == 'UID'
                             ? SizedBox(
                           width: 0,
                         )
                             : Icon(
                           Icons.arrow_forward_ios,
                           size: 20.0,
                           color: Colors.white,
                         )
                       ],
                     )
                   ],
                 ),
               ),



             ),

           ],
         );
  }
}
