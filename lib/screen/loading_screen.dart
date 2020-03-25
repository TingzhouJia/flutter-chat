import 'package:flutter/material.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState(){
    super.initState();
    //在加载页面停顿3秒
    new Future.delayed(Duration(seconds: 3),(){
      print("Flutter即时通讯APP界面实现...");
      Navigator.of(context).pushReplacementNamed("/app");
    });
  }

  @override
  Widget build(BuildContext context){
    return new Center(
      child: Stack(
          alignment: const Alignment(0.0, 0.6),
          fit: StackFit.expand,
          children: <Widget>[
            //加载页面居中背景图 使用cover模式

            Image.asset("assets/loadingPage.jpeg",fit:BoxFit.cover,),
            Positioned(
              left:MediaQuery.of(context).size.width*0.1,
              top: 340,
              child:  Text("Meet Your Soulmate",style: TextStyle(color: Colors.white,fontSize: 35.0,fontWeight: FontWeight.w700,decoration: TextDecoration.none)),
            ),
            Positioned(
              left:MediaQuery.of(context).size.width*0.17,
              top:400,
              child: Text("In Light Chat",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w700,decoration: TextDecoration.none)),
            )
          ]
      ),
    );
  }
}
