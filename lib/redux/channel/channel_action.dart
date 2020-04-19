import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:learnflutter/model/channel.dart';
import 'package:learnflutter/model/group.dart';
import 'package:learnflutter/model/user.dart';

@immutable
class LoadGroups {
  final String uid;

  const LoadGroups(this.uid);

}

@immutable
class OnGroupsLoaded {

  final List<Channel> channels;

  const OnGroupsLoaded( this.channels);

}

class LoadGroup{
  final String groupId;

  LoadGroup(this.groupId);

}

class OnLoadGroup{
  final Group group;


  OnLoadGroup(this.group);
}

@immutable
class CreateChannel {
  final Channel channel;
  final BuiltList<String> invitedIds;


  const CreateChannel(
      this.channel,
      this.invitedIds,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CreateChannel &&
              runtimeType == other.runtimeType &&
              channel == other.channel &&
              invitedIds == other.invitedIds;

  @override
  int get hashCode =>
      channel.hashCode ^
      invitedIds.hashCode;

  @override
  String toString() {
    return "CreateChannel{channel: $channel, invitedIds: $invitedIds}";
  }
}
class MarkRead{
  String groupId;

  bool choice;

  MarkRead(this.groupId, this.choice);

}
class MarkReceived{
  String groupId;

  bool choice;

  MarkReceived(this.groupId, this.choice);

}

@immutable
class OnChannelCreated {
  final Group group;

  const OnChannelCreated(
      this.group,
      );
}

@immutable
class EditChannelAction {
  final Channel channel;


  const EditChannelAction(
      this.channel,

      );
}

@immutable
class OnUpdatedChannelAction {
  final String groupId;
  final Channel selectedChannel;

  const OnUpdatedChannelAction(this.groupId, this.selectedChannel);
}

@immutable
class SelectChannelIdAction {
  final String previousChannelId;
  final String channelId;
  final String userId;
  final String groupId;

  const SelectChannelIdAction({
    this.previousChannelId,
    this.channelId,
    this.groupId,
    this.userId,
  });
}

class SelectChat{
  final String target;
  SelectChat(this.target);

}
@immutable
class SelectChannel {
  final String previousChannelId;
  final Channel channel;
  final String userId;
  final String groupId;

  const SelectChannel({
    this.previousChannelId,
    this.channel,
    this.groupId,
    this.userId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SelectChannel &&
              runtimeType == other.runtimeType &&
              previousChannelId == other.previousChannelId &&
              channel == other.channel &&
              userId == other.userId &&
              groupId == other.groupId;

  @override
  int get hashCode =>
      previousChannelId.hashCode ^
      channel.hashCode ^
      userId.hashCode ^
      groupId.hashCode;

  @override
  String toString() {
    return "SelectChannel{previousChannelId: $previousChannelId, channel: $channel, userId: $userId, groupId: $groupId}";
  }
}

@immutable
class JoinChannelAction {
  final String groupId;
  final Group group;
  final String userId;

  const JoinChannelAction({
    @required this.groupId,
    @required this.group,
    @required this.userId,
  });
}

@immutable
class JoinedChannelAction {
  final String groupId;
  const JoinedChannelAction(
      this.groupId,

      );
}

@immutable
class JoinChannelFailedAction {}

@immutable
class ClearFailedJoinAction {}

@immutable
class LeaveChannelAction {
  final String groupId;
  final List<String> userList;

  const LeaveChannelAction(this.groupId,this.userList);
}

@immutable
class LeftChannelAction {
  final String groupId;


  const LeftChannelAction(this.groupId);
}



@immutable
class InviteToChannelAction {

    final  List<String> members;


  const InviteToChannelAction( this.members);
}

