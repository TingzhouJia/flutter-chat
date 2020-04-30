import 'package:flutter/cupertino.dart';
import 'package:learnflutter/model/channel.dart';
import 'package:learnflutter/model/group.dart';
import 'package:learnflutter/redux/messages/message_action.dart';
import 'package:learnflutter/service/groupService.dart';
import 'package:redux/redux.dart';

import '../state.dart';
import '../subscription_stream.dart';
import 'channel_action.dart';

List<Middleware<AppState>> creategroupMiddleware(
  GroupRepository groupRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return [

    TypedMiddleware<AppState, LoadGroup>(
      _markGroupReadAndListenToGroupUpdates(groupRepository),
    ),
    TypedMiddleware<AppState, JoinChannelAction>(
      _joinGroup(groupRepository),
    ),
    TypedMiddleware<AppState, LeaveChannelAction>(
      _leaveGroup(groupRepository),
    ),
    TypedMiddleware<AppState, NotJoinChannelAction>(
      _notJoinGroup(groupRepository),
    ),
    TypedMiddleware<AppState, LoadGroups>(
      _listenToGroups(groupRepository),
    ),
    TypedMiddleware<AppState, CreateChannel>(
      _createGroup(
        groupRepository,
        navigatorKey,
      ),
    ),
    TypedMiddleware<AppState, EditGroupAction>(
      _editGroup(
        groupRepository,
        navigatorKey,
      ),
    ),
    TypedMiddleware<AppState, InviteToChannelAction>(
      _inviteToGroup(groupRepository),
    ),
    TypedMiddleware<AppState, ApplyToGroup>(
      _applyToGroup(groupRepository),
    ),
  ];
}

/// Fetches and selects group based on its id
void Function(
  Store<AppState> store,
  LoadGroups action,
  NextDispatcher next,
) _listenToGroups(GroupRepository groupRepository) {
  return (store, action, next) {
        groupRepository.getGroupsStream(action.uid).listen((data){
          store.dispatch(OnGroupsLoaded(data));
        });
  };
}

void Function(
  Store<AppState> store,
  LeaveChannelAction action,
  NextDispatcher next,
) _leaveGroup(
  GroupRepository groupRepository,
) {
  return (store, action, next) async {
    next(action);
    await _leavegroupInternal(
      groupRepository: groupRepository,
      groupId: action.groupId,
      userId: store.state.user.uid,
      store: store,
    );
  };
}

void Function(
    Store<AppState> store,
    NotJoinChannelAction action,
    NextDispatcher next,
    ) _notJoinGroup(
    GroupRepository groupRepository,
    ) {
  return (store, action, next) async {
    next(action);
    await groupRepository.notJoinChannel(group: action.group,uid: store.state.user.uid);
  };
}

Future<void> _leavegroupInternal({
  @required GroupRepository groupRepository,
  @required String groupId,
  @required List<String> members,
  @required String userId,
  @required Store<AppState> store,
}) async {
  try {
    await groupRepository.leaveChannel(groupId, userId, members);
    store.dispatch(LeftChannelAction(groupId));
  } catch (e) {
    print(e);
  }
}

_listenToGroupUpdates(
    {Store<AppState> store,
    LoadGroup action,
    GroupRepository groupRepository}) {
  selectedGroupSubscription?.cancel();
  // ignore: cancel_subscriptions
  selectedGroupSubscription = groupRepository
      .getStreamForChannel(action.groupId)
      .listen((updatedGroup) {
    store.dispatch(OnUpdatedGroupAction(action.groupId,updatedGroup));
  });
}

/// Does two things:
/// 1. Marks a group read (in case there are updates)
/// 2. Subscribes to group updates
///
/// We're handling both cases here is necessary since the subscription
/// to the group was overriding our local state change for a group (e.g. hasUpdates = false).
void Function(
  Store<AppState> store,
  LoadGroup action,
  NextDispatcher next,
) _markGroupReadAndListenToGroupUpdates(GroupRepository groupRepository) {
  return (store, action, next) {
    next(action);

    try {

        groupRepository
            .markChannelRead(action.groupId, store.state.user.uid, true)
            .then((_) {
          _listenToGroupUpdates(
              action: action, store: store, groupRepository: groupRepository);
        });
    } catch (e) {
     print(e);
    }
  };
}

void Function(
  Store<AppState> store,
  JoinChannelAction action,
  NextDispatcher next,
) _joinGroup(
  GroupRepository groupRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      final group = await groupRepository.joinChannel(

        action.group,
        store.state.user.uid,
      );
      final channel=Channel((c)=>c ..authorId=group.authorId ..name=group.name ..id=group.id ..description=group.description ..visibility=ChannelVisibilityHelper.valueOf(GroupVisibilityHelper.stringOf(group.visibility))
      ..hexColor=group.hexColor ..marked=false ..received=true);
     await store.dispatch(JoinedChannelAction(
        group,channel
      ));
     await store.dispatch(SelectGroupChat(action.groupId));
    } catch (error) {
     print(error);
      store.dispatch(JoinChannelFailedAction());
    }
  };
}

void Function(
    Store<AppState> store,
    ApplyToGroup action,
    NextDispatcher next,
    ) _applyToGroup(
    GroupRepository groupRepository,
    ) {
  return (store, action, next) async {
    next(action);
    try {
  await groupRepository.applyToChannel(group: action.channel,uid: store.state.user.uid).then((_){

  });
    } catch (error) {
      print(error);
      store.dispatch(JoinChannelFailedAction());
    }
  };
}







void Function(
  Store<AppState> store,
  CreateChannel action,
  NextDispatcher next,
) _createGroup(
  GroupRepository groupRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return (store, action, next) async {
    next(action);
    try {
      // Create group
      await groupRepository.createChannel(
        action.channel,
        [store.state.user.uid, ...action.invitedIds.toList()],
        store.state.user.uid,
      ).then((val){
        val.listen((data){

          store.dispatch(SystemMessageDispatch(action.invitedIds.toList()));
          Future.delayed(const Duration(milliseconds: 1000), () {
            store.dispatch(OnChannelCreated(data));
          });
        });
      });

    } catch (error) {
      print(error);
    }
  };
}

void Function(
  Store<AppState> store,
  EditGroupAction action,
  NextDispatcher next,
) _editGroup(
  GroupRepository groupRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return (store, action, next) async {
    next(action);

    try {
      await groupRepository.updateChannel(
        store.state.selectedGroup.id,
        action.group,
      );
      store.dispatch(
          OnUpdatedGroupAction(store.state.selectedGroup.id, action.group));

    } catch (error) {
      print(error);
    }
  };
}





void Function(
  Store<AppState> store,
  InviteToChannelAction action,
  NextDispatcher next,
) _inviteToGroup(
  GroupRepository groupRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
//      await groupRepository.inviteToChannel(
//          groupId: store.state.selectedGroup.id,
//          members: action.members,
//          invitingUsername: store.state.user.name,
//          groupName: store.state.selectedGroup.name).then(store.dispatch(SystemMessageDispatch(action.members)));
    await groupRepository.inviteToChannel(group: store.state.selectedGroup,members: action.members,invitingUser: store.state.user);
    } catch (error) {
     print(error);
    }
  };
}
