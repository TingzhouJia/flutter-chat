import 'package:flutter/material.dart';
class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: PreferredSize(

        preferredSize: Size.fromHeight(60.0),
        child: Padding(
          padding: EdgeInsets.only(top: 5.0),
          child:  AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: <Widget>[

              GestureDetector(

                onTap:(){ Navigator.of(context).pop();},
                child: Text("Finished",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 22.0),textAlign: TextAlign.center,),
              ),
              SizedBox(width: 15,)
            ],
          ),
        )
      ),
    );
  }
}
