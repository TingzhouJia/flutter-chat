

import 'dart:core';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:redux/redux.dart';

part 'message_view.g.dart';

abstract class MessageScreenViewModel
    implements Built<MessageScreenViewModel, MessageScreenViewModelBuilder> {
  BuiltList<User> get favorContact;
  BuiltList<recentMessage> get recentChatList;
  void Function(String uid) get loadMessage;
  String get uid;
  MessageScreenViewModel._();

  factory MessageScreenViewModel(
      [void Function(MessageScreenViewModelBuilder) updates]) =
  _$MessageScreenViewModel;

//  static bool _hasData(Store<AppState> store) {
//    return store.state.user != null;
//  }
//
  static fromStore() {
    return (Store<AppState> store) {
      return MessageScreenViewModel((u) => u
        ..recentChatList=store.state.recentChatList.toBuilder()
        ..favorContact=store.state.FavorList.toBuilder()
          ..uid=store.state.user.uid
          ..loadMessage=(uid)=>store.dispatch(SelectChat(uid))
      );

    };
  }

//      ..channelType = getSelectedChannel(store.state)?.type);
}