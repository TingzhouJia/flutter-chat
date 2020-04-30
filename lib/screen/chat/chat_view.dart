

import 'dart:core';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:learnflutter/model/friend.dart';
import 'package:learnflutter/model/group.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/redux/userRedux/user_action.dart';
import 'package:redux/redux.dart';

part 'chat_view.g.dart';

abstract class ChatScreenViewModel
    implements Built<ChatScreenViewModel, ChatScreenViewModelBuilder> {
  @nullable
  BuiltList<Message> get messageList;

  User get me;
  //target we are chat with
  @nullable
  Friend get target;
  @nullable
  Group get group;

  bool get loading;
  ChatScreenViewModel._();

  factory ChatScreenViewModel(
      [void Function(ChatScreenViewModelBuilder) updates]) =
  _$ChatScreenViewModel;



  static fromStore(isGroup) {

    return (Store<AppState> store)  {

      return isGroup?ChatScreenViewModel((u) => u
        ..loading=store.state.loading
        ..messageList=ListBuilder(store.state.selectedGroupChat)
        ..group=store.state.selectedGroup.toBuilder()
        ..me=store.state.user.toBuilder()
      ):ChatScreenViewModel((u) => u
        ..loading=store.state.loading
          ..messageList=ListBuilder(store.state.currentChat)
          ..me=store.state.user.toBuilder()
          ..target=store.state.currentTarget.toBuilder()
      );

    };
  }

//      ..channelType = getSelectedChannel(store.state)?.type);
}