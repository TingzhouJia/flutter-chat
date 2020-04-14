import 'dart:core';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/messages/message_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:redux/redux.dart';

part 'recentChat_view.g.dart';

abstract class RecentChatViewModel
    implements Built<RecentChatViewModel, RecentChatViewModelBuilder> {
  BuiltList<recentMessage> get recentChatList;

  String get uid;
  RecentChatViewModel._();

  factory RecentChatViewModel(
      [void Function(RecentChatViewModelBuilder) updates]) =
  _$RecentChatViewModel;

//  static bool _hasData(Store<AppState> store) {
//    return store.state.user != null;
//  }
//
  static fromStore() {
    return (Store<AppState> store) {
      return RecentChatViewModel((u) => u
        ..recentChatList=store.state.recentChatList.toBuilder()
        ..uid=store.state.user.uid


        
      );

    };
  }

//      ..channelType = getSelectedChannel(store.state)?.type);
}