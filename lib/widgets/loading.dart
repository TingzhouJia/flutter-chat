
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

circularLoading(context,content){
  return showCupertinoDialog(
      context: context,builder: (context){
    return Material(
      type: MaterialType.transparency,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(content,style: TextStyle(fontSize: 16.0,color: Colors.white)),
            SpinKitFadingCircle(
              itemBuilder: (BuildContext context,int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.white
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
  );
}
