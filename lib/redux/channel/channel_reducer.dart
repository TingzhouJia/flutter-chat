import 'package:built_collection/built_collection.dart';
import 'package:learnflutter/model/channel.dart';
import 'package:learnflutter/model/group.dart';
import 'package:redux/redux.dart';

import '../state.dart';
import 'channel_action.dart';

final channelReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, OnGroupsLoaded>(_onChannelsLoaded),
  TypedReducer<AppState, OnChannelCreated>(_onChannelCreated),
  TypedReducer<AppState, OnUpdatedGroupAction>(_onUpdateSelectedChannel),
  TypedReducer<AppState, JoinedChannelAction>(_onJoinedChannel),
  TypedReducer<AppState, LeftChannelAction>(_onLeftChannel),
//  TypedReducer<AppState, JoinChannelFailedAction>(_onJoinChannelFailed),
//  TypedReducer<AppState, ClearFailedJoinAction>(_onClearFailedJoin),

];
//
//AppState _onJoinChannelFailed(AppState state, JoinChannelFailedAction action) {
//  return state.rebuild(
//          (a) => a..channelState.update((s) => s..joinChannelFailed = true));
//}
//
//AppState _onClearFailedJoin(AppState state, ClearFailedJoinAction action) {
//  return state.rebuild(
//          (a) => a..channelState.update((s) => s..joinChannelFailed = false));
//}

AppState _onJoinedChannel(AppState state, JoinedChannelAction action) {
  return state.rebuild((c)=>c ..selectedGroup=action.group.toBuilder() ..groupList.add(action.channel) );
}

AppState _onLeftChannel(AppState state, LeftChannelAction action) {

  return state.rebuild((c)=>c ..selectedGroupChat=null ..selectedGroup=null ..groupList.removeWhere((each)=>each.id==action.groupId));
}

AppState _onUpdateSelectedChannel(
    AppState state, OnUpdatedGroupAction action) {
  int place =state.groupList.indexWhere((each)=>each.id==action.groupId);
  final channel=toChannel(action.group);
  final channelList=state.groupList.rebuild((c)=>c ..replaceRange(place, place+1, [channel]));
  return state.rebuild((c)=>c ..groupList=ListBuilder(channelList) ..selectedGroup=action.group.toBuilder() );
}

//AppState _updateChannel(
//    AppState state,
//    Channel channel,
//    String groupId,
//    ) {
//  final groupChannels = (GroupBuilder c) {
//    return c
//      ..channels.update((channels) {
//        channels[channel.id] = channel;
//      });
//  };
//
//  return state.rebuild((s) {
//    return s
//      ..groups.update((groups) {
//        groups[groupId] = groups[groupId].rebuild(groupChannels);
//      });
//  });
//}

AppState _onChannelsLoaded(AppState state, OnGroupsLoaded action) {

  return state.rebuild((a)=>a ..groupList=ListBuilder(action.channels));
}


AppState _onChannelCreated(AppState state, OnChannelCreated action) {
  final group=action.group;
  final created=toChannel(group);
  final newChannel=state.groupList.rebuild((a)=>a ..add(created));
  return state.rebuild((a)=>a ..selectedGroup=group.toBuilder() ..groupList=ListBuilder(newChannel) );
}

Channel toChannel(Group group){
  return Channel((c)=>c ..id=group.id ..hexColor=group.hexColor ..name=group.name
    ..visibility=ChannelVisibilityHelper.valueOf(GroupVisibilityHelper.stringOf(group.visibility)) ..description=group.description);
}


//AppState _selectChannel(AppState state, SelectChannel action) {
////  final GroupUiStateBuilder Function(GroupUiStateBuilder value)
////  updateLastSelectedChannel =
////      (g) => g..lastSelectedChannel = action.channel.id;
////
////  final updatedState = state.rebuild(
////        (s) => s
////      ..channelState.selectedChannel = action.channel.id
////      ..uiState.groupUiState.updateValue(
////        action.groupId,
////            (g) => g.rebuild(updateLastSelectedChannel),
////        ifAbsent: () => GroupUiState(updateLastSelectedChannel),
////      ),
////  );
//  return state.rebuild((c)=>c )
//  // Mark channel as read
////  final channel = action.channel.rebuild((c) => c..hasUpdates = false);
////  return _updateChannel(updatedState, channel, action.groupId);
//}
