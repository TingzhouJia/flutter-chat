import 'package:built_value/built_value.dart';

part 'user.g.dart';
abstract class User implements Built<User,UserBuilder> {
   String get uid;
   String get  name;
   @nullable
   String get  imgUrl;
   @nullable
   DateTime get lastOnline;
   String get description;
   int get gender;
   @nullable
   String get address;
   @nullable
   String get status;
   @nullable
   DateTime get birthday;

  User._();

  factory User([Updates(UserBuilder b)])=_$User;
}