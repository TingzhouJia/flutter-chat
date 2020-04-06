
import 'package:built_collection/built_collection.dart';
import 'package:learnflutter/redux/action.dart';
import 'package:learnflutter/redux/auth/authReducer.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/redux/userRedux/user_reducer.dart';
import 'package:redux/redux.dart';

final appReducer=combineReducers<AppState>([
  TypedReducer<AppState, GET>(_onUserList),
  ...userReducer,
  ...authReducers
]);

 AppState _onUserList(AppState state,GET action){
    return state.rebuild((a)=>a
    ..FavorList=ListBuilder(action.favors)
    );
}