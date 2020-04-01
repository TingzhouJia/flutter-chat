import 'package:flutter/material.dart';
import 'package:learnflutter/redux/auth/auth_action.dart';
import 'package:learnflutter/service/loginService.dart';
import 'package:redux/redux.dart';

import '../action.dart';
import '../state.dart';

List<Middleware<AppState>> createAuthMiddleware(Auth authRepo,GlobalKey<NavigatorState> navigatorKey,) {
  return [TypedMiddleware<AppState, Login>(_authLogin(authRepo,navigatorKey)),
    TypedMiddleware<AppState, LogOut>(_authLogout(authRepo,navigatorKey)),TypedMiddleware<AppState, Login>(_authLogin(authRepo,navigatorKey)) ];
}

void Function(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) _authLogin(
  Auth userRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return (store, action, next) async {
    next(action);

      final user_id = await userRepository.signIn(action.email, action.password);
      store.dispatch(OnAuthenticated(user_id: user_id));

     // await navigatorKey.currentState.pushNamedAndRemoveUntil('/root', ModalRoute.withName("/root"));
      // Navigator.of(context);


  };
}
void Function(
    Store<AppState> store,
    VerifyAuth action,
    NextDispatcher next,
    ) _verifyAuthState(
    Auth userRepository,
    GlobalKey<NavigatorState> navigatorKey,
    ) {
  return (store, action, next) {
    next(action);

    userRepository.getCurrentUser().then((user) {
      if (user == null) {
        navigatorKey.currentState.pushReplacementNamed('/login');
      } else {
        store.dispatch(OnAuthenticated(user_id: user.uid));
        store.dispatch(ConnectToDataSource());
      }
    });
  };
}
void Function(
    Store<AppState> store,
    dynamic action,
    NextDispatcher next,
    ) _authLogout(
    Auth userRepository,
    GlobalKey<NavigatorState> navigatorKey,
    ) {
  return (store, action, next) async {
    next(action);
      await userRepository.signOut();

      store.dispatch(OnLogoutSuccess());

  };
}
