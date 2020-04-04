

import 'package:built_value/built_value.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/redux/userRedux/user_action.dart';
import 'package:redux/redux.dart';

part 'user_reset_view.g.dart';


abstract class UserResetViewModel
    implements Built<UserResetViewModel, UserResetViewModelBuilder> {




  void Function(String status) get submitStatus;


  void Function(DateTime birthday) get submitBirthday;


  void Function(int gender) get submitGender;


  void Function(String name) get submitName;


  void Function(String location) get submitLocation;

  UserResetViewModel._();

  factory UserResetViewModel(
      [void Function(UserResetViewModelBuilder) updates]) =
  _$UserResetViewModel;

  static fromStore() {
    return (Store<AppState> store) {
      return UserResetViewModel((u) =>u

        ..submitBirthday=(birthday)=>store.dispatch(UpdateUserBirthday(birthday: birthday,user: store.state.user))
        ..submitGender=(gender)=>store.dispatch(UpdateUserGender(gender: gender,user: store.state.user))
        ..submitStatus=(status)=>store.dispatch(UpdateUserStatus(status: status,user: store.state.user))

        ..submitName=(name)=>store.dispatch(UpdateUserName(name: name,user: store.state.user))
        ..submitLocation=(location)=>store.dispatch(UpdateUserLocation(Location:location,user: store.state.user))
      );
    };
  }
}