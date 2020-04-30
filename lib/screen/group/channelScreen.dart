import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:learnflutter/redux/friend/friend_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/friends/strangerScreen.dart';
import 'package:learnflutter/screen/group/channel_view.dart';
import 'package:learnflutter/widgets/loading.dart';

class ChannelScreen extends StatefulWidget {
  final bool isNew;

  ChannelScreen(this.isNew);

  @override
  _ChannelScreenState createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelScreen> {
  _buildView(context, ChannelScreenViewModel vm) {
    return Scaffold(
      body: Container(
        color: Color(0xfff1f1f1),
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          image: vm.curChannel.backgroudImg == ''
                              ? null
                              : DecorationImage(
                                  image:
                                      NetworkImage(vm.curChannel.backgroudImg)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomCenter,
                              colors: [Colors.red[900], Colors.blue[700]])),
                      height: MediaQuery.of(context).size.height * 0.3),
                  Container(
                    color: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            FadeInImage(
                              placeholder:
                                  AssetImage('assets/group_default.png'),
                              width: 55,
                              height: 55,
                              fit: BoxFit.fill,
                              image: NetworkImage(vm.curChannel.hexColor),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  vm.curChannel.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                Text(
                                  vm.curChannel.id,
                                  style: TextStyle(fontSize: 14.0),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'This group is created in ${DateFormat("yyyy-MM-dd ").format(vm.curChannel.startDate)}',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: double.infinity),
                          child: Text(
                            vm.curChannel.description,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    color: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Group Tags: ',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        Container(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 70.0,
                              crossAxisSpacing: 25.0,
                              childAspectRatio: 2.0,
                            ),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, inddex) {
                              return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      color: Color(0xff10aeff)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        vm.curChannel.tags[inddex],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ));
                            },
                            itemCount: vm.curChannel.tags.length,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    color: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    child: !widget.isNew
                        ? GestureDetector(
                            onTap: () {
                              StoreProvider.of<AppState>(context).dispatch(
                                  GetStranger(vm.curChannel.authorId));
                              circularLoading(context, 'Loading..');
                              Future.delayed(Duration(seconds: 1), () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            StrangerScreen('REQUEST')));
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Group Administrator:',
                                    style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w500)),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                )
                              ],
                            ),
                          )
                        : GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Group Member:',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500)),
                                Row(
                                  children: <Widget>[
                                    ClipOval(
                                      child: FadeInImage(
                                        width: 35.0,
                                        height: 35.0,
                                        placeholder: AssetImage(
                                            'assets/default_img.jpg'),
                                        image: AssetImage(
                                            'assets/default_img.jpg'),
                                        //image: NetworkImage(vm.userList[0].imgUrl),
                                      ),
                                    ),
                                    vm.userList.length > 1
                                        ? FadeInImage(
                                            placeholder: AssetImage(
                                                'assets/default_img.jpg'),
                                            image: NetworkImage(
                                                vm.userList[1].imgUrl),
                                          )
                                        : SizedBox(),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16.0,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                  )
                ],
              ),
            ),
            widget.isNew
                ? Positioned(
                    bottom: 15.0,
                    left: 20.0,
                    right: 20.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                          color: Color(0xff10aeff),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Text(
                        'Request To Join Group',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                    ),
                  )
                : Positioned(
                    bottom: 15.0,
                    left: 20.0,
                    right: 20.0,
              child: Row(
                children: <Widget>[
                  Container(),
                  Container()
                ],
              ),
                  ),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  iconSize: 24.0,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                    iconSize: 24.0,
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChannelScreenViewModel>(
      converter: ChannelScreenViewModel.fromStore(widget.isNew),
      builder: (context, vm) => _buildView(context, vm),
      distinct: true,
    );
  }
}
