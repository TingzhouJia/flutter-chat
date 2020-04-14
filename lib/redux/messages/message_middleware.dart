

import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/reaction.dart';
import 'package:learnflutter/redux/channel/channel_action.dart';
import 'package:learnflutter/service/messageService.dart';
import 'package:redux/redux.dart';

import '../state.dart';
import '../subscription_stream.dart';
import 'message_action.dart';

List<Middleware<AppState>> createMessagesMiddleware(
    MessageRepository messagesRepository,
    ) {
  return [
    TypedMiddleware<AppState, SendMessage>(_sendMessage(messagesRepository)),
    TypedMiddleware<AppState, DeleteMessage>(
        _deleteMessage(messagesRepository)),
    TypedMiddleware<AppState, SelectChat>(
        _listenMessages(messagesRepository)),

    TypedMiddleware<AppState, EmojiReaction>(
        _reactWithEmoji(messagesRepository)),
    TypedMiddleware<AppState, RemoveEmojiReaction>(
        _removeReaction(messagesRepository)),
  ];
}

void Function(
    Store<AppState> store,
    SendMessage action,
    NextDispatcher next,
    ) _sendMessage(
    MessageRepository messageRepository,
    ) {
  return (store, action, next) async {
    next(action);
    final sender = store.state.user;
    final receiver = action.receiver;
    final message = Message((m) => m
      ..body = action.message
      ..timestamp=DateTime.now()
      ..messageType=action.mediaType
      ..authorId = store.state.user.uid);
    try {
      await messageRepository.sendMessage(sender, receiver, message).then((a){
        store.dispatch(UpdateRecentChat);
      });
    } catch (e) {
      print(e);
    }
  };
}

void Function(
    Store<AppState> store,
    DeleteMessage action,
    NextDispatcher next,
    ) _deleteMessage(
    MessageRepository messageRepository,
    ) {
  return (store, action, next) async {
    next(action);
    final senderId = store.state.user.uid;
    final receiveId=action.receiverId;
    try {
      await messageRepository.deleteMessage(senderId, receiveId, action.messageId);
    } catch (e) {
      print(e);
    }
  };
}

void Function(
    Store<AppState> store,
    SelectChat action,
    NextDispatcher next,
    ) _listenMessages(
    MessageRepository messageRepository,
    ) {
  return (store, action, next) {
    next(action);
    try {
      // Do not update subscription if there's already a valid subscription to it.
      // This is necessary since we'll update the channel as well (e.g. when users join/leave etc).


      // cancel previous message subscription
      messagesSubscription?.cancel();

      final author = store.state.user.uid;
      final target = action.target.uid;


      // ignore: cancel_subscriptions
      messagesSubscription = messageRepository
          .getMessagesStream(
       author,target
      )
          .listen((data) {
        store.dispatch(UpdateAllMessages(data));
      });
    } catch (e) {
     print(e);
    }
  };
}

void Function(
    Store<AppState> store,
    EmojiReaction action,
    NextDispatcher next,
    ) _reactWithEmoji(
    MessageRepository messageRepository,
    ) {
  return (store, action, next) async {
    next(action);
    try {
      final authorId = store.state.user.uid;
      final target = action.receiverId;
      final messageId = action.messageId;
      final userId = store.state.user.uid;
      final emoji = action.emoji;
      final reaction = Reaction((r) => r
        ..userId = userId
        ..messageId=messageId
        ..emoji = emoji
       );
      await messageRepository.addReaction(
        senderId: authorId,
        receiverId: target,
        messageId: messageId,
        reaction: reaction,
      );
    } catch (e) {
      print(e);
    }
  };
}

void Function(
    Store<AppState> store,
    RemoveEmojiReaction action,
    NextDispatcher next,
    ) _removeReaction(
    MessageRepository messageRepository,
    ) {
  return (store, action, next) async {
    next(action);
    try {
      final authorId = store.state.user.uid;
      final receiveId = action.receiverId;
      final messageId = action.messageId;
      final userId = store.state.user.uid;
      await messageRepository.removeReaction(
        senderId: authorId,
        receiverId: receiveId,
        messageId: messageId,
        userId: userId,
      );
    } catch (e) {
      print(e);
    }
  };
}