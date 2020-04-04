

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



  @BuiltValueField(compare: false)
  void Function(String Status) get submitStatus;

  @BuiltValueField(compare: false)
  void Function(DateTime birthday) get submitBirthday;

  @BuiltValueField(compare: false)
  void Function(int gender) get submitGender;

  @BuiltValueField(compare: false)
  void Function(String name) get submitName;

  @BuiltValueField(compare: false)
  void Function(String location) get submitLocation;

  UserScreenViewModel._();

  factory UserScreenViewModel(
      [void Function(UserScreenViewModelBuilder) updates]) =
  _$UserScreenViewModel;

  static fromStore() {
    return (Store<AppState> store) {
      return UserScreenViewModel((u) => u
        ..user = store.state.user.toBuilder()
//        ..submitGender=(gender)=>store.dispatch(UpdateUserGender(gender: gender,user: store.state.user))
//        ..submitStatus=(status)=>store.dispatch(UpdateUserStatus(status: status,user: store.state.user))
//        ..submitBirthday=(birthday)=>store.dispatch(UpdateUserBirthday(birthday: birthday,user: store.state.user))
//        ..submitName=(name)=>store.dispatch(UpdateUserName(name: name,user: store.state.user))
//        ..submitLocation=(location)=>store.dispatch(UpdateUserLocation(Location:location,user: store.state.user))
      );
    };
  }

//  static UserBuilder _getUser(Store<AppState> store, String userId) {
//    return store.state.groupUsers
//        .firstWhere((user) => user.uid == userId)
//        .toBuilder();
//  }
}
