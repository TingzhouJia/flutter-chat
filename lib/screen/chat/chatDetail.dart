import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/screen/chat/chat_detail_view.dart';

class ChatDetail extends StatefulWidget {
  @override
  _ChatDetailState createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {

  _buildView(context, ChatDetailViewModel vm){
    return SingleChildScrollView(
      child:Column(
        children: <Widget>[

        ],
      ) ,
    );
  }
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,ChatDetailViewModel>(
      converter: ChatDetailViewModel.fromStore(),
      builder: (context,vm)=>_buildView(context,vm),
      distinct: true,
    );
  }
}
