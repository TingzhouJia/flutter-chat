import 'package:flutter/cupertino.dart';
import 'package:learnflutter/redux/messages/message_action.dart';
import 'package:learnflutter/service/groupService.dart';
import 'package:redux/redux.dart';

import '../state.dart';
import 'channel_action.dart';

List<Middleware<AppState>> creategroupMiddleware(
  GroupRepository groupRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return [
    TypedMiddleware<AppState, SelectgroupIdAction>(
      _selectgroupId(groupRepository),
    ),
    TypedMiddleware<AppState, LoadGroup>(
      _markgroupReadAndListenTogroupUpdates(groupRepository),
    ),
    TypedMiddleware<AppState, JoingroupAction>(
      _joingroup(groupRepository),
    ),
    TypedMiddleware<AppState, LeavegroupAction>(
      _leavegroup(groupRepository),
    ),
    TypedMiddleware<AppState, LoadGroups>(
      _listenToGroups(groupRepository),
    ),
    TypedMiddleware<AppState, Creategroup>(
      _creategroup(
        groupRepository,
        navigatorKey,
      ),
    ),
    TypedMiddleware<AppState, EditgroupAction>(
      _editgroup(
        groupRepository,
        navigatorKey,
      ),
    ),
    TypedMiddleware<AppState, InviteToChannelAction>(
      _inviteTogroup(groupRepository),
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
  LeavegroupAction action,
  NextDispatcher next,
) _leavegroup(
  groupRepository groupRepository,
) {
  return (store, action, next) async {
    next(action);
    await _leavegroupInternal(
      groupRepository: groupRepository,
      groupId: action.groupId,
      groupId: action.group.id,
      userId: action.userId,
      store: store,
    );
  };
}

Future<void> _leavegroupInternal({
  @required groupRepository groupRepository,
  @required String groupId,
  @required String groupId,
  @required String userId,
  @required Store<AppState> store,
}) async {
  try {
    await groupRepository.leavegroup(groupId, groupId, userId);
    store.dispatch(LeftgroupAction(groupId, groupId, userId));
  } catch (e) {
    Logger.e("Failed to leave group", e: e, s: StackTrace.current);
  }
}

_listenTogroupUpdates(
    {Store<AppState> store,
    Selectgroup action,
    groupRepository groupRepository}) {
  selectedgroupubscription?.cancel();
  // ignore: cancel_subscriptions
  selectedgroupubscription = groupRepository
      .getStreamForgroup(action.groupId, action.group.id, action.userId)
      .listen((updatedgroup) {
    store.dispatch(OnUpdatedgroupAction(action.groupId, updatedgroup));
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
) _markgroupReadAndListenTogroupUpdates(GroupRepository groupRepository) {
  return (store, action, next) {
    next(action);

    try {
      if (action.group.users.any((u) => u.id == action.userId)) {
        groupRepository
            .markgroupRead(action.groupId, action.group.id, action.userId)
            .then((_) {
          _listenTogroupUpdates(
              action: action, store: store, groupRepository: groupRepository);
        });
      } else {
        _listenTogroupUpdates(
            action: action, store: store, groupRepository: groupRepository);
      }
    } catch (e) {
     print(e);
    }
  };
}

void Function(
  Store<AppState> store,
  JoingroupAction action,
  NextDispatcher next,
) _joingroup(
  groupRepository groupRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      final group = await groupRepository.joingroup(
        action.groupId,
        action.group,
        action.user.uid,
      );
      store.dispatch(JoinedgroupAction(
        action.groupId,
        group,
      ));
    } catch (error) {
      Logger.e("Failed join group", e: error, s: StackTrace.current);
      store.dispatch(JoingroupFailedAction());
    }
  };
}

void Function(
  Store<AppState> store,
  Loadgroup action,
  NextDispatcher next,
) _listenTogroup(
  groupRepository groupRepository,
) {
  return (store, action, next) {
    next(action);
    listOfgroupSubscription?.cancel();
    // ignore: cancel_subscriptions
    listOfgroupSubscription = groupRepository
        .getgroupStream(action.groupId, store.state.user.uid)
        .listen((group) {
      if (group.isNotEmpty) {
        store.dispatch(OngroupLoaded(action.groupId, group));

        final selectedgroup = getSelectedgroup(store.state);

        // If the selected group is null
        // Or the selected group does NOT belong to this group
        //  (e.g. user selected a different group)
        if (selectedgroup == null || !_isgroupInList(group, selectedgroup)) {
          // Select a group based on this logic
          final group = _pickgroupToSelect(store, action, group);
          if (group != null) {
            store.dispatch(Selectgroup(
                previousgroupId: null,
                group: group,
                groupId: action.groupId,
                userId: store.state.user.uid));
          }
        }
      }
    });
  };
}

group _pickgroupToSelect(
    Store<AppState> store, Loadgroup action, List<group> group) {
  // group to select automatically
  group group;

  // Select the previously selected group (if still exists)
  final groupId =
      store.state.uiState.groupUiState[action.groupId]?.lastSelectedgroup;
  if (groupId != null) {
    group = group.firstWhere((c) => c.id == groupId, orElse: null);
  }

  // If no previously selected group for a group
  if (group == null) {
    // Select a default OPEN group if there are group available
    group = _defaultgroup(group);
  }
  return group;
}

group _defaultgroup(List<group> group) =>
    group.firstWhere((c) => c.visibility == groupVisibility.OPEN);

bool _isgroupInList(List<group> group, group group) {
  if (group == null) {
    return false;
  }
  return group.any((c) => c.id == group?.id);
}

void Function(
  Store<AppState> store,
  CreateChannel action,
  NextDispatcher next,
) _creategroup(
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
          store.dispatch(OnChannelCreated(data));
          store.dispatch(SystemMessageDispatch(action.invitedIds.toList()));
        });
      });

     

      // Select the newly created group.
      // Adding delay to allow backend to add invited members
      Future.delayed(const Duration(milliseconds: 1000), () {
        store.dispatch(Selectgroup(
          previousgroupId: store.state.grouptate.selectedgroup,
          group: createdgroup,
          groupId: store.state.selectedGroupId,
          userId: store.state.user.uid,
        ));
      });

      action.completer.complete();
    } catch (error) {
      Logger.e("Failed create group", e: error, s: StackTrace.current);
      action.completer.completeError(error);
    }
  };
}

void Function(
  Store<AppState> store,
  EditgroupAction action,
  NextDispatcher next,
) _editgroup(
  groupRepository groupRepository,
  GlobalKey<NavigatorState> navigatorKey,
) {
  return (store, action, next) async {
    next(action);

    try {
      await groupRepository.updategroup(
        store.state.selectedGroupId,
        action.group,
      );
      store.dispatch(
          OnUpdatedgroupAction(store.state.selectedGroupId, action.group));
      action.completer.complete();
    } catch (error) {
      action.completer.completeError(error);
    }
  };
}





void Function(
  Store<AppState> store,
  InviteToChannelAction action,
  NextDispatcher next,
) _inviteTogroup(
  GroupRepository groupRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await groupRepository.inviteToChannel(
          groupId: store.state.selectedGroup.id,
          group: store.state.selectedGroup,
          members: action.members,
          invitingUsername: store.state.user.name,
          groupName: store.state.selectedGroup.name).then(store.dispatch(SystemMessageDispatch(action.members)));

    } catch (error) {
     print(error);
    }
  };
}
