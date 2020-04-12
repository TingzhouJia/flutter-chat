import 'package:built_value/built_value.dart';
import 'message.dart';

part 'recentMessage.g.dart';
abstract class recentMessage implements Built<recentMessage, recentMessageBuilder> {
  @nullable
  String get id;

  @nullable
  String get authorId;

  String get imgUrl;

  String get userName;

  String get body;



  MessageType get messageType;

  bool get pending;

  DateTime get timestamp;




  recentMessage._();

  factory recentMessage([void Function(recentMessageBuilder) updates]) = _$recentMessage;

//  Map<String, int> reactionsCount() {
//    if (reactions == null) {
//      return {};
//    }
//    final map = Map<String, int>();
//    for (final reaction in reactions.values) {
//      map[reaction.emoji] = (map[reaction.emoji] ?? 0) + 1;
//    }
//    return map;
//  }
}