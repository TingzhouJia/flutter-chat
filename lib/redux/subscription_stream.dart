
import 'dart:async';

import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/model/user.dart';

StreamSubscription<User> userUpdateSubscription;
StreamSubscription<List<Message>> messagesSubscription;
StreamSubscription<List<recentMessage>> recentMessagesSubscription;
cancelAllSubscriptions() {
  userUpdateSubscription?.cancel();
//  groupsSubscription?.cancel();
//  groupUsersSubscription?.cancel();
//  listOfChannelsSubscription?.cancel();
//  selectedChannelSubscription?.cancel();
  messagesSubscription?.cancel();
  recentMessagesSubscription?.cancel();
}