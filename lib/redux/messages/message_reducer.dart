import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import '../state.dart';
import 'message_action.dart';

final messageReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, UpdateAllMessages>(_onMessageUpdated),
  TypedReducer<AppState, OnDeleteRecentChat>(_onRecentChatDelete),
  TypedReducer<AppState, OnSetUnread>(_onSetUnread),
  TypedReducer<AppState, UpdateRecentChat>(_onUpdateRecent),
  TypedReducer<AppState, UpdateAllGroupChat>(_onUpdateGroup),
  TypedReducer<AppState, UpdateMoreMessage>(_onUpdateMoreMessage),
];

AppState _onMessageUpdated(AppState state, UpdateAllMessages action) {
  return state.rebuild((a) => a ..currentChat=ListBuilder(action.data) ..loading=false);
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
//  var newList=state.recentChatList.firstWhere((test){
//    return test.authorId==action;
//  });
//  return state.rebuild((a)=>a, )
}
AppState _onUpdateMoreMessage(AppState state, UpdateMoreMessage action) {
  final cur=state.currentChat.rebuild((c)=>c ..addAll(action.data));
  return state.rebuild((a) => a ..currentChat=ListBuilder(cur) ..loading=false);
}