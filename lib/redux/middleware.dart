
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnflutter/model/channel.dart';
import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/action.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/service/friendService.dart';
import 'package:learnflutter/service/groupService.dart';
import 'package:learnflutter/service/messageService.dart';
import 'package:learnflutter/service/userInfoService.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreMiddleware(
    FriendRepository friendRepository,MessageRepository messageRepository,GroupRepository groupRepository
    ) {
  return [
    TypedMiddleware<AppState, ConnectToDataSource>(_loadData(friendRepository,messageRepository,groupRepository)),
  ];
}



void Function(
    Store<AppState> store,
    ConnectToDataSource action,
    NextDispatcher next,
    ) _loadData(
    FriendRepository friendRepository,
    MessageRepository messageRepository,
    GroupRepository groupRepository
    ) {
  return (store, action, next) {
    next(action);
    try {
    friendRepository.getFavoriteStream(store.state.user.uid).listen((List<User> data){
      store.dispatch(GetFavor(data));
    });
    messageRepository.RecentChatStream(store.state.user.uid).listen((List<recentMessage>data)=>store.dispatch(GetRecentChat(data)));

    groupRepository.getGroupsStream(store.state.user.uid).listen((List<Channel> data){


          store.dispatch(GetGroup(data));
    });



//      groupsSubscription =
//          groupRepository.getGroupStream(store.state.user.uid).listen((group) {
//            store.dispatch(OnGroupsLoaded(group));
//
//            if (store.state.selectedGroupId == null && group.isNotEmpty) {
//              store.dispatch(SelectGroup(group.first.id));
//            }
//          });

    } catch (e) {
      print("failed");
    }
  };
}