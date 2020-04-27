import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/friends/sendRequest.dart';
import 'package:learnflutter/screen/friends/stranger_view.dart';

class StrangerScreen extends StatefulWidget {
  @override
  _StrangerScreenState createState() => _StrangerScreenState();
}

class _StrangerScreenState extends State<StrangerScreen>{
  String _getGender(int gender) {
    if (gender == 1) {
      return "Male";
    } else if (gender == 2) {
      return "Female";
    } else {
      return "Secret";
    }
  }
  _builtView(context,StrangerViewModel vm){
     return Scaffold(
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      appBar: new PreferredSize(
          child: AppBar(
            elevation: 0.0,
            title:
            Text('Profile',style: TextStyle(color: Colors.white),),
          ),
          preferredSize: Size.fromHeight(40.0)),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
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
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 35.0,
                                      backgroundImage:
                                      vm.target.imgUrl == ""
                                          ? AssetImage(
                                          "assets/default_img.jpg")
                                          : NetworkImage(
                                          vm.target.imgUrl),
                                    ),
                                    SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          vm.target.name,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff2c2c2c)),
                                        ),
                                        Text(
                                          'gender: ${_getGender(vm.target.gender)}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff2c2c2c)),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30.0),
                                  padding: EdgeInsets.symmetric(vertical: 15.0),
                                  decoration: BoxDecoration(
                                    border: Border(top: BorderSide(
                                      color: Colors.grey
                                    ))
                                  ),
                                  child: Row(
                                    children: <Widget>[

                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      // margin: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 10,right: 10),
                                      padding: EdgeInsets.all(20.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          //border: Border.all(),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0xfff2f6f5),
                                                offset: Offset(-5, -1.0),
                                                blurRadius: 3.0),
                                            BoxShadow(
                                                color:
                                                Colors.grey.withOpacity(0.4),
                                                offset: Offset(0, 1.0),
                                                spreadRadius: 0.5,
                                                blurRadius: 3.0),
                                            //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                                          ]),
                                      //padding:EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Column(

                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    'User Id:',
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xff67696d)),
                                                  )
                                                ],
                                              ),
                                             Row(
                                               children: <Widget>[
                                                 Text(
                                                   vm.target.uid.substring(
                                                       0, 18),
                                                   overflow: TextOverflow.ellipsis,
                                                   style: TextStyle(
                                                       fontSize: 16.0,
                                                       fontWeight: FontWeight.w500,
                                                       color: Colors.black),
                                                 )
                                               ],
                                             )
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(20.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          //border: Border.all(),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0xfff2f6f5),
                                                offset: Offset(-5, -1.0),
                                                blurRadius: 3.0),
                                            BoxShadow(
                                                color:
                                                Colors.grey.withOpacity(0.4),
                                                offset: Offset(0, 1.0),
                                                spreadRadius: 0.5,
                                                blurRadius: 3.0),
                                            //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                                          ]),
                                      //padding:EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Gender ',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff67696d)),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                _getGender(vm.target.gender),
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff2c2c2c)),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(20.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          //border: Border.all(),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0xfff2f6f5),
                                                offset: Offset(-5, -1.0),
                                                blurRadius: 3.0),
                                            BoxShadow(
                                                color:
                                                Colors.grey.withOpacity(0.4),
                                                offset: Offset(0, 1.0),
                                                spreadRadius: 0.5,
                                                blurRadius: 3.0),
                                            //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                                          ]),
                                      //padding:EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Birthday',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff67696d)),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                new DateFormat("yyyy-MM-dd ")
                                                    .format(
                                                    vm.target.birthday),
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff2c2c2c)),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    Container(
                                      padding: EdgeInsets.all(20.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          //border: Border.all(),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0xfff2f6f5),
                                                offset: Offset(-5, -1.0),
                                                blurRadius: 3.0),
                                            BoxShadow(
                                                color:
                                                Colors.grey.withOpacity(0.4),
                                                offset: Offset(0, 1.0),
                                                spreadRadius: 0.5,
                                                blurRadius: 3.0),
                                            //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                                          ]),
                                      //padding:EdgeInsets.symmetric(vertical: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Address ',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff67696d)),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                child: Text(
                                                  vm.target.address,
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.w500,
                                                      color: Color(0xff2c2c2c)),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 60,
                                    ),
                                    Container(
                                      // margin: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 10,right: 10),
                                      padding: EdgeInsets.all(20.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          //border: Border.all(),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0xfff2f6f5),
                                                offset: Offset(-5, -1.0),
                                                blurRadius: 3.0),
                                            BoxShadow(
                                                color:
                                                Colors.grey.withOpacity(0.4),
                                                offset: Offset(0, 1.0),
                                                spreadRadius: 0.5,
                                                blurRadius: 3.0),
                                            //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                                          ]),
                                      //padding:EdgeInsets.symmetric(vertical: 10.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => SendRequest(
                                                    vm.target
                                                  )));
                                        },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Add to Friend List',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ))),
                ),
              ),

            ],
          );
        },
      ),

    );
  }
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,StrangerViewModel>(
      converter: StrangerViewModel.fromStore(),
        builder: (context,vm)=>_builtView(context, vm),
      distinct: true,
    );
  }
}
