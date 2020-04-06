
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnflutter/model/user.dart';
import 'package:learnflutter/redux/action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/service/friendService.dart';
import 'package:learnflutter/service/userInfoService.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreMiddleware(
    FriendRepository friendRepository,
    ) {
  return [
    TypedMiddleware<AppState, ConnectToDataSource>(_loadData(friendRepository)),
  ];
}



void Function(
    Store<AppState> store,
    ConnectToDataSource action,
    NextDispatcher next,
    ) _loadData(
    FriendRepository friendRepository,
    ) {
  return (store, action, next) {
    next(action);
    print('kkkkk');
    try {
    friendRepository.getFavoriteStream(store.state.user.uid).listen((List<User> data){
        store.dispatch(GET(data));
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