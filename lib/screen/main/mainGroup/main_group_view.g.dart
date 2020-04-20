// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_group_view.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MainGroupScreenViewModel extends MainGroupScreenViewModel {
  @override
  final void Function(String uid) loadMainGroup;
  @override
  final String uid;
  @override
  final BuiltList<Channel> currentGroups;

  factory _$MainGroupScreenViewModel(
          [void Function(MainGroupScreenViewModelBuilder) updates]) =>
      (new MainGroupScreenViewModelBuilder()..update(updates)).build();

  _$MainGroupScreenViewModel._(
      {this.loadMainGroup, this.uid, this.currentGroups})
      : super._() {
    if (loadMainGroup == null) {
      throw new BuiltValueNullFieldError(
          'MainGroupScreenViewModel', 'loadMainGroup');
    }
    if (uid == null) {
      throw new BuiltValueNullFieldError('MainGroupScreenViewModel', 'uid');
    }
    if (currentGroups == null) {
      throw new BuiltValueNullFieldError(
          'MainGroupScreenViewModel', 'currentGroups');
    }
  }

  @override
  MainGroupScreenViewModel rebuild(
          void Function(MainGroupScreenViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MainGroupScreenViewModelBuilder toBuilder() =>
      new MainGroupScreenViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is MainGroupScreenViewModel &&
        loadMainGroup == _$dynamicOther.loadMainGroup &&
        uid == other.uid &&
        currentGroups == other.currentGroups;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, loadMainGroup.hashCode), uid.hashCode),
        currentGroups.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MainGroupScreenViewModel')
          ..add('loadMainGroup', loadMainGroup)
          ..add('uid', uid)
          ..add('currentGroups', currentGroups))
        .toString();
  }
}

class MainGroupScreenViewModelBuilder
    implements
        Builder<MainGroupScreenViewModel, MainGroupScreenViewModelBuilder> {
  _$MainGroupScreenViewModel _$v;

  void Function(String uid) _loadMainGroup;
  void Function(String uid) get loadMainGroup => _$this._loadMainGroup;
  set loadMainGroup(void Function(String uid) loadMainGroup) =>
      _$this._loadMainGroup = loadMainGroup;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  ListBuilder<Channel> _currentGroups;
  ListBuilder<Channel> get currentGroups =>
      _$this._currentGroups ??= new ListBuilder<Channel>();
  set currentGroups(ListBuilder<Channel> currentGroups) =>
      _$this._currentGroups = currentGroups;

  MainGroupScreenViewModelBuilder();

  MainGroupScreenViewModelBuilder get _$this {
    if (_$v != null) {
      _loadMainGroup = _$v.loadMainGroup;
      _uid = _$v.uid;
      _currentGroups = _$v.currentGroups?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MainGroupScreenViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MainGroupScreenViewModel;
  }

  @override
  void update(void Function(MainGroupScreenViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MainGroupScreenViewModel build() {
    _$MainGroupScreenViewModel _$result;
    try {
      _$result = _$v ??
          new _$MainGroupScreenViewModel._(
              loadMainGroup: loadMainGroup,
              uid: uid,
              currentGroups: currentGroups.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'currentGroups';
        currentGroups.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MainGroupScreenViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
