import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:learnflutter/model/group.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/reaction.dart';
import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/model/user.dart';
import 'package:path/path.dart' as Path;
import 'firestoreService.dart';

class MessageRepository {
  static const BODY = "body";
  static const AUTHOR = "authorId";
  static const REACTION = "reactions";
  static const TYPE = "messageType";
  static const TIMESTAMP = "timestamp";
  static const EMOJI = "emoji";
  static const ID = "id";
  static const MESSAGEID = "messageId";
  static const USER_ID = "userId";
  static const PENDING = "pending";
  static const MEDIA = "media";
  static const USERNAME = "userName";
  static const MEDIA_STATUS = "mediaStatus";
  static const IMG="userImage";
  final firebaseStorage=FirebaseStorage.instance;
  final Firestore _firestore;
  DocumentSnapshot start;
  MessageRepository(this._firestore);

  Future<Message> sendMessage(User sender, String receiver, Message message,) async {
      if(message.messageType==MessageType.USER){
        List<String> mediaList;
        message.media.map((item)async{
          StorageReference result=await getPath(File(item));
          result.getDownloadURL().then((url){
            mediaList.add(url);
          });
        });
        message.rebuild((a)=>a ..media=BuiltList(mediaList));
      }
      //people receive it
      final data1 = toMap(message,true);
      final data2=toMap(message, false);
      final reference = await _firestore.collection(FirestorePaths.PATH_MESSAGES).document(sender.uid).collection(receiver).add(data1);
      await _firestore.collection(FirestorePaths.PATH_MESSAGES).document(receiver).collection(sender.uid).add(data2);
      //update recent chat
      final recentpath=_firestore.collection(FirestorePaths.Path_RECENT).document(sender.uid).collection("info").document(receiver);
      final path2=_firestore.collection(FirestorePaths.Path_RECENT).document(receiver).collection("info").document(sender.uid);
      final targte= await recentpath.get();
      final target2=await path2.get();
      if(targte.data==null||targte.data.length == 0){
        await recentpath.setData(toRecetMap(message,sender,true,receiver));
      }else{
        await recentpath.updateData({BODY:message.body,TIMESTAMP:message.timestamp,PENDING:false});
      }
      if(target2.data==null||target2.data.length==0){
        await path2.setData(toRecetMap(message, sender,false,receiver));
      }else{
        await path2.updateData({BODY:message.body,TIMESTAMP:message.timestamp,PENDING:true});
      }
      final doc = await reference.get();
      return fromDoc(doc);
      
  }
  Future<StorageReference> getPath(File paths) async{
    StorageReference storageReference=firebaseStorage.ref().child('avatar/${Path.basename(paths.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(paths);
    await uploadTask.onComplete;
    return storageReference;
  }



  Future<void> sendGroupMessage(String sender,Message message,Group group) async{
      final data=toMap(message, true);
     String docuId= await _firestore.collection(FirestorePaths.groupMessagePath(group.id)).add(data).then((data){
        return data.documentID;
      });
     final target=  _firestore.collection(FirestorePaths.Path_RECENT).document(sender).collection('info').document(docuId);
     final test=await target.get();
     if(test.data==null||test.data.length==0){
       await target.setData(toRecetGroupMap(message, group, true, group.id));
     }else{
       await target.updateData({BODY:message,TIMESTAMP:message.timestamp,PENDING:true});
     }
  }



  Stream<List<Message>> getMessagesStream(String userId,
      String targetId,
      ) {
    final content= _firestore
        .collection(FirestorePaths.PATH_MESSAGES).document(userId).collection(targetId)
        .orderBy(TIMESTAMP, descending: true)
        .limit(15);
    content.getDocuments().then((v){
      if(v.documents.length>0){
        start=v.documents[v.documents.length-1];
      }

    });
    return content
        .snapshots(includeMetadataChanges: true)
        .map((querySnapshot) {
      return querySnapshot.documents
          .map((documentSnapshot) {
        return fromDoc(documentSnapshot);
      }).toList();
    });
  }

  Stream<List<Message>> loadMoreMessagesStream(String userId,String targetId){
      final next=_firestore
          .collection(FirestorePaths.PATH_MESSAGES).document(userId).collection(targetId)
          .orderBy(TIMESTAMP, descending: true).startAfterDocument(start)
          .limit(15);
      next.getDocuments().then((v){
        start=v.documents[v.documents.length-1];});
      return next
          .snapshots(includeMetadataChanges: true)
          .map((querySnapshot) {
        return querySnapshot.documents
            .map((documentSnapshot) {
          return fromDoc(documentSnapshot);
        }).toList();
      });

  }

  Stream<List<Message>> getGroupMessagesStream(String groupId,

      ) {
    return _firestore
        .collection(FirestorePaths.PATH_MESSAGES).document('group').collection(groupId)
        .orderBy(TIMESTAMP, descending: true)
        .snapshots(includeMetadataChanges: true)
        .map((querySnapshot) {
      return querySnapshot.documents
//          .where((documentSnapshot) =>
////          isValidDocument(documentSnapshot, userId))
          .map((documentSnapshot) {

        return fromDoc(documentSnapshot);
      }).toList();
    });
  }
  Stream<List<recentMessage>> RecentChatStream(String userId){

   return  _firestore.collection(FirestorePaths.Path_RECENT).document(userId).collection('info').snapshots().map((querySnapshot){
      return querySnapshot.documents.map((document)=>recentFromDoc(document)).toList();
    });
  }

  Future<void> RemoveRecentChat(String uid,String targetId) async{
      return  await _firestore.collection(FirestorePaths.Path_RECENT).document(uid).collection('info').document(targetId).delete();
  }
  Future<void> SetUnRead(String uid,String targetId,bool pending) async{
      return await _firestore.collection(FirestorePaths.Path_RECENT).document(uid).collection('info').document(targetId).updateData({PENDING:!pending});
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
    final reactions = message.reactions.toBuilder();
    reactions[reaction.userId] = reaction;
    await _firestore.document(path).updateData({
      REACTION: _reactionsToMap(reactions.build()),
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
    return Message((m) => m
      ..id = document.documentID
      ..body = document[BODY]
      ..authorId = messageType == MessageType.SYSTEM ? null : document[AUTHOR]
      ..reactions = _parseReactions(document)
      ..messageType = messageType
      ..media = ListBuilder<String>(document[MEDIA] ?? []).build()
      ..mediaStatus = MediaStatusHelper.valueOf(document[MEDIA_STATUS])
//DateTime.fromMillisecondsSinceEpoch(
//          int.tryParse(document[TIMESTAMP]) ?? 0)
      ..timestamp = DateTime.parse(document[TIMESTAMP].toDate().toString())
      ..pending = document.metadata.hasPendingWrites);
  }

  static recentMessage recentFromDoc(DocumentSnapshot document){
    if(document.documentID=='system'){
      return recentMessage((m)=>m

            ..imgUrl=''
            ..pending=true
            ..body="Welcome to Light Chat"
            ..timestamp=DateTime.now()
            ..userName='LightChat assistant'
            ..messageType=MessageType.SYSTEM
      );
    }
    final messageType = MessageTypeHelper.valueOf(document[TYPE]);
    return recentMessage(
        (m)=>m
        ..id=document[ID]
        ..authorId=document[USER_ID]
        ..imgUrl=document[IMG]
          ..pending=document[PENDING]
            ..body=messageType==MessageType.MEDIA?"[Photo/Video]":document[BODY]
            ..timestamp=DateTime.parse(document[TIMESTAMP].toDate().toString())
            ..userName=document[USERNAME]
            ..messageType=messageType
    );
  }

  static MapBuilder<String, Reaction> _parseReactions(
      DocumentSnapshot document) {
    final map = MapBuilder<String, Reaction>();
    if (document[REACTION] == null) {
      return map;
    }
    for (final key in document[REACTION].keys) {
      final value = document[REACTION][key];
      try {
        map[key] = _parseReaction(value);
      } catch (e) {
        // Ignore reactions in old format
      }
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
      BuiltMap<String, Reaction> reactions) {
    return reactions
        .map((k, v) =>
        MapEntry(k, {
          EMOJI: v.emoji,
          USER_ID: v.userId,
          MESSAGEID:v.messageId
        }))
        .toMap();
  }

  static toMap(Message message,bool send) {
    return {
      BODY: message.body,
      AUTHOR: message.authorId,
      REACTION: _reactionsToMap(message.reactions),
      TYPE: MessageTypeHelper.stringOf(message.messageType),
      TIMESTAMP: DateTime.now(),
      MEDIA:message.media.toList(),
      PENDING:!send,
      MEDIA_STATUS:MediaStatusHelper.stringOf(message.mediaStatus)
    };
  }
  static  toRecetMap(Message message,User user,bool send,String targetID){
      return {
          BODY:message.body,
          USER_ID:message.authorId,
          PENDING:!send,
          TYPE:message.messageType,
        USERNAME:user.name,
        IMG:user.imgUrl,
        ID:targetID
      };
  }
  static  toRecetGroupMap(Message message,Group group,bool send,String targetID){
    return {
      BODY:message.body,
      USER_ID:message.authorId,
      PENDING:send==true?false:true,
      TYPE:message.messageType,
      USERNAME:group.name,
      IMG:group.hexColor,
      ID:targetID
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