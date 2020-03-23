import 'package:learnflutter/model/userModel.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unRead;

  Message(this.sender, this.time, this.text, this.isLiked, this.unRead);


}
final User currentUser= User(0, "Current", 'assets/female1.jpg');
final User james= User(0, "james", 'assets/female2.jpg');
final User kevin= User(0, "kevin", 'assets/male1.jpg');
final User nacho= User(0, "nacho", 'assets/male2.jpg');
final User mila= User(0, "mila", 'assets/male3.jpg');
final User henry= User(0, "henry", 'assets/male4.jpg');

List<User> favoriteList=[james,kevin,nacho,mila,henry,currentUser];
List<Message> messageList=[
  Message(james,"2020-03-22T22:14:46.290Z","It is very good",false,false),
  Message(james,"2020-03-22T22:04:46.290Z","It is very good",true,false),
  Message(james,"2020-03-22T18:09:46.290Z","It is very good",false,false),
  Message(james,"2020-03-22T19:12:46.290Z","It is very good",false,true),
  Message(james,"2020-03-22T19:22:46.290Z","It is very good",false,true),
  Message(james,"2020-03-22T19:48:46.290Z","It is very good",false,true),

];

