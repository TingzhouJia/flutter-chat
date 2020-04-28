import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../screen/main/mainRequests/RequestFriends.dart';
class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = "";
          showSuggestions(context);
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: Random().nextInt(10),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('result $index'),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(title: Text('Suggest 01')),
        ListTile(title: Text('Suggest 02')),
        ListTile(title: Text('Suggest 03')),
        ListTile(title: Text('Suggest 04')),
        ListTile(title: Text('Suggest 05')),
      ],
    );
  }
}
class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child:  GestureDetector(
          behavior: HitTestBehavior.opaque,
        onTap: ()=> showSearch(context: context, delegate: SearchBarDelegate()),
        child: Container(
          width: 500.0,
          child: Row(

            children: <Widget>[
              SizedBox(width: 10,),
              IconButton(
                icon: Icon(Icons.search),

                onPressed: (){
                  showSearch(context: context, delegate: SearchBarDelegate());
                },
              ),
              Text('Search'),
            ],
          ),
        ),
      ),
    );
  }
}
