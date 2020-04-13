import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';

import '../state.dart';
import 'message_action.dart';

final messageReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, UpdateAllMessages>(_onMessageUpdated),

];

AppState _onMessageUpdated(AppState state, UpdateAllMessages action) {
  return state.rebuild((a) => a..currentChat = ListBuilder(action.data));
}