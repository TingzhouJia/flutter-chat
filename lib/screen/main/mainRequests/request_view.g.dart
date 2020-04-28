// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_view.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RequestScreenViewModel extends RequestScreenViewModel {
  @override
  final BuiltList<Stranger> requesterList;

  factory _$RequestScreenViewModel(
          [void Function(RequestScreenViewModelBuilder) updates]) =>
      (new RequestScreenViewModelBuilder()..update(updates)).build();

  _$RequestScreenViewModel._({this.requesterList}) : super._() {
    if (requesterList == null) {
      throw new BuiltValueNullFieldError(
          'RequestScreenViewModel', 'requesterList');
    }
  }

  @override
  RequestScreenViewModel rebuild(
          void Function(RequestScreenViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RequestScreenViewModelBuilder toBuilder() =>
      new RequestScreenViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RequestScreenViewModel &&
        requesterList == other.requesterList;
  }

  @override
  int get hashCode {
    return $jf($jc(0, requesterList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RequestScreenViewModel')
          ..add('requesterList', requesterList))
        .toString();
  }
}

class RequestScreenViewModelBuilder
    implements Builder<RequestScreenViewModel, RequestScreenViewModelBuilder> {
  _$RequestScreenViewModel _$v;

  ListBuilder<Stranger> _requesterList;
  ListBuilder<Stranger> get requesterList =>
      _$this._requesterList ??= new ListBuilder<Stranger>();
  set requesterList(ListBuilder<Stranger> requesterList) =>
      _$this._requesterList = requesterList;

  RequestScreenViewModelBuilder();

  RequestScreenViewModelBuilder get _$this {
    if (_$v != null) {
      _requesterList = _$v.requesterList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RequestScreenViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RequestScreenViewModel;
  }

  @override
  void update(void Function(RequestScreenViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RequestScreenViewModel build() {
    _$RequestScreenViewModel _$result;
    try {
      _$result = _$v ??
          new _$RequestScreenViewModel._(requesterList: requesterList.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'requesterList';
        requesterList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RequestScreenViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
