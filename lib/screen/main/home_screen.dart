import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/main/home_view.dart';
import 'package:learnflutter/screen/main/mainFriend/mainFriend.dart';
import 'package:learnflutter/screen/main/mainGroup/mainGroup.dart';
import 'package:learnflutter/screen/user/my_screen.dart';
import 'package:learnflutter/service/loginService.dart';
import 'package:learnflutter/service/userInfoService.dart';
import 'package:learnflutter/utils/bottomUpAnimation.dart';

import 'package:learnflutter/screen/main/mainMessage/RecentChats.dart';
import 'package:learnflutter/widgets/RequestFriends.dart';
import 'package:learnflutter/widgets/SearchBar.dart';

import 'package:learnflutter/screen/main/mainMessage/favoriteContact.dart';

import 'mainMessage/message.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class Requests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      child: Column(
        children: <Widget>[SearchBar(), RequestFriends()],
      ),
    );
  }
}

//class Online extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: 500.0,
//      decoration: BoxDecoration(
//          color: Theme.of(context).accentColor,
//          borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
//      child: Column(
//        children: <Widget>[MainFriend()],
//      ),
//    );
//  }
//}

class TabTitle {
  String title;
  int id;

  TabTitle(this.title, this.id);
}

List<TabTitle> tabList = [
  new TabTitle('Message', 0),
  new TabTitle('Online', 1),
  new TabTitle('Groups', 2),
  new TabTitle('Requests', 3)
];

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController mTabController;
  PageController mPageController = PageController(initialPage: 0);

  var currentPage = 0;
  var isPageCanChanged = true;
  var info;
  
  
  //UserInfo userInfo;

  _buildView(context,HomeScreenViewModel vm){
    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: PreferredSize(
          child: AppBar(

            automaticallyImplyLeading: true,
            centerTitle: true,
            titleSpacing: 0.0,
            leading: GestureDetector(
              onTap: () {
                jumpToProfile(
                        (BuildContext context, Animation animation,
                        Animation secondaryAnimation) =>
                        MyProfile(),
                    context);
              },
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: ClipOval(
                  child: vm.user.imgUrl == ""
                      ? Image(image: AssetImage('assets/default_img.jpg'),)
                      : FadeInImage.assetNetwork(placeholder:'assets/default_img.jpg' ,image: vm.user.imgUrl ,fit: BoxFit.cover,),

                ),
              ),
            ),
            title: Text(
              vm.messageOnScreen==0?'Chats':'Chats(${vm.messageOnScreen})',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: (){
                } ,
              ),
            ],
          ),
          preferredSize:
          Size.fromHeight(MediaQuery.of(context).size.height * 0.05),
        ),
        body:

       SafeArea(
         bottom: false,
         child:  Column(
             children: <Widget>[
               Container(
                 height: 65.0,
                 padding: EdgeInsets.zero,
                 color: Theme.of(context).primaryColor,
                 child: TabBar(
                     labelColor: Colors.white,
                     unselectedLabelColor: Colors.white60,
                     isScrollable: true,
                     indicator: const BoxDecoration(),
                     controller: mTabController,
                     tabs: tabList.map((item) {
                       return Tab(
                           child: Text(
                             item.title,
                             style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 letterSpacing: 1.2,
                                 fontSize: 24.0),
                           ));
                     }).toList()),
               ),
               Expanded(
                 child: TabBarView(
                   controller: mTabController,
                   children: <Widget>[
                     MessageScreen(),
                     MainFriend(),
                     GroupPage(),
                     Requests()
                   ],
                 ),
               )
             ],
           )
       ),


      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    mTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,HomeScreenViewModel>(
      converter: HomeScreenViewModel.fromStore(),
      builder: (context,vm)=>_buildView(context,vm),
      distinct: true,
    );
  }
}
