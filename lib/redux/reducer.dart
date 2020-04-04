
import 'package:learnflutter/redux/auth/authReducer.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/redux/userRedux/user_reducer.dart';
import 'package:redux/redux.dart';

final appReducer=combineReducers([
  ...userReducer,
  ...authReducers
]);