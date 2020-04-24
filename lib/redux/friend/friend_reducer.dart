
import 'package:redux/redux.dart';

import '../state.dart';
import 'friend_action.dart';

final friendReducer=<AppState Function(AppState,dynamic)>[

  TypedReducer<AppState, OnUpdateCurrentTarget>(_onTargetUpdate),
];


AppState _onTargetUpdate(AppState state,OnUpdateCurrentTarget action){

  return state.rebuild((a)=>a
    ..currentTarget=action.user.toBuilder()
  );
}