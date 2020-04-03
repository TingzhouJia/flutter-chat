
import 'package:learnflutter/redux/auth/auth_action.dart';
import 'package:learnflutter/redux/userRedux/user_action.dart';
import 'package:learnflutter/service/userInfoService.dart';
import 'package:redux/redux.dart';

import '../state.dart';
import '../subscription_stream.dart';

List<Middleware<AppState>> createUserMiddleware(
    UserRepository userRepository,

    ) {
  return [
    TypedMiddleware<AppState, OnAuthenticated>(_listenToUser(userRepository)),
    TypedMiddleware<AppState, UpdateUserDescription>(_updateUserDescription(userRepository)),
    TypedMiddleware<AppState, UpdateUserAvatar>(_updateUserAvatar(userRepository)),
    TypedMiddleware<AppState, UpdateUserGender>(_updateUserGender(userRepository)),
    TypedMiddleware<AppState, UpdateUserStatus>(_updateUserStatus(userRepository)),
    //TypedMiddleware<AppState, UpdateUserAction>(_updateUser(userRepository)),
  ];
}

void Function(
    Store<AppState> store,
    OnAuthenticated action,
    NextDispatcher next,
    ) _listenToUser(
    UserRepository userRepository,
    ) {
  return (store, action, next) {
    next(action);
    try {
      userUpdateSubscription?.cancel();
      userUpdateSubscription =
          userRepository.getUserStream(action.user.uid).listen((user) {
            store.dispatch(OnUserUpdateAction(user));
          });
    } catch (e){
     print("Failed to listen user");
    }
  };
}

void Function(
    Store<AppState> store,
    UpdateUserDescription action,
    NextDispatcher next,
    ) _updateUserDescription(
    UserRepository userRepository,
    ) {
  return (store, action, next) async {
    next(action);
    if (store.state.user.uid == action.user.uid) {
      try {
        await userRepository.updateUserDescription(action.description);
        final user1=action.user.rebuild((b)=>b ..description=action.description);
        store.dispatch(OnUserUpdateAction(user1));

      } catch (error) {
        print(error);
      }
    }

  };
}
void Function(
    Store<AppState> store,
    UpdateUserGender action,
    NextDispatcher next,
    ) _updateUserGender(
    UserRepository userRepository,

    ) {
  return (store, action, next) async {
    next(action);
    if (store.state.user.uid == action.user.uid) {
      try {
        await userRepository.updateUserGender(action.gender);
        final user1=action.user.rebuild((b)=>b ..gender=action.gender);
        store.dispatch(OnUserUpdateAction(user1));

      } catch (error) {
        print(error);
      }
    }

  };
}
void Function(
    Store<AppState> store,
    UpdateUserAvatar action,
    NextDispatcher next,
    ) _updateUserAvatar(
    UserRepository userRepository,

    ) {
  return (store, action, next) async {
    next(action);
    if (store.state.user.uid == action.user.uid) {
      try {
       String img= await userRepository.updateUserAvatar(action.img);
        final user1=action.user.rebuild((b)=>b ..imgUrl=img);
        store.dispatch(OnUserUpdateAction(user1));

      } catch (error) {
        print(error);
      }
    }

  };
}
void Function(
    Store<AppState> store,
    UpdateUserStatus action,
    NextDispatcher next,
    ) _updateUserStatus(
    UserRepository userRepository,

    ) {
  return (store, action, next) async {
    next(action);
    if (store.state.user.uid == action.user.uid) {
      try {
        await userRepository.updateStatus(action.status);
        final user1=action.user.rebuild((b)=>b ..status=action.status);
        store.dispatch(OnUserUpdateAction(user1));

      } catch (error) {
        print(error);
      }
    }

  };
}