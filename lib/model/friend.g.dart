// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Friend extends Friend {
  @override
  final User user;
  @override
  final String background;
  @override
  final bool notification;
  @override
  final bool strongNotification;
  @override
  final bool setTop;
  @override
  final String nickName;

  factory _$Friend([void Function(FriendBuilder) updates]) =>
      (new FriendBuilder()..update(updates)).build();

  _$Friend._(
      {this.user,
      this.background,
      this.notification,
      this.strongNotification,
      this.setTop,
      this.nickName})
      : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('Friend', 'user');
    }
    if (background == null) {
      throw new BuiltValueNullFieldError('Friend', 'background');
    }
    if (notification == null) {
      throw new BuiltValueNullFieldError('Friend', 'notification');
    }
    if (strongNotification == null) {
      throw new BuiltValueNullFieldError('Friend', 'strongNotification');
    }
    if (setTop == null) {
      throw new BuiltValueNullFieldError('Friend', 'setTop');
    }
    if (nickName == null) {
      throw new BuiltValueNullFieldError('Friend', 'nickName');
    }
  }

  @override
  Friend rebuild(void Function(FriendBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FriendBuilder toBuilder() => new FriendBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Friend &&
        user == other.user &&
        background == other.background &&
        notification == other.notification &&
        strongNotification == other.strongNotification &&
        setTop == other.setTop &&
        nickName == other.nickName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, user.hashCode), background.hashCode),
                    notification.hashCode),
                strongNotification.hashCode),
            setTop.hashCode),
        nickName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Friend')
          ..add('user', user)
          ..add('background', background)
          ..add('notification', notification)
          ..add('strongNotification', strongNotification)
          ..add('setTop', setTop)
          ..add('nickName', nickName))
        .toString();
  }
}

class FriendBuilder implements Builder<Friend, FriendBuilder> {
  _$Friend _$v;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  String _background;
  String get background => _$this._background;
  set background(String background) => _$this._background = background;

  bool _notification;
  bool get notification => _$this._notification;
  set notification(bool notification) => _$this._notification = notification;

  bool _strongNotification;
  bool get strongNotification => _$this._strongNotification;
  set strongNotification(bool strongNotification) =>
      _$this._strongNotification = strongNotification;

  bool _setTop;
  bool get setTop => _$this._setTop;
  set setTop(bool setTop) => _$this._setTop = setTop;

  String _nickName;
  String get nickName => _$this._nickName;
  set nickName(String nickName) => _$this._nickName = nickName;

  FriendBuilder();

  FriendBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _background = _$v.background;
      _notification = _$v.notification;
      _strongNotification = _$v.strongNotification;
      _setTop = _$v.setTop;
      _nickName = _$v.nickName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Friend other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Friend;
  }

  @override
  void update(void Function(FriendBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Friend build() {
    _$Friend _$result;
    try {
      _$result = _$v ??
          new _$Friend._(
              user: user.build(),
              background: background,
              notification: notification,
              strongNotification: strongNotification,
              setTop: setTop,
              nickName: nickName);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Friend', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
