

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

part 'chat_view.g.dart';

abstract class ChatScreenViewModel
    implements Built<ChatScreenViewModel, ChatScreenViewModelBuilder> {
  @nullable
  BuiltList<Message> get messageList;

  User get me;

  bool get loading;
  ChatScreenViewModel._();

  factory ChatScreenViewModel(
      [void Function(ChatScreenViewModelBuilder) updates]) =
  _$ChatScreenViewModel;



  static fromStore() {

    return (Store<AppState> store)  {

//      store.dispatch(SelectChat(store.state.currentTarget.uid));
      return ChatScreenViewModel((u) => u
            ..loading=store.state.loading
          ..messageList=store.state.loading?ListBuilder():ListBuilder(store.state.currentChat)
          ..me=store.state.user.toBuilder()
      );

    };
  }

//      ..channelType = getSelectedChannel(store.state)?.type);
}