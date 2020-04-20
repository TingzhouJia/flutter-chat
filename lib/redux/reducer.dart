
import 'package:built_collection/built_collection.dart';
import 'package:learnflutter/redux/action.dart';
import 'package:learnflutter/redux/auth/authReducer.dart';
import 'package:learnflutter/redux/channel/channel_reducer.dart';
import 'package:learnflutter/redux/messages/message_reducer.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/redux/userRedux/user_reducer.dart';
import 'package:redux/redux.dart';

final appReducer=combineReducers<AppState>([
  TypedReducer<AppState, GetFavor>(_onUserList),
  TypedReducer<AppState, GetGroup>(_onGrouprList),
  TypedReducer<AppState, GetRecentChat>(_onRecentChatList),
  TypedReducer<AppState, SetShownMessageOnScreen>(_onsetMessageOnScreen),
  TypedReducer<AppState, StartLoading>(_onLoading),
  TypedReducer<AppState, EndLoading>(_endLoading),
  ...userReducer,
  ...messageReducers,
  ...authReducers,
  ...channelReducers
]);

 AppState _onUserList(AppState state,GetFavor action){
    return state.rebuild((a)=>a
    ..FavorList=ListBuilder(action.favors)
    );
}
AppState _onsetMessageOnScreen(AppState state,SetShownMessageOnScreen action){
  return state.rebuild((a)=>a
    ..messageOnScreen=action.length
  );
}
AppState _onGrouprList(AppState state,GetGroup action){
  return state.rebuild((a)=>a
    ..groupList=ListBuilder(action.channels)
  );
}

AppState _onRecentChatList(AppState state,GetRecentChat action){

   return state.rebuild((a)=>a
   ..recentChatList=ListBuilder(action.recentChats)
   );
}
AppState _onLoading(AppState state,StartLoading ac){
   return state.rebuild((a)=>a ..loading=true );
}
AppState _endLoading(AppState state,EndLoading ac){
  return state.rebuild((a)=>a ..loading=false );
}