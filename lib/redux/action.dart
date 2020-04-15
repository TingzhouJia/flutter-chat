import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/model/user.dart';

class ConnectToDataSource{}
//get favorList
class GetFavor{
  List<User> favors;

  GetFavor(this.favors);

}
class GetFriend{
  List<User> friends;
  GetFriend(this.friends);
}

class GetRecentChat{
  List<recentMessage> recentChats;

  GetRecentChat(this.recentChats);

}
class StartLoading{}

class EndLoading{}

