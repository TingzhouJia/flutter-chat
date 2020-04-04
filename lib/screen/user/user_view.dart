

import 'dart:async';

import 'package:built_value/built_value.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/redux/userRedux/user_action.dart';
import 'package:redux/redux.dart';

part 'user_view.g.dart';


abstract class UserScreenViewModel
    implements Built<UserScreenViewModel, UserScreenViewModelBuilder> {
  User get user;


  UserScreenViewModel._();

  factory UserScreenViewModel(
      [void Function(UserScreenViewModelBuilder) updates]) =
  _$UserScreenViewModel;

  static fromStore() {
    return (Store<AppState> store) {

      return UserScreenViewModel((u) => u
        ..user = store.state.user.toBuilder()
      );
    };
  }

//  static UserBuilder _getUser(Store<AppState> store, String userId) {
//    return store.state.groupUsers
//        .firstWhere((user) => user.uid == userId)
//        .toBuilder();
//  }
}
