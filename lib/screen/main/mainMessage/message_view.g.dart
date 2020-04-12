// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_view.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MessageScreenViewModel extends MessageScreenViewModel {
  @override
  final BuiltList<User> favorContact;

  factory _$MessageScreenViewModel(
          [void Function(MessageScreenViewModelBuilder) updates]) =>
      (new MessageScreenViewModelBuilder()..update(updates)).build();

  _$MessageScreenViewModel._({this.favorContact}) : super._() {
    if (favorContact == null) {
      throw new BuiltValueNullFieldError(
          'MessageScreenViewModel', 'favorContact');
    }
  }

  @override
  MessageScreenViewModel rebuild(
          void Function(MessageScreenViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageScreenViewModelBuilder toBuilder() =>
      new MessageScreenViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageScreenViewModel &&
        favorContact == other.favorContact;
  }

  @override
  int get hashCode {
    return $jf($jc(0, favorContact.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MessageScreenViewModel')
          ..add('favorContact', favorContact))
        .toString();
  }
}

class MessageScreenViewModelBuilder
    implements Builder<MessageScreenViewModel, MessageScreenViewModelBuilder> {
  _$MessageScreenViewModel _$v;

  ListBuilder<User> _favorContact;
  ListBuilder<User> get favorContact =>
      _$this._favorContact ??= new ListBuilder<User>();
  set favorContact(ListBuilder<User> favorContact) =>
      _$this._favorContact = favorContact;

  MessageScreenViewModelBuilder();

  MessageScreenViewModelBuilder get _$this {
    if (_$v != null) {
      _favorContact = _$v.favorContact?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageScreenViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MessageScreenViewModel;
  }

  @override
  void update(void Function(MessageScreenViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MessageScreenViewModel build() {
    _$MessageScreenViewModel _$result;
    try {
      _$result = _$v ??
          new _$MessageScreenViewModel._(favorContact: favorContact.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'favorContact';
        favorContact.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MessageScreenViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
