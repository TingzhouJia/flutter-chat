import 'package:flutter/cupertino.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/model/user.dart';

@immutable
class SendMessage {
  final String message;


  final MessageType messageType;
  const SendMessage(
      this.message,
      this.messageType
      );

  @override
  String toString() {
    return "SendMessage{message: $message}";
  }
}
@immutable
class SendGroupMessage {
  final String message;
  final MessageType type;
  const SendGroupMessage(
      this.message,
      this.type
      );
}

class SystemMessageDispatch{
  List<String> userList;

  SystemMessageDispatch(this.userList);

}

class GroupApply{

}

class SelectGroupChat{
  String groupId;
  SelectGroupChat(this.groupId);

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
class UpdateAllGroupChat{
  final List<Message> data;

  UpdateAllGroupChat(this.data);

}

class DeleteRecentChat{
  final String uid;

  DeleteRecentChat(this.uid);

}
class OnDeleteRecentChat{
  final String uid;

  OnDeleteRecentChat(this.uid);
}
class SetUnread{
  final String uid;
  final bool pending;
  SetUnread(this.uid,this.pending);

}
class OnSetUnread{
  final String uid;
  final bool pending;
  OnSetUnread(this.uid,this.pending);

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