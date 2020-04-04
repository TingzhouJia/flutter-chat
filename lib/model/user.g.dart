// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$User extends User {
  @override
  final String uid;
  @override
  final String name;
  @override
  final String imgUrl;
  @override
  final DateTime lastOnline;
  @override
  final String description;
  @override
  final int gender;
  @override
  final String address;
  @override
  final String status;
  @override
  final DateTime birthday;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.uid,
      this.name,
      this.imgUrl,
      this.lastOnline,
      this.description,
      this.gender,
      this.address,
      this.status,
      this.birthday})
      : super._() {
    if (uid == null) {
      throw new BuiltValueNullFieldError('User', 'uid');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('User', 'name');
    }
    if (imgUrl == null) {
      throw new BuiltValueNullFieldError('User', 'imgUrl');
    }
    if (lastOnline == null) {
      throw new BuiltValueNullFieldError('User', 'lastOnline');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('User', 'description');
    }
    if (gender == null) {
      throw new BuiltValueNullFieldError('User', 'gender');
    }
    if (status == null) {
      throw new BuiltValueNullFieldError('User', 'status');
    }
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        uid == other.uid &&
        name == other.name &&
        imgUrl == other.imgUrl &&
        lastOnline == other.lastOnline &&
        description == other.description &&
        gender == other.gender &&
        address == other.address &&
        status == other.status &&
        birthday == other.birthday;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, uid.hashCode), name.hashCode),
                                imgUrl.hashCode),
                            lastOnline.hashCode),
                        description.hashCode),
                    gender.hashCode),
                address.hashCode),
            status.hashCode),
        birthday.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('uid', uid)
          ..add('name', name)
          ..add('imgUrl', imgUrl)
          ..add('lastOnline', lastOnline)
          ..add('description', description)
          ..add('gender', gender)
          ..add('address', address)
          ..add('status', status)
          ..add('birthday', birthday))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _imgUrl;
  String get imgUrl => _$this._imgUrl;
  set imgUrl(String imgUrl) => _$this._imgUrl = imgUrl;

  DateTime _lastOnline;
  DateTime get lastOnline => _$this._lastOnline;
  set lastOnline(DateTime lastOnline) => _$this._lastOnline = lastOnline;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _gender;
  int get gender => _$this._gender;
  set gender(int gender) => _$this._gender = gender;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  DateTime _birthday;
  DateTime get birthday => _$this._birthday;
  set birthday(DateTime birthday) => _$this._birthday = birthday;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _name = _$v.name;
      _imgUrl = _$v.imgUrl;
      _lastOnline = _$v.lastOnline;
      _description = _$v.description;
      _gender = _$v.gender;
      _address = _$v.address;
      _status = _$v.status;
      _birthday = _$v.birthday;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    final _$result = _$v ??
        new _$User._(
            uid: uid,
            name: name,
            imgUrl: imgUrl,
            lastOnline: lastOnline,
            description: description,
            gender: gender,
            address: address,
            status: status,
            birthday: birthday);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
