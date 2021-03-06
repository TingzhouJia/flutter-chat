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
  final Friend currentTarget;
  @override
  final BuiltList<Message> currentChat;
  @override
  final BuiltList<Channel> groupList;
  @override
  final Group selectedGroup;
  @override
  final BuiltList<Message> selectedGroupChat;
  @override
  final BuiltList<Message> SystemMessageList;
  @override
  final Stranger stranger;
  @override
  final Channel strangeChannel;
  @override
  final BuiltList<Stranger> requestList;
  @override
  final bool loading;
  @override
  final int messageOnScreen;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.user,
      this.Friends,
      this.FavorList,
      this.recentChatList,
      this.currentTarget,
      this.currentChat,
      this.groupList,
      this.selectedGroup,
      this.selectedGroupChat,
      this.SystemMessageList,
      this.stranger,
      this.strangeChannel,
      this.requestList,
      this.loading,
      this.messageOnScreen})
      : super._() {
    if (loading == null) {
      throw new BuiltValueNullFieldError('AppState', 'loading');
    }
    if (messageOnScreen == null) {
      throw new BuiltValueNullFieldError('AppState', 'messageOnScreen');
    }
  }

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
        currentTarget == other.currentTarget &&
        currentChat == other.currentChat &&
        groupList == other.groupList &&
        selectedGroup == other.selectedGroup &&
        selectedGroupChat == other.selectedGroupChat &&
        SystemMessageList == other.SystemMessageList &&
        stranger == other.stranger &&
        strangeChannel == other.strangeChannel &&
        requestList == other.requestList &&
        loading == other.loading &&
        messageOnScreen == other.messageOnScreen;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(0,
                                                                user.hashCode),
                                                            Friends.hashCode),
                                                        FavorList.hashCode),
                                                    recentChatList.hashCode),
                                                currentTarget.hashCode),
                                            currentChat.hashCode),
                                        groupList.hashCode),
                                    selectedGroup.hashCode),
                                selectedGroupChat.hashCode),
                            SystemMessageList.hashCode),
                        stranger.hashCode),
                    strangeChannel.hashCode),
                requestList.hashCode),
            loading.hashCode),
        messageOnScreen.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('user', user)
          ..add('Friends', Friends)
          ..add('FavorList', FavorList)
          ..add('recentChatList', recentChatList)
          ..add('currentTarget', currentTarget)
          ..add('currentChat', currentChat)
          ..add('groupList', groupList)
          ..add('selectedGroup', selectedGroup)
          ..add('selectedGroupChat', selectedGroupChat)
          ..add('SystemMessageList', SystemMessageList)
          ..add('stranger', stranger)
          ..add('strangeChannel', strangeChannel)
          ..add('requestList', requestList)
          ..add('loading', loading)
          ..add('messageOnScreen', messageOnScreen))
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

  FriendBuilder _currentTarget;
  FriendBuilder get currentTarget =>
      _$this._currentTarget ??= new FriendBuilder();
  set currentTarget(FriendBuilder currentTarget) =>
      _$this._currentTarget = currentTarget;

  ListBuilder<Message> _currentChat;
  ListBuilder<Message> get currentChat =>
      _$this._currentChat ??= new ListBuilder<Message>();
  set currentChat(ListBuilder<Message> currentChat) =>
      _$this._currentChat = currentChat;

  ListBuilder<Channel> _groupList;
  ListBuilder<Channel> get groupList =>
      _$this._groupList ??= new ListBuilder<Channel>();
  set groupList(ListBuilder<Channel> groupList) =>
      _$this._groupList = groupList;

  GroupBuilder _selectedGroup;
  GroupBuilder get selectedGroup =>
      _$this._selectedGroup ??= new GroupBuilder();
  set selectedGroup(GroupBuilder selectedGroup) =>
      _$this._selectedGroup = selectedGroup;

  ListBuilder<Message> _selectedGroupChat;
  ListBuilder<Message> get selectedGroupChat =>
      _$this._selectedGroupChat ??= new ListBuilder<Message>();
  set selectedGroupChat(ListBuilder<Message> selectedGroupChat) =>
      _$this._selectedGroupChat = selectedGroupChat;

  ListBuilder<Message> _SystemMessageList;
  ListBuilder<Message> get SystemMessageList =>
      _$this._SystemMessageList ??= new ListBuilder<Message>();
  set SystemMessageList(ListBuilder<Message> SystemMessageList) =>
      _$this._SystemMessageList = SystemMessageList;

  StrangerBuilder _stranger;
  StrangerBuilder get stranger => _$this._stranger ??= new StrangerBuilder();
  set stranger(StrangerBuilder stranger) => _$this._stranger = stranger;

  ChannelBuilder _strangeChannel;
  ChannelBuilder get strangeChannel =>
      _$this._strangeChannel ??= new ChannelBuilder();
  set strangeChannel(ChannelBuilder strangeChannel) =>
      _$this._strangeChannel = strangeChannel;

  ListBuilder<Stranger> _requestList;
  ListBuilder<Stranger> get requestList =>
      _$this._requestList ??= new ListBuilder<Stranger>();
  set requestList(ListBuilder<Stranger> requestList) =>
      _$this._requestList = requestList;

  bool _loading;
  bool get loading => _$this._loading;
  set loading(bool loading) => _$this._loading = loading;

  int _messageOnScreen;
  int get messageOnScreen => _$this._messageOnScreen;
  set messageOnScreen(int messageOnScreen) =>
      _$this._messageOnScreen = messageOnScreen;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _Friends = _$v.Friends?.toBuilder();
      _FavorList = _$v.FavorList?.toBuilder();
      _recentChatList = _$v.recentChatList?.toBuilder();
      _currentTarget = _$v.currentTarget?.toBuilder();
      _currentChat = _$v.currentChat?.toBuilder();
      _groupList = _$v.groupList?.toBuilder();
      _selectedGroup = _$v.selectedGroup?.toBuilder();
      _selectedGroupChat = _$v.selectedGroupChat?.toBuilder();
      _SystemMessageList = _$v.SystemMessageList?.toBuilder();
      _stranger = _$v.stranger?.toBuilder();
      _strangeChannel = _$v.strangeChannel?.toBuilder();
      _requestList = _$v.requestList?.toBuilder();
      _loading = _$v.loading;
      _messageOnScreen = _$v.messageOnScreen;
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
              currentTarget: _currentTarget?.build(),
              currentChat: _currentChat?.build(),
              groupList: _groupList?.build(),
              selectedGroup: _selectedGroup?.build(),
              selectedGroupChat: _selectedGroupChat?.build(),
              SystemMessageList: _SystemMessageList?.build(),
              stranger: _stranger?.build(),
              strangeChannel: _strangeChannel?.build(),
              requestList: _requestList?.build(),
              loading: loading,
              messageOnScreen: messageOnScreen);
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
        _$failedField = 'currentTarget';
        _currentTarget?.build();
        _$failedField = 'currentChat';
        _currentChat?.build();
        _$failedField = 'groupList';
        _groupList?.build();
        _$failedField = 'selectedGroup';
        _selectedGroup?.build();
        _$failedField = 'selectedGroupChat';
        _selectedGroupChat?.build();
        _$failedField = 'SystemMessageList';
        _SystemMessageList?.build();
        _$failedField = 'stranger';
        _stranger?.build();
        _$failedField = 'strangeChannel';
        _strangeChannel?.build();
        _$failedField = 'requestList';
        _requestList?.build();
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
