import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/main/mainMessage/message_view.dart';
import 'package:learnflutter/screen/main/mainMessage/RecentChats.dart';
import 'package:learnflutter/screen/main/mainMessage/favoriteContact.dart';

class MessageScreen extends StatelessWidget {

  _buildView(context,MessageScreenViewModel vm){
    return
     ConstrainedBox(
       constraints:BoxConstraints(minHeight: double.infinity),
       child:  Container(

           decoration: BoxDecoration(

               color: Theme.of(context).accentColor,
               borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),

           child: Column(
             mainAxisSize: MainAxisSize.max,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[ FavoriteContact(vm.favorContact),RecentChat(vm.recentChatList,vm.uid)],
           )



       ),
     );
  }
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,MessageScreenViewModel>(
      converter: MessageScreenViewModel.fromStore(),
      builder: (context,vm)=>_buildView(context, vm),
      distinct: true,
    );

  }
}