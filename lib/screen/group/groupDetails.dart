import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/friends/friend_select.dart';
import 'package:learnflutter/screen/group/channel_view.dart';
import 'package:learnflutter/screen/group/groupMember.dart';
import 'package:learnflutter/utils/bottomUpAnimation.dart';
import 'package:learnflutter/utils/helper.dart';

class GroupDetail extends StatefulWidget {
  @override
  _GroupDetailState createState() => _GroupDetailState();
}

class _GroupDetailState extends State<GroupDetail> {

  _buildView(context, ChannelScreenViewModel vm) {
    bool marked=vm.curChannel.marked;
    bool received=vm.curChannel.received;
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          elevation: 0.0,
          title: Text('Group Information (${vm.userList.length})'),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                 Container(
                   padding: EdgeInsets.all(10.0),
                   color: Colors.white,
                   child: GridView.builder(
                       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                           maxCrossAxisExtent: 70.0,
                           childAspectRatio: 1.0,
                           crossAxisSpacing: 5.0),
                       physics: NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                       itemCount:
                       vm.userList.length > 20 ? 20 : vm.userList.length + 1,
                       itemBuilder: (context, index) {
                         if (index >= vm.userList.length || index == 20) {
                           return Column(
                             children: <Widget>[
                               Container(
                                 decoration: BoxDecoration(
                                     color: Colors.white,
                                     shape: BoxShape.circle,
                                     boxShadow: [
                                       BoxShadow(
                                           color: Color(0xfff2f6f5),
                                           offset: Offset(-5, -1.0),
                                           blurRadius: 3.0),
                                       BoxShadow(
                                           color: Colors.grey.withOpacity(0.4),
                                           offset: Offset(0, 1.0),
                                           spreadRadius: 0.5,
                                           blurRadius: 3.0),
                                       //BoxShadow(color: Colors.grey, blurRadius:5.0,offset: Offset(-20.0,-10.0))
                                     ]),
                                 child: IconButton(
                                   iconSize: 25.0,
                                   icon: Icon(Icons.add),
                                   onPressed: () {
                                     jumpToProfile(
                                             (BuildContext context,
                                             Animation animation,
                                             Animation secondaryAnimation) =>
                                             FriendSelect(SYSTEM_DISPATCH.GROUP),
                                         context);
                                   },
                                 ),
                               )
                             ],
                           );
                         }
                         User a = vm.userList[index];
                         return GestureDetector(
                           onTap: () {},
                           child: Column(
                             children: <Widget>[
                               ClipOval(
                                 child: FadeInImage(
                                   placeholder:
                                   AssetImage('assets/default_img.jpg'),
                                   image: NetworkImage(a.imgUrl),
                                   width: 45.0,
                                   height: 45.0,
                                   fit: BoxFit.fill,
                                 ),
                               ),
                               Text(
                                 a.name,
                                 style: TextStyle(fontSize: 12.0),
                                 overflow: TextOverflow.ellipsis,
                               )
                             ],
                           ),
                         );
                       }),
                 ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: !(vm.userList.length > 19)
                        ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    GroupMember(vm.userList.toList())));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Check More Group Members',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    )
                        : GestureDetector(
                      onTap: () {
                        jumpToProfile(
                                (BuildContext context, Animation animation,
                                Animation secondaryAnimation) =>
                                FriendSelect(SYSTEM_DISPATCH.GROUP),
                            context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Add More User in Group',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.add,
                            size: 16.0,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color:Color(0xfff1f1f1))),
                        color: Colors.white,
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Group Name',style: TextStyle(fontWeight: FontWeight.bold),),
                          Row(
                            children: <Widget>[
                              Text(vm.curChannel.name,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.grey),),
                              Icon(Icons.arrow_forward_ios,size: 16.0,color: Colors.grey,)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color:Color(0xfff1f1f1))),
                        color: Colors.white,
                      ),

                      child:Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Group Description',style: TextStyle(fontWeight: FontWeight.bold),),
                              ConstrainedBox(
                                constraints: BoxConstraints(minHeight: 50,maxWidth: double.infinity),
                                child:Text(vm.curChannel.description,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.grey),),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color:Color(0xfff1f1f1))),
                        color: Colors.white,
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Remarks',style: TextStyle(fontWeight: FontWeight.bold),),
                          Icon(Icons.arrow_forward_ios,size: 16.0,color: Colors.grey,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color:Color(0xfff1f1f1))),
                      color: Colors.white,
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Notification',style: TextStyle(fontWeight: FontWeight.bold),),
                        CupertinoSwitch(
                          value: marked,
                          onChanged: (_){
                            marked=!marked;
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color:Color(0xfff1f1f1))),
                      color: Colors.white,
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Set Top',style: TextStyle(fontWeight: FontWeight.bold),),
                        CupertinoSwitch(
                          value: received,
                          onChanged: (_){
                            received=!received;
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color:Color(0xfff1f1f1))),
                      color: Colors.white,
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Delete All Records and Leave Group',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 14.0),),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color:Color(0xfff1f1f1))),
                      color: Colors.white,
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Delete All Message',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChannelScreenViewModel>(
      converter: ChannelScreenViewModel.fromStore(false),
      builder: (context, vm) => _buildView(context, vm),
      distinct: true,
    );
  }
}
