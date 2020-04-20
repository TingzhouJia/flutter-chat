import 'package:learnflutter/model/channel.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/model/user.dart';

class ConnectToDataSource{}
//get favorList
class GetFavor{
  final List<User> favors;

  GetFavor(this.favors);

}
class GetFriend{
  final List<User> friends;
  GetFriend(this.friends);
}

class GetRecentChat{
 final List<recentMessage> recentChats;

  GetRecentChat(this.recentChats);

}
class SetShownMessageOnScreen{
  final int length;

  SetShownMessageOnScreen(this.length);

}

class GetGroup{
   final List<Channel> channels;

   GetGroup(this.channels);

}
class Getall{
  final List<Message> messages;

  Getall(this.messages);

}
class StartLoading{}

class EndLoading{}

