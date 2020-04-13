// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final User user;
  @override
  final BuiltList<User> Friends;
  @override
  final BuiltList<User> FavorList;
  @override
  final BuiltList<recentMessage> recentChatList;
  @override
  final BuiltList<Message> currentChat;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.user,
      this.Friends,
      this.FavorList,
      this.recentChatList,
      this.currentChat})
      : super._();

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        user == other.user &&
        Friends == other.Friends &&
        FavorList == other.FavorList &&
        recentChatList == other.recentChatList &&
        currentChat == other.currentChat;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, user.hashCode), Friends.hashCode),
                FavorList.hashCode),
            recentChatList.hashCode),
        currentChat.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('user', user)
          ..add('Friends', Friends)
          ..add('FavorList', FavorList)
          ..add('recentChatList', recentChatList)
          ..add('currentChat', currentChat))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  ListBuilder<User> _Friends;
  ListBuilder<User> get Friends => _$this._Friends ??= new ListBuilder<User>();
  set Friends(ListBuilder<User> Friends) => _$this._Friends = Friends;

  ListBuilder<User> _FavorList;
  ListBuilder<User> get FavorList =>
      _$this._FavorList ??= new ListBuilder<User>();
  set FavorList(ListBuilder<User> FavorList) => _$this._FavorList = FavorList;

  ListBuilder<recentMessage> _recentChatList;
  ListBuilder<recentMessage> get recentChatList =>
      _$this._recentChatList ??= new ListBuilder<recentMessage>();
  set recentChatList(ListBuilder<recentMessage> recentChatList) =>
      _$this._recentChatList = recentChatList;

  ListBuilder<Message> _currentChat;
  ListBuilder<Message> get currentChat =>
      _$this._currentChat ??= new ListBuilder<Message>();
  set currentChat(ListBuilder<Message> currentChat) =>
      _$this._currentChat = currentChat;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _Friends = _$v.Friends?.toBuilder();
      _FavorList = _$v.FavorList?.toBuilder();
      _recentChatList = _$v.recentChatList?.toBuilder();
      _currentChat = _$v.currentChat?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              user: _user?.build(),
              Friends: _Friends?.build(),
              FavorList: _FavorList?.build(),
              recentChatList: _recentChatList?.build(),
              currentChat: _currentChat?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
        _$failedField = 'Friends';
        _Friends?.build();
        _$failedField = 'FavorList';
        _FavorList?.build();
        _$failedField = 'recentChatList';
        _recentChatList?.build();
        _$failedField = 'currentChat';
        _currentChat?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
