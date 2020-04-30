import "package:built_collection/built_collection.dart";
import "package:built_value/built_value.dart";


// ignore: prefer_double_quotes
part 'channel.g.dart';

abstract class Channel implements Built<Channel, ChannelBuilder> {
  @nullable
  String get id;

  String get authorId;

  String get name;
  @nullable
  String get backgroudImg;

  @nullable
  String get description;

  ChannelVisibility get visibility;

  String get hexColor;
  @nullable
  List<String> get tags;

  @nullable
  bool get marked;
  @nullable
  bool get received;


  @nullable
  DateTime get startDate;



  Channel._();

  factory Channel([void Function(ChannelBuilder) updates]) = _$Channel;
}

enum ChannelVisibility { OPEN, CLOSED }

class ChannelVisibilityHelper {
  static String stringOf(ChannelVisibility visibility) {
    switch (visibility) {
      case ChannelVisibility.OPEN:
        return "OPEN";
      case ChannelVisibility.CLOSED:
        return "CLOSED";
    }
    return null;
  }
  static ChannelVisibility valueOf(String string) {
    switch (string) {
      case "OPEN":
        return ChannelVisibility.OPEN;
      case "CLOSED":
        return ChannelVisibility.CLOSED;
    }
    return null;
  }
}