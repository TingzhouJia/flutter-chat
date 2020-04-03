

import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/userRedux/user_action.dart';
import 'package:redux/redux.dart';

import '../state.dart';

final userReducer=<AppState Function(AppState,dynamic)>[
    TypedReducer<AppState, OnUserUpdateAction>(_onUserUpdate),

];


AppState _onUserUpdate(AppState state, OnUserUpdateAction action) {
  return state.rebuild((a) => a
  // Update the app user
    ..user = action.user.toBuilder()
  );
}

