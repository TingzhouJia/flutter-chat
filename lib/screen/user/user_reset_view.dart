

import 'package:built_value/built_value.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/redux/userRedux/user_action.dart';
import 'package:redux/redux.dart';

//part 'user_reset_view.g.dart';
//
//
//abstract class UserResetViewModel
//    implements Built<UserResetViewModel, UserResetViewModelBuilder> {
//
//
//
//  User get user;
//
//  UserResetViewModel._();
//
//  factory UserResetViewModel(
//      [void Function(UserResetViewModelBuilder) updates]) =
//  _$UserResetViewModel;
//
//  static fromStore() {
//    return (Store<AppState> store) {
//      return UserResetViewModel((u) => u
//        .. =store.state.user.toBuilder());
//    };
//  }
//
//}