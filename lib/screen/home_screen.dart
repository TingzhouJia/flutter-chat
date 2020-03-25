import 'package:flutter/material.dart';
import 'package:learnflutter/widgets/OnlineList.dart';
import 'package:learnflutter/widgets/RecentChats.dart';
import 'package:learnflutter/widgets/RequestFriends.dart';
import 'package:learnflutter/widgets/SearchBar.dart';

import 'package:learnflutter/widgets/favoriteContact.dart';

class HomeScreen extends StatefulWidget {
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

class _HomeScreenState extends State<StatefulWidget>
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child:  Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: PreferredSize(

          child: AppBar(

            leading: IconButton(
              icon: Icon(Icons.menu),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () => {},
            ),
            title: Text(
              'Chats',

              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () => {},
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
