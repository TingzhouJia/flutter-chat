import 'dart:core';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:learnflutter/model/friend.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/redux/userRedux/user_action.dart';
import 'package:redux/redux.dart';

part 'chat_detail_view.g.dart';

abstract class ChatDetailViewModel
    implements Built<ChatDetailViewModel, ChatDetailViewModelBuilder> {
  @nullable

  User get me;
  //target we are chat with
  Friend get target;

  ChatDetailViewModel._();

  factory ChatDetailViewModel(
      [void Function(ChatDetailViewModelBuilder) updates]) =
  _$ChatDetailViewModel;



  static fromStore() {

    return (Store<AppState> store)  {

      return ChatDetailViewModel((u) => u
        ..me=store.state.user.toBuilder()
        ..target=store.state.currentTarget.toBuilder()
      );

    };
  }

//      ..channelType = getSelectedChannel(store.state)?.type);
}