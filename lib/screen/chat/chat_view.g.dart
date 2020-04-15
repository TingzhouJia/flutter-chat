// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_view.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChatScreenViewModel extends ChatScreenViewModel {
  @override
  final BuiltList<Message> messageList;
  @override
  final User target;
  @override
  final User me;

  factory _$ChatScreenViewModel(
          [void Function(ChatScreenViewModelBuilder) updates]) =>
      (new ChatScreenViewModelBuilder()..update(updates)).build();

  _$ChatScreenViewModel._({this.messageList, this.target, this.me})
      : super._() {
    if (me == null) {
      throw new BuiltValueNullFieldError('ChatScreenViewModel', 'me');
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
        target == other.target &&
        me == other.me;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, messageList.hashCode), target.hashCode), me.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatScreenViewModel')
          ..add('messageList', messageList)
          ..add('target', target)
          ..add('me', me))
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

  UserBuilder _target;
  UserBuilder get target => _$this._target ??= new UserBuilder();
  set target(UserBuilder target) => _$this._target = target;

  UserBuilder _me;
  UserBuilder get me => _$this._me ??= new UserBuilder();
  set me(UserBuilder me) => _$this._me = me;

  ChatScreenViewModelBuilder();

  ChatScreenViewModelBuilder get _$this {
    if (_$v != null) {
      _messageList = _$v.messageList?.toBuilder();
      _target = _$v.target?.toBuilder();
      _me = _$v.me?.toBuilder();
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
              target: _target?.build(),
              me: me.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'messageList';
        _messageList?.build();
        _$failedField = 'target';
        _target?.build();
        _$failedField = 'me';
        me.build();
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
