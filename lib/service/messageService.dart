import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/reaction.dart';

import 'firestoreService.dart';

class MessageRepository {
  static const BODY = "body";
  static const AUTHOR = "author";
  static const REACTION = "reaction";
  static const TYPE = "type";
  static const TIMESTAMP = "timestamp";
  static const EMOJI = "emoji";
  static const MESSAGEID = "messageId";
  static const USER_ID = "user_id";
  static const USER_NAME = "user_name";
  static const MEDIA = "media";
  static const MEDIA_STATUS = "media_status";


  final Firestore _firestore;

  MessageRepository(this._firestore);

  Future<Message> sendMessage(String senderId,
      String receiverId,
      Message message,) async {
    final messagesPath = FirestorePaths.messagePath(senderId,receiverId); //people send it
    final getPath=FirestorePaths.messagePath(receiverId, senderId);
   //people receive it
    final data = toMap(message);
    await _firestore.collection(getPath).add(data);
    final reference = await _firestore.collection(messagesPath).add(data);

    final doc = await reference.get();
    return fromDoc(doc);
  }

  Stream<List<Message>> getMessagesStream(String userId,
      String targetId,
   ) {
    return _firestore
        .collection(FirestorePaths.messagePath(userId,targetId))
        .orderBy(TIMESTAMP, descending: true)
        .snapshots(includeMetadataChanges: true)
        .map((querySnapshot) {
      return querySnapshot.documents
          .where((documentSnapshot) =>
          isValidDocument(documentSnapshot, userId))
          .map((documentSnapshot) => fromDoc(documentSnapshot))
          .toList();
    });
  }

  Future<void> addReaction({
    @required String senderId,
    @required String receiverId,
    @required String messageId,
    @required Reaction reaction,
  }) async {
    final path = FirestorePaths.messageReactPath(senderId, receiverId, messageId);
    final snapshot = await _firestore.document(path).get();
    final message = fromDoc(snapshot);
    // Cannot add reactions to their own message
    if (message.authorId == reaction.userId) {
      return;
    }
//    final reactions = message.reactions.toBuilder();
//    reactions[reaction.userId] = reaction;
    await _firestore.document(path).updateData({
      REACTION: _reactionsToMap(reaction.toBuilder()),
    });
  }

  Future<void> removeReaction({
    @required String senderId,
    @required String receiverId,
    @required String messageId,
    @required String userId
  }) async {
    final path = FirestorePaths.messageReactPath(senderId, receiverId, messageId);
    final snapshot = await _firestore.document(path).get();
    final reaction = fromDoc(snapshot).reactions;
    final builder = reaction.toBuilder();
    builder.remove(userId);
    return await _firestore
        .document(path)
        .updateData({REACTION: _reactionsToMap(builder.build())});
  }

  Future<void> deleteMessage(String sender, String receiver, String messageId) async {
    final path = FirestorePaths.messageReactPath(sender, receiver, messageId);
    return await _firestore
        .document(path)
        .delete();
  }

  static Message fromDoc(DocumentSnapshot document) {
    final messageType = MessageTypeHelper.valueOf(document[TYPE]);

    return Message((m) =>
    m
      ..id = document.documentID
      ..body = document[BODY]
      ..authorId = messageType == MessageType.SYSTEM ? null : document[AUTHOR]
      ..reactions = _parseReactions(document)
      ..messageType = messageType
      ..media = ListBuilder(document[MEDIA] ?? [])
      ..mediaStatus = MediaStatusHelper.valueOf(document[MEDIA_STATUS])

      ..timestamp = DateTime.fromMillisecondsSinceEpoch(
          int.tryParse(document[TIMESTAMP]) ?? 0)
      ..pending = document.metadata.hasPendingWrites);
  }

  static MapBuilder<String, String> _parseReactions(
      DocumentSnapshot document) {
    final map = MapBuilder<String, String>();
    if (document[REACTION] == null) {
      return map;
    }


    return map;
  }

  static Reaction _parseReaction(data) {
    return Reaction((r) =>
    r
      ..emoji = data[EMOJI]
      ..userId = data[USER_ID]
      ..messageId = data[MESSAGEID]
    );
  }

  static Map<String, dynamic> _reactionsToMap(
     Reaction reactions) {
    var a= new Map<String,dynamic>();
    a.addAll({ EMOJI: reactions.emoji,
      USER_ID: reactions.userId,
      MESSAGEID:reactions.messageId});


  }

  static toMap(Message message) {
    return {
      BODY: message.body,
      AUTHOR: message.authorId,
      REACTION: _reactionsToMap(message.reactions),
      TYPE: MessageTypeHelper.stringOf(message.messageType),
      TIMESTAMP: message.timestamp.millisecondsSinceEpoch.toString(),
    };
  }

  static bool isValidDocument(DocumentSnapshot documentSnapshot, [String userId = ""]) {
    final docType = MessageTypeHelper.valueOf(documentSnapshot[TYPE]);
    switch (docType) {
      case MessageType.SYSTEM:
        return true;
        break;
      case MessageType.RSVP:
        return true;
        break;
      case MessageType.USER:
        return _hasValidAuthor(documentSnapshot);
        break;
      case MessageType.MEDIA:
        return _hasValidAuthor(documentSnapshot) && _isVisibleToUser(documentSnapshot, userId);
        break;
      default:
        return false;
        break;
    }
  }

  static bool _hasValidAuthor(DocumentSnapshot documentSnapshot) {
    return documentSnapshot[AUTHOR] != null &&
        // Legacy messages have a different author payload
        documentSnapshot[AUTHOR] is String;
  }

  static bool _isVisibleToUser(DocumentSnapshot documentSnapshot, String userId) {
    final mediaStatus = MediaStatusHelper.valueOf(documentSnapshot[MEDIA_STATUS]);
    final author = documentSnapshot[AUTHOR];
    switch (mediaStatus) {
      case MediaStatus.DONE:
        return true;
        break;
      case MediaStatus.UPLOADING:
      case MediaStatus.ERROR:
      default:
        return author == userId;
        break;
    }
  }

}