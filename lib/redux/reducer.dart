
import 'package:built_collection/built_collection.dart';
import 'package:learnflutter/redux/action.dart';
import 'package:learnflutter/redux/auth/authReducer.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/redux/userRedux/user_reducer.dart';
import 'package:redux/redux.dart';

final appReducer=combineReducers<AppState>([
  TypedReducer<AppState, GetFavor>(_onUserList),
  TypedReducer<AppState, GetRecentChat>(_onRecentChatList),
  ...userReducer,
  ...authReducers
]);

 AppState _onUserList(AppState state,GetFavor action){
    return state.rebuild((a)=>a
    ..FavorList=ListBuilder(action.favors)
    );
}

AppState _onRecentChatList(AppState state,GetRecentChat action){
   return state.rebuild((a)=>a
   ..recentChatList=ListBuilder(action.recentChats)
   );
}