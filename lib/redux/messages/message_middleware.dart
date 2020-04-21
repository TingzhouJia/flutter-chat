

import 'package:built_collection/built_collection.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/reaction.dart';
import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/redux/action.dart';
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
    TypedMiddleware<AppState, DeleteRecentChat>(
        _deleteRecentChat(messagesRepository)),
    TypedMiddleware<AppState, SetUnread>(
        _setUnread(messagesRepository)),
    TypedMiddleware<AppState, SelectCurrentChat>(
        _listenMessages(messagesRepository)),
    TypedMiddleware<AppState, LoadMoreMessage>(
        _loadMoreMessages(messagesRepository)),
    TypedMiddleware<AppState, SelectGroupChat>(
        _selectGroupChat(messagesRepository)),
    TypedMiddleware<AppState, SystemMessageDispatch>(
        _groupDispatch(messagesRepository)),
    TypedMiddleware<AppState, SendGroupMessage>(
        _sendGroupMessages(messagesRepository)),
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
    final message = Message((m) => m
      ..body = action.message
      ..timestamp=DateTime.now()
      ..messageType=action.messageType
      ..reactions=MapBuilder()
      ..media=BuiltList(action.mediaList)
      ..authorId = store.state.user.uid);
    try {

        await messageRepository.sendMessage(sender, store.state.currentTarget.uid, message).then((Message content){
          print(content);
            store.dispatch(OnSendMessage(content));
            store.dispatch(UpdateRecentChat(MessageRepository.toRecetMap(content, store.state.user, true, store.state.currentTarget.uid)));
        });


    } catch (e) {
      print(e);
    }
  };
}
void Function(
    Store<AppState> store,
    SystemMessageDispatch action,
    NextDispatcher next,
    ) _groupDispatch(
    MessageRepository messageRepository,
    ) {
  return (store, action, next) async {
    next(action);


      action.userList.map((each) async{
        final message = Message((m) => m
          ..body = 'You are invited to Join group ${store.state.selectedGroup.name}'
          ..timestamp=DateTime.now()
          ..messageType=MessageType.SYSTEM
          ..authorId = 'SYSTEM');
        try {
          await messageRepository.sendGroupMessage(each, message, store.state.selectedGroup);
        } catch (e) {
          print(e);
        }
      });


  };
}
void Function(
    Store<AppState> store,
    SendGroupMessage action,
    NextDispatcher next,
    ) _sendGroupMessages(
    MessageRepository messageRepository,
    ) {
  return (store, action, next) async {
    next(action);
    final sender = store.state.user;
    final message = Message((m) => m
      ..body = action.message
      ..timestamp=DateTime.now()
      ..messageType=action.type
      ..authorId = store.state.user.uid);
    try {
      await messageRepository.sendGroupMessage(sender.uid, message, store.state.selectedGroup);
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
    DeleteRecentChat action,
    NextDispatcher next,
    ) _deleteRecentChat(
    MessageRepository messageRepository,
    ) {
  return (store, action, next) async {
    next(action);
    final senderId = store.state.user.uid;
    final receiveId=action.uid;
    try {
      await messageRepository.RemoveRecentChat(senderId, receiveId).then((_)=>store.dispatch(OnDeleteRecentChat(receiveId)));
    } catch (e) {
      print(e);
    }
  };
}
void Function(
    Store<AppState> store,
    SetUnread action,
    NextDispatcher next,
    ) _setUnread(
    MessageRepository messageRepository,
    ) {
  return (store, action, next) async {
    next(action);
    final senderId = store.state.user.uid;
    final receiveId=action.uid;
    try {
      await messageRepository.SetUnRead(senderId, receiveId,action.pending).then((_)=>store.dispatch(OnSetUnread(receiveId,action.pending)));

    } catch (e) {
      print(e);
    }
  };
}

void Function(
    Store<AppState> store,
    SelectCurrentChat action,
    NextDispatcher next,
    ) _listenMessages(
    MessageRepository messageRepository,
    )   {
  return (store, action, next){
    next(action);
    try {
      store.dispatch(StartLoading());
      messagesSubscription?.cancel();
      final author = store.state.user.uid;
      final target = action.id;
      // ignore: cancel_subscriptions
     messageRepository
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
    LoadMoreMessage action,
    NextDispatcher next,
    ) _loadMoreMessages(
    MessageRepository messageRepository,
    )   {
  return (store, action, next){
    next(action);
    try {
      store.dispatch(StartLoading());

      messagesSubscription?.cancel();

      final author = store.state.user.uid;
      final target = store.state.currentTarget.uid;
      // ignore: cancel_subscriptions
      messageRepository
          .getMessagesStream(
          author,target
      )
          .listen((data) {
        store.dispatch(UpdateMoreMessage(data));
      });
    } catch (e) {
      print(e);
    }
  };
}
void Function(
    Store<AppState> store,
    SelectGroupChat action,
    NextDispatcher next,
    ) _selectGroupChat(
    MessageRepository messageRepository,
    ) {
  return (store, action, next) {
    next(action);
    try {
      store.dispatch(StartLoading());
      // Do not update subscription if there's already a valid subscription to it.
      // This is necessary since we'll update the channel as well (e.g. when users join/leave etc).

      // cancel previous message subscription
      messagesSubscription?.cancel();

      messageRepository
          .getGroupMessagesStream(
            action.groupId
      ).listen((data) {
        store.dispatch(UpdateAllGroupChat(data));
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