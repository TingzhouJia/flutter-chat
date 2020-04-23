import 'package:built_collection/built_collection.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/screen/main/mainMessage/RecentChats.dart';
import 'package:learnflutter/service/messageService.dart';
import 'package:redux/redux.dart';
import '../state.dart';
import 'message_action.dart';

final messageReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, UpdateAllMessages>(_onMessageUpdated),
  TypedReducer<AppState, OnSendMessage>(_onMessageSend),
  TypedReducer<AppState, OnDeleteRecentChat>(_onRecentChatDelete),
  TypedReducer<AppState, OnSetUnread>(_onSetUnread),
  TypedReducer<AppState, UpdateRecentChat>(_onUpdateRecent),
  TypedReducer<AppState, UpdateAllGroupChat>(_onUpdateGroup),
  TypedReducer<AppState, UpdateMoreMessage>(_onUpdateMoreMessage),
];

AppState _onMessageUpdated(AppState state, UpdateAllMessages action) {

  return state.rebuild((a) => a ..currentChat=ListBuilder(action.data)  ..loading=false);
}

AppState _onMessageSend(AppState state, OnSendMessage action) {
  recentMessage a=state.recentChatList.firstWhere((c)=>c.id==state.currentTarget.user.uid);
  a.rebuild((c)=>c
    ..messageType=action.message.messageType ..body=action.message.body ..authorId=action.message.authorId);
  int b=state.recentChatList.indexWhere((c)=>c.id==state.currentTarget.user.uid);
  ListBuilder<Message> newList=state.currentChat.rebuild((c)=>c ..add(action.message) ).toBuilder();
  BuiltList<recentMessage> rencent=state.recentChatList.rebuild((c)=>c ..replaceRange(b, b+1, [a]));
  return state.rebuild((a) => a ..currentChat=newList ..recentChatList=ListBuilder(rencent)  ..loading=false  );
}
AppState _onUpdateGroup(AppState state, UpdateAllGroupChat action) {
  return state.rebuild((a) => a ..selectedGroupChat = ListBuilder(action.data) ..loading=false);
}
AppState _onRecentChatDelete(AppState state,OnDeleteRecentChat action){
  var newList=state.recentChatList.where((id)=>id.authorId!=action.uid);
  return state.rebuild((a)=>a ..recentChatList=ListBuilder(newList));
}
AppState _onSetUnread(AppState state,OnSetUnread action){
  int index=state.recentChatList.indexWhere((test)=>test.id==action.uid);
  var newList=state.recentChatList.firstWhere((test){
    return test.authorId==action.uid;
  });
  newList.rebuild((c)=>c ..pending=!action.pending);
  var c=state.recentChatList.rebuild((a)=>a ..replaceRange(index, index+1, [newList]));
  return state.rebuild((a)=>a ..recentChatList=ListBuilder(c));
}
AppState _onUpdateRecent(AppState state,UpdateRecentChat action){
  int a=state.recentChatList.indexWhere((c)=>c.id==state.currentTarget.user.uid);
  return state.rebuild((c)=>c ..recentChatList.replaceRange(a, a+1, [action.data]));

}
AppState _onUpdateMoreMessage(AppState state, UpdateMoreMessage action) {
  final cur=state.currentChat.rebuild((c)=>c ..addAll(action.data));
  return state.rebuild((a) => a ..currentChat=ListBuilder(cur) ..loading=false);
}