// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stranger.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Stranger extends Stranger {
  @override
  final String uid;
  @override
  final String name;
  @override
  final String imgUrl;
  @override
  final String description;
  @override
  final int gender;
  @override
  final String address;
  @override
  final DateTime birthday;
  @override
  final String status;
  @override
  final String RequestInfo;

  factory _$Stranger([void Function(StrangerBuilder) updates]) =>
      (new StrangerBuilder()..update(updates)).build();

  _$Stranger._(
      {this.uid,
      this.name,
      this.imgUrl,
      this.description,
      this.gender,
      this.address,
      this.birthday,
      this.status,
      this.RequestInfo})
      : super._() {
    if (uid == null) {
      throw new BuiltValueNullFieldError('Stranger', 'uid');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Stranger', 'name');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('Stranger', 'description');
    }
    if (gender == null) {
      throw new BuiltValueNullFieldError('Stranger', 'gender');
    }
  }

  @override
  Stranger rebuild(void Function(StrangerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StrangerBuilder toBuilder() => new StrangerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Stranger &&
        uid == other.uid &&
        name == other.name &&
        imgUrl == other.imgUrl &&
        description == other.description &&
        gender == other.gender &&
        address == other.address &&
        birthday == other.birthday &&
        status == other.status &&
        RequestInfo == other.RequestInfo;
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
                            description.hashCode),
                        gender.hashCode),
                    address.hashCode),
                birthday.hashCode),
            status.hashCode),
        RequestInfo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Stranger')
          ..add('uid', uid)
          ..add('name', name)
          ..add('imgUrl', imgUrl)
          ..add('description', description)
          ..add('gender', gender)
          ..add('address', address)
          ..add('birthday', birthday)
          ..add('status', status)
          ..add('RequestInfo', RequestInfo))
        .toString();
  }
}

class StrangerBuilder implements Builder<Stranger, StrangerBuilder> {
  _$Stranger _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _imgUrl;
  String get imgUrl => _$this._imgUrl;
  set imgUrl(String imgUrl) => _$this._imgUrl = imgUrl;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _gender;
  int get gender => _$this._gender;
  set gender(int gender) => _$this._gender = gender;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  DateTime _birthday;
  DateTime get birthday => _$this._birthday;
  set birthday(DateTime birthday) => _$this._birthday = birthday;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _RequestInfo;
  String get RequestInfo => _$this._RequestInfo;
  set RequestInfo(String RequestInfo) => _$this._RequestInfo = RequestInfo;

  StrangerBuilder();

  StrangerBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _name = _$v.name;
      _imgUrl = _$v.imgUrl;
      _description = _$v.description;
      _gender = _$v.gender;
      _address = _$v.address;
      _birthday = _$v.birthday;
      _status = _$v.status;
      _RequestInfo = _$v.RequestInfo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Stranger other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Stranger;
  }

  @override
  void update(void Function(StrangerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Stranger build() {
    final _$result = _$v ??
        new _$Stranger._(
            uid: uid,
            name: name,
            imgUrl: imgUrl,
            description: description,
            gender: gender,
            address: address,
            birthday: birthday,
            status: status,
            RequestInfo: RequestInfo);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
