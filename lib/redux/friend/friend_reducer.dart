
import 'package:learnflutter/model/stranger.dart';
import 'package:redux/redux.dart';

import '../state.dart';
import 'friend_action.dart';

final friendReducer=<AppState Function(AppState,dynamic)>[

  TypedReducer<AppState, OnUpdateCurrentTarget>(_onTargetUpdate),
  TypedReducer<AppState, UpdateStranger>(_onStrangerUpdate),
  TypedReducer<AppState, OnAddFriend>(_onAddFriend),
  TypedReducer<AppState, FilterStranger>(_changeStranger),
  TypedReducer<AppState, OnchangeRequest>(_onChangeRequest),
];


AppState _onTargetUpdate(AppState state,OnUpdateCurrentTarget action){

  return state.rebuild((a)=>a
    ..currentTarget=action.user.toBuilder()
  );
}
AppState _changeStranger(AppState state,FilterStranger action){
  Stranger k=state.requestList.firstWhere((each)=>each.uid==action.id);
  return state.rebuild((a)=>a
   ..stranger=k.toBuilder()
  );
}
AppState _onStrangerUpdate(AppState state,UpdateStranger action){

  return state.rebuild((a)=>a
    ..stranger=action.stranger.toBuilder()
  );
}
AppState _onAddFriend(AppState state,OnAddFriend action){

  return state.rebuild((a)=>a
    ..Friends.add(action.user) ..currentTarget=action.a.toBuilder()
  );
}
AppState _onChangeRequest(AppState state,OnchangeRequest action){


  return state.rebuild((a)=>a
      ..requestList.removeWhere((content)=>content.uid==action.id)
  );
}