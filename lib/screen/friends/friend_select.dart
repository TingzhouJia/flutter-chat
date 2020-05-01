import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/friend/friend_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/group/group_screen.dart';
import 'package:learnflutter/screen/main/mainFriend/mainFriend_view.dart';
import 'package:learnflutter/utils/helper.dart';

class FriendSelect extends StatefulWidget {
  final SYSTEM_DISPATCH target;

  FriendSelect(this.target);

  @override
  _FriendSelectState createState() => _FriendSelectState();
}

class tester {
  final String imgUrl;
  final String status;
  final String name;
  final String indexLetter;
  final String uid;

  tester(this.imgUrl, this.status, this.name, this.indexLetter, this.uid);
}

class _FriendSelectState extends State<FriendSelect> {
  var nochange = true;
  var _selectedIndex = 0;
  List<tester> a = new List();
  final Map _groupMap = {};
  ScrollController _scrollController;
  List target = new List();
  static final spinkit = SpinKitFadingCircle(
    itemBuilder: (BuildContext context,int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.black
        ),
      );
    },
  );
  void initState() {
    for (int i = 0; i < 100; i++) {
      a.add(tester("", "good", '${INDEX_WORDS[i % 26]}bb',
          '${INDEX_WORDS[i % 26]}', i.toString()));
    }
    a.sort((tester c, tester b) => c.indexLetter.compareTo(b.indexLetter));

    var _groupOffset = 0.0;
    for (int i = 0; i < a.length; i++) {
      if (i < 1) {
        //第一个一定是头部
        _groupMap.addAll({a[i].name.substring(0, 1): _groupOffset});
        _groupOffset += 94.3;
      } else if (a[i].indexLetter == a[i - 1].indexLetter) {
        //如果没有头
        _groupOffset += 74.3;
      } else {
        _groupMap.addAll({a[i].indexLetter: _groupOffset});
        _groupOffset += 94.3;
      }
    }
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
//      var a=.map((i)=>i.floor()).toList();
      var c = _groupMap.values
          .firstWhere((i) => i > _scrollController.offset.floor());
      var d = _groupMap.keys.firstWhere((each) => _groupMap[each] == c);
      int e = INDEX_WORDS.indexWhere((i) => i == d);

      if (e != _selectedIndex) {
        setState(() {
          _selectedIndex = e - 1;
        });
      }
    });
  }

  jump(String string) {
    // print(_groupMap[string]);
    if (_groupMap[string] != null) {
      _scrollController.animateTo(_groupMap[string],
          duration: Duration(milliseconds: 100), curve: Curves.easeIn);
    }
  }

  Widget _buildBar(BuildContext context) {
    List<Widget> _WordsWidget = [];
    for (int i = 0; i < INDEX_WORDS.length; i++) {
      _WordsWidget.add(Expanded(
          child: GestureDetector(
        onTap: () {
          jump(INDEX_WORDS[i]);
          setState(() {
            _selectedIndex = i;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: _selectedIndex == i ? Colors.red : Color(0),
              shape: BoxShape.circle),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '${INDEX_WORDS[i]}',
                style: TextStyle(
                    color: _selectedIndex == i ? Colors.white : Colors.black),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      )));
    }
    return Positioned(
      right: 0.0,
      width: 30,
      top: 60,
      height: 450,
      child: GestureDetector(
        child: Container(
          child: Column(
            children: _WordsWidget,
          ),
        ),
      ),
    );
  }

  _buildView(context, MainFriendScreenViewModel vm) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[Text('Cancel')],
          ),
        ),
        centerTitle: true,
        titleSpacing: 0.0,
        title: Text('Pick Friends'),
        actions: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
             GestureDetector(

               onTap: (){
                 if(widget.target==SYSTEM_DISPATCH.RECOMMEND){
                   //List a=target.map((i)=>i.uid).toList();
                  // StoreProvider.of(context).dispatch(RecommendTo(a));
                 }else{
                  // List a=target.map((i)=>i.user.uid).toList();
                 //  StoreProvider.of(context).dispatch(InviteToChannelAction(a));

                   showCupertinoDialog(
                     context: context,builder: (context){
                       return Material(
                         type: MaterialType.transparency,
                         child: Container(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[
                               Text('Loading...',style: TextStyle(fontSize: 16.0,)),
                               spinkit
                             ],
                           ),
                         ),
                       );
                   }
                   );
                   Future.delayed(Duration(seconds: 2),(){
                     Navigator.pop(context);
                     Navigator.of(context).pop();
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (_) => GroupScreen(
//                             )));
                   });
                 }
               },
               child:  Container(
                 padding: EdgeInsets.all(8.0),
                 margin: EdgeInsets.only(right: 5.0),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(3.0)),
                   color:
                   target.length > 0 ? Color(0xff1aad19) : Color(0xffaaaaaa),
                 ),
                 child: Text(
                   'Finished',
                   style: TextStyle(color: Colors.white),
                 ),
               ),
             )
            ],
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              child: target.length==0?Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    ClipOval(
                      child: Icon(Icons.add),
                    ),
                    Text('Add Friend To List')
                  ],
                ),
              ):ListView.builder(
                  padding: EdgeInsets.only(left: 10.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: target.length,
                  itemBuilder: (BuildContext context, int index) {
                    var cur = target[index];
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: CircleAvatar(
                            radius: 25.0,
                            backgroundImage: cur.imgUrl == ""
                                ? AssetImage('assets/male1.jpg')
                                : NetworkImage(cur.imgUrl)),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0)),
                    child: Stack(
                      children: <Widget>[
                        ListView.builder(
                            itemCount: a.length, //vm.friendList.length,
                            controller: _scrollController,
                            itemBuilder: (BuildContext context, int index) {
                              //User each=vm.friendList[index];
                              tester each = a[index];
                              bool contain = target.contains(each);
                              if (index == 0 ||
                                  each.indexLetter !=
                                      a[index - 1].indexLetter) {
                                return Column(
                                  children: <Widget>[
                                    Container(
                                      color: Color(0xffeeeeee),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10.0),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                              '${each.name.substring(0, 1).toUpperCase()}')
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (contain) {
                                          target.remove(each);
                                        } else {
                                          target.add(each);
                                        }
                                        setState(() {
                                          target = target;
                                        });
                                      },
                                      child: Container(
                                        color:Colors.white,
                                        margin: EdgeInsets.only(
                                            top: 5.0,
                                            bottom: 5.0,
                                            right: 5.0,
                                            left: 5.0),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  shape: BoxShape.circle,
                                                  color: contain
                                                      ? Color(0xff1AAD19)
                                                      : Color(0x000000)),
                                              width: 25,
                                              height: 25,
                                              child: contain
                                                  ? Icon(
                                                      Icons.check,
                                                      size: 16.0,
                                                      color: Colors.white,
                                                    )
                                                  : SizedBox(
                                                      width: 0,
                                                    ),
                                            ),
                                            SizedBox(width: 10,),
                                            ClipOval(
                                              child: each.imgUrl == ""
                                                  ? Image(
                                                      image: AssetImage(
                                                          'assets/default_img.jpg'),
                                                      width: 40,
                                                      height: 40,
                                                    )
                                                  : FadeInImage.assetNetwork(
                                                      placeholder:
                                                          'assets/default_img.jpg',
                                                      image: each.imgUrl,
                                                      fit: BoxFit.cover,
                                                      width: 40,
                                                      height: 40,
                                                    ),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              each.name,
                                              style: TextStyle(
                                                  color: Color(0xff333333),
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              }
                              return GestureDetector(
                                onTap: () {
                                  if (contain) {
                                    target.remove(each);
                                  } else {
                                    target.add(each);
                                  }
                                  setState(() {
                                    target = target;
                                  });
                                },
                                child: Container(

                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border:
                                    Border(top: BorderSide(color: Color(0xfff1f1f1))),
                                  ),
                                  margin: EdgeInsets.only(
                                      top: 5.0,
                                      bottom: 5.0,
                                      right: 5.0,
                                      left: 5.0),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10.0),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            shape: BoxShape.circle,
                                            color: contain
                                                ? Color(0xff1AAD19)
                                                : Color(0x000000)),
                                        width: 25,
                                        height: 25,
                                        child: contain
                                            ? Icon(
                                                Icons.check,
                                                size: 16.0,
                                                color: Colors.white,
                                              )
                                            : SizedBox(
                                                width: 0,
                                              ),
                                      ),
                                      SizedBox(width: 10,),
                                      ClipOval(
                                        child: each.imgUrl == ""
                                            ? Image(
                                                image: AssetImage(
                                                    'assets/default_img.jpg'),
                                                width: 40,
                                                height: 40,
                                              )
                                            : FadeInImage.assetNetwork(
                                                placeholder:
                                                    'assets/default_img.jpg',
                                                image: each.imgUrl,
                                                fit: BoxFit.cover,
                                                width: 40,
                                                height: 40,
                                              ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        each.name,
                                        overflow:TextOverflow.ellipsis,
                                        style: TextStyle(

                                            color: Color(0xff333333),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                        _buildBar(context),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MainFriendScreenViewModel>(
      converter: MainFriendScreenViewModel.fromStore(),
      builder: (context, vm) => _buildView(context, vm),
      distinct: true,
    );
  }
}

const INDEX_WORDS = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
