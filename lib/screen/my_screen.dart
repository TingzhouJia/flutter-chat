import 'dart:collection';

import 'package:flutter/material.dart';
class MyProfile extends StatefulWidget {
  LinkedHashMap info;

  MyProfile(this.info);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: PreferredSize(

        preferredSize: Size.fromHeight(45.0),
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
      body: LayoutBuilder(
        builder: (BuildContext context,BoxConstraints viewportConstraints){
          return  SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(

                 // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Container(

                      margin: EdgeInsets.only(top: 15.0,bottom: 10.0),
                      // A fixed-height child.
                     child: CircleAvatar(

                       radius: 50.0,
                       backgroundImage: widget.info==null?AssetImage("assets/male1.jpg"):NetworkImage(widget.info['imgUrl']),
                     ),
                    ),
                    Text(widget.info==null?'User':widget.info['name'],style: TextStyle(fontSize: 26.0,fontWeight: FontWeight.w600,color: Colors.black ),),
                    SizedBox(height: 10,),
                    new InkWell(

                     onTap: (){},
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border:Border(bottom: BorderSide(width: 1.0,color: Colors.white))
                        ),
                        child: Row(

                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("UserName: ",style: TextStyle(

                            ),),
                            Row(
                              children: <Widget>[
                                Text(widget.info==null?'':widget.info['name']),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            )
                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ));
        },
      ),
    );
  }
}
