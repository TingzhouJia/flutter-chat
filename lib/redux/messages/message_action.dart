import 'package:flutter/cupertino.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/model/user.dart';

@immutable
class SendMessage {
  final String message;
  final User receiver;
  final MessageType mediaType;
  const SendMessage(
      this.message,
      this.receiver,
      this.mediaType
      );

  @override
  String toString() {
    return "SendMessage{message: $message}";
  }
}

@immutable
class UpdateAllMessages {
  final List<Message> data;

  const UpdateAllMessages(this.data);
}

class UpdateRecentChat{
  final recentMessage data;

  UpdateRecentChat(this.data);


}
class UpdateAllRecentChat{
  final List<recentMessage> data;

  UpdateAllRecentChat(this.data);

}

class DeleteRecentChat{
  final String uid;

  DeleteRecentChat(this.uid);

}
@immutable
class DeleteMessage {
  final String messageId;
  final String receiverId;
  const DeleteMessage(this.messageId,this.receiverId);
}

@immutable
class EmojiReaction {
  final String emoji;
  final String messageId;
  final String receiverId;
  const EmojiReaction(this.messageId, this.emoji,this.receiverId);
}

@immutable
class RemoveEmojiReaction {
  final String messageId;
  final String receiverId;
  const RemoveEmojiReaction(this.messageId,this.receiverId);
}