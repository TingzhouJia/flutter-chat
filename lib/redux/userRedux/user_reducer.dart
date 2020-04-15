

import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/userRedux/user_action.dart';
import 'package:redux/redux.dart';

import '../state.dart';

final userReducer=<AppState Function(AppState,dynamic)>[
    TypedReducer<AppState, OnUserUpdateAction>(_onUserUpdate),
  TypedReducer<AppState, OnUpdateCurrentTarget>(_onTargetUpdate),
];


AppState _onUserUpdate(AppState state, OnUserUpdateAction action) {

  return state.rebuild((a) => a
  // Update the app user
    ..user = action.user.toBuilder()
  );
}
AppState _onTargetUpdate(AppState state,OnUpdateCurrentTarget action){
  return state.rebuild((a)=>a
  ..currentTarget=action.user.toBuilder()
  );
}

