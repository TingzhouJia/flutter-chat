// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_view.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChatScreenViewModel extends ChatScreenViewModel {
  @override
  final BuiltList<Message> messageList;
  @override
  final User me;
  @override
  final Friend target;
  @override
  final bool loading;

  factory _$ChatScreenViewModel(
          [void Function(ChatScreenViewModelBuilder) updates]) =>
      (new ChatScreenViewModelBuilder()..update(updates)).build();

  _$ChatScreenViewModel._(
      {this.messageList, this.me, this.target, this.loading})
      : super._() {
    if (me == null) {
      throw new BuiltValueNullFieldError('ChatScreenViewModel', 'me');
    }
    if (target == null) {
      throw new BuiltValueNullFieldError('ChatScreenViewModel', 'target');
    }
    if (loading == null) {
      throw new BuiltValueNullFieldError('ChatScreenViewModel', 'loading');
    }
  }

  @override
  ChatScreenViewModel rebuild(
          void Function(ChatScreenViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatScreenViewModelBuilder toBuilder() =>
      new ChatScreenViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatScreenViewModel &&
        messageList == other.messageList &&
        me == other.me &&
        target == other.target &&
        loading == other.loading;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, messageList.hashCode), me.hashCode), target.hashCode),
        loading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatScreenViewModel')
          ..add('messageList', messageList)
          ..add('me', me)
          ..add('target', target)
          ..add('loading', loading))
        .toString();
  }
}

class ChatScreenViewModelBuilder
    implements Builder<ChatScreenViewModel, ChatScreenViewModelBuilder> {
  _$ChatScreenViewModel _$v;

  ListBuilder<Message> _messageList;
  ListBuilder<Message> get messageList =>
      _$this._messageList ??= new ListBuilder<Message>();
  set messageList(ListBuilder<Message> messageList) =>
      _$this._messageList = messageList;

  UserBuilder _me;
  UserBuilder get me => _$this._me ??= new UserBuilder();
  set me(UserBuilder me) => _$this._me = me;

  FriendBuilder _target;
  FriendBuilder get target => _$this._target ??= new FriendBuilder();
  set target(FriendBuilder target) => _$this._target = target;

  bool _loading;
  bool get loading => _$this._loading;
  set loading(bool loading) => _$this._loading = loading;

  ChatScreenViewModelBuilder();

  ChatScreenViewModelBuilder get _$this {
    if (_$v != null) {
      _messageList = _$v.messageList?.toBuilder();
      _me = _$v.me?.toBuilder();
      _target = _$v.target?.toBuilder();
      _loading = _$v.loading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatScreenViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatScreenViewModel;
  }

  @override
  void update(void Function(ChatScreenViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatScreenViewModel build() {
    _$ChatScreenViewModel _$result;
    try {
      _$result = _$v ??
          new _$ChatScreenViewModel._(
              messageList: _messageList?.build(),
              me: me.build(),
              target: target.build(),
              loading: loading);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'messageList';
        _messageList?.build();
        _$failedField = 'me';
        me.build();
        _$failedField = 'target';
        target.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ChatScreenViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
