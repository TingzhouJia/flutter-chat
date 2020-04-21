import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/redux/messages/message_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/redux/userRedux/user_action.dart';
import 'package:learnflutter/screen/chat/chat_screen.dart';
import 'package:learnflutter/screen/main/mainMessage/recentChat_view.dart';
import 'package:learnflutter/utils/timeDuration.dart';
import 'package:intl/intl.dart';

class RecentChat extends StatefulWidget {
  final BuiltList<recentMessage> recentChatList;

  final String uid;

  RecentChat(this.recentChatList, this.uid);

  @override
  _RecentChatState createState() => _RecentChatState();
}

class _RecentChatState extends State<RecentChat> {
  List<recentMessage> recentList;
  SlidableController slidableController;
  Animation<double> _rotationAnimation;
  SlidableState state;
  bool curOpen;

  @protected
  void initState() {
    state=new SlidableState();
    slidableController = SlidableController(
      onSlideAnimationChanged: handleSlideAnimationChanged,
      onSlideIsOpenChanged: handleSlideIsOpenChanged,
    );
    super.initState();
  }

  void handleSlideAnimationChanged(Animation<double> slideAnimation) {
    setState(() {
      _rotationAnimation = slideAnimation;
    });
  }



  void handleSlideIsOpenChanged(bool isOpen) {

    setState(() {
      curOpen = isOpen ? true : false;
    });
  }

  static Widget _getActionPane(int index) {
    switch (index % 4) {
      case 0:
        return SlidableBehindActionPane();
      case 1:
        return SlidableStrechActionPane();
      case 2:
        return SlidableScrollActionPane();
      case 3:
        return SlidableDrawerActionPane();
      default:
        return null;
    }
  }

  _getExactTime(DateTime time){
    DateTime dob = DateTime.parse(time.toString());
    final dur =  DateTime.now().difference(dob).inDays;
    if(2<=dur&&dur<=7){
      return DateFormat('EEEEE', ).format(time);
    }else if(dur>7){
      return DateFormat('yMMMMd', ).format(time);
    }else{
      return  DateFormat.jm().format(time);
    }
  }
  _buildView(context,RecentChatViewModel vm){
    recentList=vm.recentChatList.toList();
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
          child: ListView.builder(
              itemCount: recentList.length,
              itemBuilder: (BuildContext context, int index) {
                final recentMessage chat = recentList[index];
               final time = _getExactTime(chat.timestamp); //new DateFormat.jm().format(DateTime.parse(chat.timestamp.toString()));
                return Slidable(
                  controller: slidableController,
                  actionPane: SlidableScrollActionPane(),
                  key: Key('key$index'),
                  actionExtentRatio: 0.25,

                  dismissal: SlidableDismissal(
                    child: SlidableDrawerDismissal(),
                    closeOnCanceled: true,

                  ),
                  secondaryActions: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: 5.0, bottom: 5.0, right: 5.0, left: 5.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xfff0efef),
                                blurRadius: 5.0,
                                offset: Offset(3.0, 3.0))
                          ]),
                      child: IconSlideAction(
                        caption: chat.pending!=true?'UnRead':"Seen",

                        icon: Icons.more_horiz,
                        onTap: () {
                         StoreProvider.of<AppState>(context).dispatch(SetUnread(chat.id,chat.pending));
                        },
                        closeOnTap: true,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 5.0, bottom: 5.0, right: 5.0, left: 5.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xfff0efef),
                                blurRadius: 5.0,
                                offset: Offset(3.0, 3.0))
                          ]),
                      child: IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: (){

                          StoreProvider.of<AppState>(context).dispatch(DeleteRecentChat(chat.id));
                        },
                        closeOnTap: true,
                      ),
                    ),

                  ],
                  closeOnScroll: true,
                  child: GestureDetector(
                    onTap: () {
                      if(curOpen==true){
                        Slidable.of(context)?.close();
                        return;
                      }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ChatScreen(
                                )));


                      StoreProvider.of<AppState>(context).dispatch(SelectCurrentChat(chat.id));
                      StoreProvider.of<AppState>(context).dispatch(UpdateCurrentTarget(chat.id));



                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 5.0, bottom: 5.0, right: 5.0, left: 5.0),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      decoration: BoxDecoration(
                          color: chat.pending == true
                              ? Color(0xFFffe6eb)
                              : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xfff0efef),
                                blurRadius: 5.0,
                                offset: Offset(3.0, 3.0))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              ClipOval(
                                child: chat.imgUrl == ""
                                    ? Image(image: AssetImage('assets/default_img.jpg'),fit: BoxFit.cover,width: 35.0,height: 35.0,)
                                    :FadeInImage.assetNetwork(placeholder: 'assets/default_img.jpg', image: chat.imgUrl,width: 35.0,height: 35.0,fit: BoxFit.cover,),
                              ),
                              SizedBox(
                                width: 10.0,
                                height: 40.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    chat.authorId == widget.uid
                                        ? "You"
                                        : chat.userName,
                                    style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: Text(
                                      chat.body,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blueGrey),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              SizedBox(height: 10.0),
                              Text(
                                time,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              getDuration(chat.timestamp.toString()) < 30
                                  ? Container(
                                width: 40.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(30.0),
                                    color:
                                    Theme.of(context).primaryColor),
                                alignment: Alignment.center,
                                child: Text(
                                  'NEW',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                                  : Text('')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,RecentChatViewModel>(
      converter: RecentChatViewModel.fromStore(),
      distinct: true,
      builder: (context,vm)=>_buildView(context, vm),
    );
  }
}
