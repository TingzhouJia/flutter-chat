import 'package:flutter/material.dart';
jumpToProfile(Function builder,BuildContext context){
  return Navigator.push(
    context,

    PageRouteBuilder(

      transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
      pageBuilder: builder , //路由B

      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ),
  );
}