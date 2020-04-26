


import 'package:built_value/built_value.dart';

part 'recommendInvitation.g.dart';
abstract class RecoInvi implements Built<RecoInvi, RecoInviBuilder> {

  String get imgUrl;

  String get name;

  String get targetId;






  RecoInvi._();

  factory RecoInvi([void Function(RecoInviBuilder) updates]) = _$RecoInvi;
}