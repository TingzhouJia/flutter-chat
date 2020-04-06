import 'package:flutter/material.dart';
import 'package:learnflutter/redux/auth/auth_action.dart';
import 'package:learnflutter/service/loginService.dart';
import 'package:learnflutter/service/userInfoService.dart';
import 'package:redux/redux.dart';

import '../action.dart';
import '../state.dart';

List<Middleware<AppState>> createAuthMiddleware(UserRepository authRepo,GlobalKey<NavigatorState> navigatorKey,) {
  return [TypedMiddleware<AppState, Login>(_authLogin(authRepo,navigatorKey)),
    TypedMiddleware<AppState,Signup>(_authSignUp(authRepo,navigatorKey)),
    TypedMiddleware<AppState, LogOut>(_authLogout(authRepo,navigatorKey)),
    TypedMiddleware<AppState, VerifyAuth>(_verifyAuthState(authRepo,navigatorKey)) ];
}

void Function(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) _authLogin(
  UserRepository userRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return (store, action, next) async {
    next(action);

      final user = await userRepository.signIn(action.email, action.password);
      store.dispatch(OnAuthenticated(user: user));

     // await navigatorKey.currentState.pushNamedAndRemoveUntil('/root', ModalRoute.withName("/root"));
      // Navigator.of(context);


  };
}
void Function(
    Store<AppState> store,
    dynamic action,
    NextDispatcher next,
    ) _authSignUp(
    UserRepository userRepository,
    GlobalKey<NavigatorState> navigatorKey,
    ) {
  return (store, action, next) async {
    next(action);

    final user = await userRepository.signUp(action.email, action.password);
    store.dispatch(OnAuthenticated(user: user));

    // await navigatorKey.currentState.pushNamedAndRemoveUntil('/root', ModalRoute.withName("/root"));
    // Navigator.of(context);


  };
}
void Function(
    Store<AppState> store,
    VerifyAuth action,
    NextDispatcher next,
    ) _verifyAuthState(
    UserRepository userRepository,
    GlobalKey<NavigatorState> navigatorKey,
    ) {
  return (store, action, next) {
    next(action);

    userRepository.getAuthenticationStateChange().listen((user) async {


      if (user == null) {
        navigatorKey.currentState.pushReplacementNamed('/login');
      } else {

       await store.dispatch(OnAuthenticated(user: user));
       await store.dispatch(ConnectToDataSource());
        navigatorKey.currentState.pushReplacementNamed('/app');
      }
    });
  };
}
void Function(
    Store<AppState> store,
    dynamic action,
    NextDispatcher next,
    ) _authLogout(
    UserRepository userRepository,
    GlobalKey<NavigatorState> navigatorKey,
    ) {
  return (store, action, next) async {
    next(action);
      await userRepository.logOut();
    navigatorKey.currentState.pushNamedAndRemoveUntil(
        "/login", ModalRoute.withName("/login"));
      store.dispatch(OnLogoutSuccess());

  };
}
