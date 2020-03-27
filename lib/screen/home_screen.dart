import 'package:flutter/material.dart';
import 'package:learnflutter/screen/my_screen.dart';
import 'package:learnflutter/service/loginService.dart';
import 'package:learnflutter/widgets/OnlineList.dart';
import 'package:learnflutter/widgets/RecentChats.dart';
import 'package:learnflutter/widgets/RequestFriends.dart';
import 'package:learnflutter/widgets/SearchBar.dart';

import 'package:learnflutter/widgets/favoriteContact.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      child: Column(
        children: <Widget>[FavoriteContact(), RecentChat()],
      ),
    );
    ;
  }
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
        children: <Widget>[SearchBar(),RequestFriends()],
      ),
    );
  }
}


class Online extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.0,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      child: Column(
        children: <Widget>[OnlineList()],
      ),
    );

  }
}
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

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  TabController mTabController;
  PageController mPageController = PageController(initialPage: 0);

  var currentPage = 0;
  var isPageCanChanged = true;

  @override
  void initState() {
    super.initState();
    mTabController=TabController(length: tabList.length,vsync: this);


  }


  @override
  void dispose() {
    super.dispose();
    mTabController.dispose();
  }
  signOut() async {
    try {

      await widget.auth.signOut();

      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child:  Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: PreferredSize(

          child: AppBar(

            leading: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
                    pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation)=>MyProfile(), //路由B
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
              },
              child: Padding(

                padding: EdgeInsets.only(left: 10),
                child: CircleAvatar(

                  radius: 50,
                  backgroundColor: Colors.white70,
                  backgroundImage: AssetImage('assets/male1.jpg'),
                ),
              ),
            ),
            title: Text(
              'Chats',

              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: (){signOut();} ,
              ),
            ],

          ) ,
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.05),
        ),

        body: Column(
          children: <Widget>[
            Container(
              height: 70.0,color: Theme.of(context).primaryColor,
              child:  TabBar(

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
            Expanded(child: TabBarView(
              controller:mTabController,
              children: <Widget>[
                Message(),
              Online(),
                Center(
                    child: Container(

                      decoration: BoxDecoration(color: Colors.green),
                      child: Text("发现"),
                    )),
               Requests()
              ],
//            onPageChanged: (index) {
//              if (!isPageCanChanged) {
//
//                _onTabPageChange(index, isOnTab: false);
//              }
//            },
//            controller: mPageController,

            ),

            )
          ],
        ),
      ),
    );
  }
}
