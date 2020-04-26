// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stranger_view.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StrangerViewModel extends StrangerViewModel {
  @override
  final Stranger target;

  factory _$StrangerViewModel(
          [void Function(StrangerViewModelBuilder) updates]) =>
      (new StrangerViewModelBuilder()..update(updates)).build();

  _$StrangerViewModel._({this.target}) : super._() {
    if (target == null) {
      throw new BuiltValueNullFieldError('StrangerViewModel', 'target');
    }
  }

  @override
  StrangerViewModel rebuild(void Function(StrangerViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StrangerViewModelBuilder toBuilder() =>
      new StrangerViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StrangerViewModel && target == other.target;
  }

  @override
  int get hashCode {
    return $jf($jc(0, target.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StrangerViewModel')
          ..add('target', target))
        .toString();
  }
}

class StrangerViewModelBuilder
    implements Builder<StrangerViewModel, StrangerViewModelBuilder> {
  _$StrangerViewModel _$v;

  StrangerBuilder _target;
  StrangerBuilder get target => _$this._target ??= new StrangerBuilder();
  set target(StrangerBuilder target) => _$this._target = target;

  StrangerViewModelBuilder();

  StrangerViewModelBuilder get _$this {
    if (_$v != null) {
      _target = _$v.target?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StrangerViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StrangerViewModel;
  }

  @override
  void update(void Function(StrangerViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StrangerViewModel build() {
    _$StrangerViewModel _$result;
    try {
      _$result = _$v ?? new _$StrangerViewModel._(target: target.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'target';
        target.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'StrangerViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
