
import 'dart:io';

import 'package:built_value/built_value.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/redux/userRedux/user_action.dart';
import 'package:redux/redux.dart';

part 'reset_avatar_view.g.dart';


abstract class ResetAvatarViewModel
    implements Built<ResetAvatarViewModel, ResetAvatarViewModelBuilder> {

  void Function(File img) get submit;

  ResetAvatarViewModel._();

  factory ResetAvatarViewModel(
      [void Function(ResetAvatarViewModelBuilder) updates]) =
  _$ResetAvatarViewModel;

  static fromStore(){
    return (Store<AppState> store){
      return ResetAvatarViewModel((u)=>u
          ..submit=(img)=>store.dispatch(UpdateUserAvatar(user: store.state.user,img: img))
      );
    };
  }
}