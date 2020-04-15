import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';

import '../state.dart';
import 'message_action.dart';

final messageReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, UpdateAllMessages>(_onMessageUpdated),
  TypedReducer<AppState, OnDeleteRecentChat>(_onRecentChatDelete),
  TypedReducer<AppState, OnSetUnread>(_onSetUnread),
  TypedReducer<AppState, UpdateRecentChat>(_onUpdateRecent),
];

AppState _onMessageUpdated(AppState state, UpdateAllMessages action) {
  return state.rebuild((a) => a..currentChat = ListBuilder(action.data));
}
AppState _onRecentChatDelete(AppState state,OnDeleteRecentChat action){
  var newList=state.recentChatList.where((id)=>id.authorId!=action.uid);
  return state.rebuild((a)=>a ..recentChatList=ListBuilder(newList));
}
AppState _onSetUnread(AppState state,OnSetUnread action){
  var newList=state.recentChatList.firstWhere((test){
    return test.authorId==action.uid;
  });
  newList.rebuild((c)=>c ..pending=!action.pending);
  var c=state.recentChatList.rebuild((a)=>a ..add(newList));
  return state.rebuild((a)=>a ..recentChatList=ListBuilder(c));
}
AppState _onUpdateRecent(AppState state,UpdateRecentChat action){
//  var newList=state.recentChatList.firstWhere((test){
//    return test.authorId==action;
//  });
//  return state.rebuild((a)=>a, )
}