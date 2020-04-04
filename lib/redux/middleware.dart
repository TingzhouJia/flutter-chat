
import 'package:learnflutter/redux/action.dart';
import 'package:learnflutter/redux/state.dart';
import 'package:learnflutter/service/userInfoService.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreMiddleware(
    UserRepository userRepository
    ) {
  return [
//    TypedMiddleware<AppState, ConnectToDataSource>(_loadData(userRepository)),
  ];
}



//void Function(
//    Store<AppState> store,
//    ConnectToDataSource action,
//    NextDispatcher next,
//    ) _loadData(
//    GroupRepository groupRepository,
//    ) {
//  return (store, action, next) {
//    next(action);
//
//    try {
//      groupsSubscription?.cancel();
//      groupsSubscription =
//          groupRepository.getGroupStream(store.state.user.uid).listen((group) {
//            store.dispatch(OnGroupsLoaded(group));
//
//            if (store.state.selectedGroupId == null && group.isNotEmpty) {
//              store.dispatch(SelectGroup(group.first.id));
//            }
//          });
//    } catch (e) {
//      Logger.e("Failed to subscribe to groups", e: e, s: StackTrace.current);
//    }
//  };
//}