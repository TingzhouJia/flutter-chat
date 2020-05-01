import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/group/channel_view.dart';

class GroupDetail extends StatefulWidget {
  @override
  _GroupDetailState createState() => _GroupDetailState();
}

class _GroupDetailState extends State<GroupDetail> {

  _buildView(context, ChannelScreenViewModel vm){
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            elevation: 0.0,
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(30.0))),
              child: SingleChildScrollView(
                child:Column(
                  children: <Widget>[
                    GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

                    ), itemCount: vm.userList.length, itemBuilder: (context,index){
                      User a=vm.userList[index];
                      return Column(
                        children: <Widget>[
                          ClipOval(
                            child: FadeInImage(
                              placeholder: AssetImage('assets/default_img.jpg'),
                              image: NetworkImage(a.imgUrl),
                              width: 35.0,
                              height: 35.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(a.name)
                        ],
                      );
                    }),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ) ,
              ),
            ) ;
          },
        ),
      );
  }
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,ChannelScreenViewModel>(
      converter: ChannelScreenViewModel.fromStore(false),
      builder: (context,vm)=>_buildView(context, vm),
      distinct: true,
    );
  }
}
