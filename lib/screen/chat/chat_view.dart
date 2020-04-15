

import 'dart:core';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:redux/redux.dart';

part 'chat_view.g.dart';

abstract class ChatScreenViewModel
    implements Built<ChatScreenViewModel, ChatScreenViewModelBuilder> {
  @nullable
  BuiltList<Message> get messageList;
  @nullable
  User get target;
  User get me;
  ChatScreenViewModel._();

  factory ChatScreenViewModel(
      [void Function(ChatScreenViewModelBuilder) updates]) =
  _$ChatScreenViewModel;

//  static bool _hasData(Store<AppState> store) {
//    return store.state.user != null;
//  }
//
  static fromStore() {
    return (Store<AppState> store) {
      return ChatScreenViewModel((u) => u
          ..messageList=ListBuilder(store.state.currentChat)
          ..target=store.state.currentTarget.toBuilder()
          ..me=store.state.user.toBuilder()
      );

    };
  }

//      ..channelType = getSelectedChannel(store.state)?.type);
}