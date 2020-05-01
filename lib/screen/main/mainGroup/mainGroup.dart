
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnflutter/model/channel.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/chat/chat_screen.dart';
import 'package:learnflutter/screen/group/channelScreen.dart';
import 'package:learnflutter/screen/main/mainGroup/main_group_view.dart';
import 'package:learnflutter/widgets/SearchBar.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {

  _buildView(context, MainGroupScreenViewModel vm){
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,),
//            borderRadius: BorderRadius.only(
//                topLeft: Radius.circular(30.0),
//                topRight: Radius.circular(30.0))),
          child: ClipRRect(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0)),
            child:
            ListView.builder(
                itemCount: vm.currentGroups.length,

                itemBuilder: (BuildContext context, int index) {
               
                  Channel each=vm.currentGroups[index];
                  //String lasttime=DateFormat("dd-MM-yyyy").format(each.lastOnline);
                  return GestureDetector(
                    onTap: (){
                      StoreProvider.of<AppState>(context).dispatch(LoadGroup(each.id));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ChannelScreen(false
                              )));
                    },
                    child: Container(

                      margin: EdgeInsets.only(top: 5.0,bottom: 5.0,right: 5.0,left: 5.0),
                      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Color(0xff76C5A7),
                                radius: 18.0,
                              ),
                              SizedBox(width: 10.0,),
                              Text(
                                each.name,
                                style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              each.received==false?SizedBox(height: 1,):IconButton(icon: FaIcon(FontAwesomeIcons.bellSlash),iconSize: 18.0,),
                              each.marked==false?SizedBox(height: 1,):Container(
                                width: 40.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(30.0),
                                    color:Colors.red),
                                alignment: Alignment.center,
                                child: Text(
                                  'NEW',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
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
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      child: Column(
        children: <Widget>[SearchBar(), 
        
        StoreConnector<AppState,MainGroupScreenViewModel>(
          converter: MainGroupScreenViewModel.fromStore(),
          distinct: true,
          builder: (context,vm)=>_buildView(context, vm),
        )
        ],
      ),
    );
  }
}
