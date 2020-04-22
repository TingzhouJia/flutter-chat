// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_detail_view.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChatDetailViewModel extends ChatDetailViewModel {
  @override
  final User me;
  @override
  final User target;

  factory _$ChatDetailViewModel(
          [void Function(ChatDetailViewModelBuilder) updates]) =>
      (new ChatDetailViewModelBuilder()..update(updates)).build();

  _$ChatDetailViewModel._({this.me, this.target}) : super._() {
    if (target == null) {
      throw new BuiltValueNullFieldError('ChatDetailViewModel', 'target');
    }
  }

  @override
  ChatDetailViewModel rebuild(
          void Function(ChatDetailViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatDetailViewModelBuilder toBuilder() =>
      new ChatDetailViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatDetailViewModel &&
        me == other.me &&
        target == other.target;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, me.hashCode), target.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChatDetailViewModel')
          ..add('me', me)
          ..add('target', target))
        .toString();
  }
}

class ChatDetailViewModelBuilder
    implements Builder<ChatDetailViewModel, ChatDetailViewModelBuilder> {
  _$ChatDetailViewModel _$v;

  UserBuilder _me;
  UserBuilder get me => _$this._me ??= new UserBuilder();
  set me(UserBuilder me) => _$this._me = me;

  UserBuilder _target;
  UserBuilder get target => _$this._target ??= new UserBuilder();
  set target(UserBuilder target) => _$this._target = target;

  ChatDetailViewModelBuilder();

  ChatDetailViewModelBuilder get _$this {
    if (_$v != null) {
      _me = _$v.me?.toBuilder();
      _target = _$v.target?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatDetailViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChatDetailViewModel;
  }

  @override
  void update(void Function(ChatDetailViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChatDetailViewModel build() {
    _$ChatDetailViewModel _$result;
    try {
      _$result = _$v ??
          new _$ChatDetailViewModel._(me: _me?.build(), target: target.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'me';
        _me?.build();
        _$failedField = 'target';
        target.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ChatDetailViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
