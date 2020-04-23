
import 'package:learnflutter/model/friend.dart';
import 'package:learnflutter/service/friendService.dart';
import 'package:redux/redux.dart';

import '../state.dart';
import 'friend_action.dart';

List<Middleware<AppState>> createUserMiddleware(
    FriendRepository friendRepository,

    ) {
  return [

    TypedMiddleware<AppState, UpdateCurrentTarget>(_listenToCurrentTarget(friendRepository)),
    TypedMiddleware<AppState, UpdateSetting>(_updateSetting(friendRepository)),
    TypedMiddleware<AppState, UpdateNickname>(_updateNickname(friendRepository)),
    TypedMiddleware<AppState, UpdateFriendBackGround>(_updateBackground(friendRepository)),

  ];
}

void Function(
    Store<AppState> store,
    UpdateCurrentTarget action,
    NextDispatcher next,
    ) _listenToCurrentTarget(
    FriendRepository friendRepository,
    ) {
  return (store, action, next) {
    next(action);
    try {

      friendRepository.getFriend(store.state.user.uid,action.uid).listen((user) {
            store.dispatch(OnUpdateCurrentTarget(user));
          });
    } catch (e){
      print("Failed to listen user");
    }
  };
}
void Function(
    Store<AppState> store,
    UpdateSetting action,
    NextDispatcher next,
    ) _updateSetting(
    FriendRepository friendRepository,
    ) {
  return (store, action, next) {
    next(action);
    try {

      friendRepository.updateNotification(action.set, store.state.user.uid, store.state.currentTarget.user.uid, action.result).then((_){
        switch(action.set){
          case FriendSetting.SET_TOP:
            Friend a=store.state.currentTarget.rebuild((c)=>c ..setTop=action.result);
            store.dispatch(OnUpdateCurrentTarget(a));
            break;
          case FriendSetting.NOTIFICATION:
            Friend a=store.state.currentTarget.rebuild((c)=>c ..setTop=action.result);
            store.dispatch(OnUpdateCurrentTarget(a));
            break;
          case FriendSetting.STRONG_NOTIFICATION:
            Friend a=store.state.currentTarget.rebuild((c)=>c ..setTop=action.result);
            store.dispatch(OnUpdateCurrentTarget(a));
            break;
        }

      });
    } catch (e){
      print("Failed to listen user");
    }
  };
}
void Function(
    Store<AppState> store,
    UpdateNickname action,
    NextDispatcher next,
    ) _updateNickname(
    FriendRepository friendRepository,
    ) {
  return (store, action, next) {
    next(action);
    try {


      friendRepository.updateNickName(action.nickname,store.state.user.uid,store.state.currentTarget.user.uid).then((_) {
        Friend user=store.state.currentTarget.rebuild((c)=>c ..nickName=action.nickname);
        store.dispatch(OnUpdateCurrentTarget(user));
      });
    } catch (e){
      print("Failed to listen user");
    }
  };
}
void Function(
    Store<AppState> store,
    UpdateFriendBackGround action,
    NextDispatcher next,
    ) _updateBackground(
    FriendRepository friendRepository,
    ) {
  return (store, action, next) {
    next(action);
    try {


      friendRepository.updateBackground(action.file,store.state.user.uid,store.state.currentTarget.user.uid).then((data) {
        Friend user=store.state.currentTarget.rebuild((c)=>c ..background=data);
        store.dispatch(OnUpdateCurrentTarget(user));
      });
    } catch (e){
      print("Failed to listen user");
    }
  };
}