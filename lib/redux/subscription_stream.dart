
import 'dart:async';

import 'package:learnflutter/model/channel.dart';
import 'package:learnflutter/model/group.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/model/user.dart';

StreamSubscription<User> userUpdateSubscription;
StreamSubscription<List<Message>> messagesSubscription;
StreamSubscription<List<recentMessage>> recentMessagesSubscription;
StreamSubscription<List<Channel>> channelSubscription;
StreamSubscription<Group> selectedGroupSubscription;
cancelAllSubscriptions() {
  userUpdateSubscription?.cancel();
//  groupsSubscription?.cancel();
//  groupUsersSubscription?.cancel();
//  listOfChannelsSubscription?.cancel();
  selectedGroupSubscription?.cancel();
  channelSubscription?.cancel();
  messagesSubscription?.cancel();
  recentMessagesSubscription?.cancel();
}