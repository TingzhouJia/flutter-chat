

import 'dart:core';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/redux/userRedux/user_action.dart';
import 'package:redux/redux.dart';

part 'friend_screen_view.g.dart';

abstract class FriendScreenViewModel
    implements Built<FriendScreenViewModel, FriendScreenViewModelBuilder> {

  User get friend;

  FriendScreenViewModel._();

  factory FriendScreenViewModel(
      [void Function(FriendScreenViewModelBuilder) updates]) =
  _$FriendScreenViewModel;



  static fromStore() {
    return (Store<AppState> store)  {

//      store.dispatch(SelectChat(store.state.currentTarget.uid));
      return FriendScreenViewModel((u) => u
          ..friend=store.state.currentTarget.toBuilder()
      );

    };
  }

//      ..channelType = getSelectedChannel(store.state)?.type);
}