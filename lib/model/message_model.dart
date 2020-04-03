import 'package:learnflutter/model/user.dart';


class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unRead;

  Message(this.sender, this.time, this.text, this.isLiked, this.unRead);


}
final  currentUser= User((b)=>b ..uid='0' ..name="Current" ..imgUrl='assets/female1.jpg' ..lastOnline=DateTime.now() ..description='goof' ..gender=1 ..address="aaa" ..status="aaa");
final  james= User((b)=>b ..uid='1' ..name="james" ..imgUrl='assets/female2.jpg' ..lastOnline=DateTime.now() ..description='goof' ..gender=1 ..address="aaa" ..status="aaa");
final  kevin= User((b)=>b ..uid='2' ..name="kevin" ..imgUrl='assets/female1.jpg' ..lastOnline=DateTime.now() ..description='goof' ..gender=1 ..address="aaa" ..status="aaa");
final  nacho= User((b)=>b ..uid='3' ..name="nacho" ..imgUrl='assets/male1.jpg' ..lastOnline=DateTime.now() ..description='goof' ..gender=1 ..address="aaa" ..status="aaa");
final  mila= User((b)=>b ..uid='4' ..name="mila" ..imgUrl='assets/male3.jpgg' ..lastOnline=DateTime.now() ..description='goof' ..gender=1 ..address="aaa" ..status="aaa");
final  henry= User((b)=>b ..uid='5' ..name="henry" ..imgUrl='assets/male4.jpg' ..lastOnline=DateTime.now() ..description='goof' ..gender=1 ..address="aaa" ..status="aaa");


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
