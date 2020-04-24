import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/friend/friend_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/friends/friend_screen.dart';
import 'package:learnflutter/screen/main/mainFriend/mainFriend_view.dart';

class MainFriend extends StatefulWidget {
  @override
  _MainFriendState createState() => _MainFriendState();
}

class tester {
  final String imgUrl;
  final String status;
  final String name;
  final String indexLetter;
  final String uid;
  tester(this.imgUrl, this.status, this.name, this.indexLetter,this.uid);
}

class _MainFriendState extends State<MainFriend> {
  var nochange=true;
  var _selectedIndex = 0;
  List<tester> a = new List();
  final Map _groupMap = {};
  ScrollController _scrollController;

  void initState() {
    for (int i = 0; i < 100; i++) {
      a.add(tester(
          "", "good", '${INDEX_WORDS[i % 26]}bb', '${INDEX_WORDS[i % 26]}',i.toString()));
    }
    a.sort((tester c, tester b) => c.indexLetter.compareTo(b.indexLetter));

    var _groupOffset =0.0;
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
    _scrollController.addListener((){
//      var a=.map((i)=>i.floor()).toList();
      var c=_groupMap.values.firstWhere((i)=>i>_scrollController.offset.floor());
      var d=_groupMap.keys.firstWhere((each)=>_groupMap[each]==c);
      int e=INDEX_WORDS.indexWhere((i)=>i==d);

        if(e !=_selectedIndex){
          setState(() {
            _selectedIndex=e-1;
          });
        }
    });
  }
  jump(String string) {
      // print(_groupMap[string]);
      if (_groupMap[string] != null) {
        _scrollController.animateTo(_groupMap[string],
            duration: Duration(milliseconds: 100),
            curve: Curves.easeIn);
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

                _selectedIndex=i;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: _selectedIndex==i?Colors.red:Color(0),
                  shape: BoxShape.circle
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[ Text('${INDEX_WORDS[i]}', style: TextStyle(color: _selectedIndex==i?Colors.white: Colors.black),textAlign: TextAlign.center,)],
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
//        onVerticalDragUpdate: (DragUpdateDetails details) {
//          if (_selectedIndex != GetIndex(context, details.globalPosition)) {
//            _selectedIndex = GetIndex(context, details.globalPosition);
//
//            jump(INDEX_WORDS[_selectedIndex]);
//          } //重复点击添加容错处理
//        },
//        //按下
//        onVerticalDragDown: (DragDownDetails details) {
//          //print(details.globalPosition);
//
//
//         jump(
//              INDEX_WORDS[GetIndex(context, details.globalPosition)]);
//        },
//
//        onVerticalDragEnd: (DragEndDetails details) {
//
//        },
      ),
    );
  }

  _buildView(context, MainFriendScreenViewModel vm) {
    return Container(
      child: Column(
        children: <Widget>[
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
                            if(index==0||each.indexLetter!=a[index-1].indexLetter){
                              return Column(
                                children: <Widget>[
                                  Container(
                                    color:Color(0xffeeeeee),

                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.0,vertical: 10.0),
                                    child: Row(
                   
                                      children: <Widget>[
                                        Text('${each.name.substring(0,1).toUpperCase()}')
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      StoreProvider.of<AppState>(context).dispatch(UpdateCurrentTarget(each.uid));
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => FriendScreen(
                                              )));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 5.0,
                                          bottom: 5.0,
                                          right: 5.0,
                                          left: 5.0),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10.0),
                                      child: Row(
                                        children: <Widget>[
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
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                each.name,
                                                style: TextStyle(
                                                    color: Color(0xff333333),
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              Text(
                                                '[${each.status}]',
                                                style: TextStyle(
                                                    color: Color(0xff333333),
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }
                            return GestureDetector(
                              onTap: (){
                                StoreProvider.of<AppState>(context).dispatch(UpdateCurrentTarget(each.uid));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => FriendScreen(
                                        )));
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 5.0,
                                    bottom: 5.0,
                                    right: 5.0,
                                    left: 5.0),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                child: Row(
                                  children: <Widget>[
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          each.name,
                                          style: TextStyle(
                                              color: Color(0xff333333),
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '[${each.status}]',
                                          style: TextStyle(
                                              color: Color(0xff333333),
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
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

//class IndexBar extends StatefulWidget {
//  final void Function(String string) indexBarCallBack;
//  final void Function(String string) indexBCallBack;
//  const IndexBar({Key key, this.indexBarCallBack,this.indexBCallBack}) : super(key: key);
//
//  @override
//  _IndexBarState createState() => _IndexBarState();
//}

int GetIndex(BuildContext context, Offset globalPosition) {
  RenderBox box = context.findRenderObject();
  double y = box.globalToLocal(globalPosition).dy;
  //每一个Item的高度
  var ItemHeight = 60.0;

  //clamp 防止越界
  int index = (y ~/ ItemHeight).clamp(0, INDEX_WORDS.length - 1);
  return index;
  print(' index = $index  ,${INDEX_WORDS[index]}');
}

//class _IndexBarState extends State<IndexBar> {
//
//  @override
//
//}
