// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_avatar_view.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ResetAvatarViewModel extends ResetAvatarViewModel {
  @override
  final void Function(File img) submit;

  factory _$ResetAvatarViewModel(
          [void Function(ResetAvatarViewModelBuilder) updates]) =>
      (new ResetAvatarViewModelBuilder()..update(updates)).build();

  _$ResetAvatarViewModel._({this.submit}) : super._() {
    if (submit == null) {
      throw new BuiltValueNullFieldError('ResetAvatarViewModel', 'submit');
    }
  }

  @override
  ResetAvatarViewModel rebuild(
          void Function(ResetAvatarViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResetAvatarViewModelBuilder toBuilder() =>
      new ResetAvatarViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is ResetAvatarViewModel && submit == _$dynamicOther.submit;
  }

  @override
  int get hashCode {
    return $jf($jc(0, submit.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ResetAvatarViewModel')
          ..add('submit', submit))
        .toString();
  }
}

class ResetAvatarViewModelBuilder
    implements Builder<ResetAvatarViewModel, ResetAvatarViewModelBuilder> {
  _$ResetAvatarViewModel _$v;

  void Function(File img) _submit;
  void Function(File img) get submit => _$this._submit;
  set submit(void Function(File img) submit) => _$this._submit = submit;

  ResetAvatarViewModelBuilder();

  ResetAvatarViewModelBuilder get _$this {
    if (_$v != null) {
      _submit = _$v.submit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResetAvatarViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ResetAvatarViewModel;
  }

  @override
  void update(void Function(ResetAvatarViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ResetAvatarViewModel build() {
    final _$result = _$v ?? new _$ResetAvatarViewModel._(submit: submit);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
