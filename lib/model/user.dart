import 'package:built_value/built_value.dart';

part 'user.g.dart';
abstract class User implements Built<User,UserBuilder> {
   String get uid;
   String get  name;
   String get  imgUrl;
   DateTime get lastOnline;
   String get description;
   int get gender;
   String get address;
   String get status;
   DateTime get birthday;

  User._();

  factory User([Updates(UserBuilder b)])=_$User;
}