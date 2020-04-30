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
class ApplyToGroup{
  final Channel channel;

  ApplyToGroup(this.channel);

}


class SelectChannel {
  final String groupId;

  SelectChannel(this.groupId);


}
class OnSelectChannel{
  final Channel channel;

  OnSelectChannel(this.channel);

}

@immutable
class JoinChannelAction {
  final String groupId;
  final Group group;


  const JoinChannelAction({
    @required this.groupId,
    @required this.group,

  });
}
class NotJoinChannelAction {
  final String groupId;
  final Channel group;


  const NotJoinChannelAction({
    @required this.groupId,
    @required this.group,

  });
}

@immutable
class JoinedChannelAction {
  final Group group;
  final Channel channel;
  const JoinedChannelAction(
      this.group,
      this.channel
      );
}
class EditGroupAction{
  final Group group;

  EditGroupAction(this.group);

}
class OnUpdatedGroupAction{
  final String groupId;
  final Group group;

  OnUpdatedGroupAction(this.groupId, this.group);

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

