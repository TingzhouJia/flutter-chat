
import 'dart:async';

import 'package:learnflutter/model/user.dart';

StreamSubscription<User> userUpdateSubscription;

cancelAllSubscriptions() {
  userUpdateSubscription?.cancel();
//  groupsSubscription?.cancel();
//  groupUsersSubscription?.cancel();
//  listOfChannelsSubscription?.cancel();
//  selectedChannelSubscription?.cancel();
//  messagesSubscription?.cancel();
}