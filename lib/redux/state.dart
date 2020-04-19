
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:learnflutter/model/channel.dart';
import 'package:learnflutter/model/group.dart';
import 'package:learnflutter/model/message.dart';
import 'package:learnflutter/model/recentMessage.dart';
import 'package:learnflutter/model/user.dart';


part 'state.g.dart';

 abstract class AppState implements Built<AppState,AppStateBuilder>{
    @nullable
    User get  user;
    @nullable
    BuiltList<User> get Friends;
    @nullable
    BuiltList<User> get FavorList;
    @nullable
    BuiltList<recentMessage> get recentChatList;
    @nullable
    User get currentTarget;
    @nullable
    BuiltList<Message> get currentChat;
    @nullable
    BuiltList<Channel> get groupList;
    @nullable
    Group get selectedGroup;
    @nullable
    BuiltList<Message> get selectedGroupChat;
    @nullable
    BuiltList<Message> get SystemMessageList;
    bool get loading;
    AppState._();
    factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

    factory AppState.init()=>AppState((a)=>a
      ..FavorList=ListBuilder()
        ..Friends=ListBuilder()
      ..recentChatList=ListBuilder()
      ..loading=false
    );
    AppState clear() {
      // keep the temporal fcm token even when clearing state
      // so it can be set again on login.
      //
      // Add here anything else that also needs to be carried over.
      return AppState.init().rebuild((s) => s);
    }
}