import 'package:learnflutter/model/userModel.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unRead;

  Message(this.sender, this.time, this.text, this.isLiked, this.unRead);


}
final User currentUser= User(0, "Current", 'assets/female1.jpg',DateTime.now());
final User james= User(1, "james", 'assets/female2.jpg',DateTime.now());
final User kevin= User(2, "kevin", 'assets/male1.jpg',DateTime.now());
final User nacho= User(3, "nacho", 'assets/male2.jpg',DateTime.now());
final User mila= User(4, "mila", 'assets/male3.jpg',DateTime.now());
final User henry= User(5, "henry", 'assets/male4.jpg',DateTime.now());

List<User> favoriteList=[james,kevin,nacho,mila,henry,currentUser];

List<User> onlineUsers=[james,kevin,nacho,mila,henry];
List<Message> messageList=[
  Message(james,"2020-03-22T22:14:46.290Z","It is very good",false,false),
  Message(james,"2020-03-22T22:04:46.290Z","It is very good",true,false),
  Message(james,"2020-03-22T18:09:46.290Z","It is very good",false,false),
  Message(james,"2020-03-22T19:12:46.290Z","It is very good",false,true),
  Message(james,"2020-03-22T19:22:46.290Z","It is very good",false,true),
  Message(james,"2020-03-22T19:48:46.290Z","It is very good",false,true),

];

List<Message> messageListDemo=[
  Message(james,"2020-03-22T22:14:46.290Z","It is very good",false,false),
  Message(currentUser,"2020-03-22T22:04:46.290Z","It not very good",true,false),
  Message(james,"2020-03-22T18:09:46.290Z","It is very good",false,false),
  Message(currentUser,"2020-03-22T19:12:46.290Z","It is very good",false,true),
  Message(james,"2020-03-22T19:22:46.290Z","It is very good",true,true),
  Message(james,"2020-03-22T19:48:46.290Z","It is very good",false,true),

];
