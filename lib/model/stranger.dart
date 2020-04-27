

import "package:built_collection/built_collection.dart";
import "package:built_value/built_value.dart";
import 'package:learnflutter/model/user.dart';

// ignore: prefer_double_quotes
part 'stranger.g.dart';

abstract class Stranger implements Built<Stranger, StrangerBuilder> {


  String get uid;

  String get  name;

  @nullable
  String get  imgUrl;

  String get description;

  int get gender;
  @nullable
  String get address;

  @nullable
  DateTime get birthday;

  @nullable
  String RequestInfo;


  Stranger._();

  factory Stranger([void Function(StrangerBuilder) updates]) = _$Stranger;
}