// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recentChat_view.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecentChatViewModel extends RecentChatViewModel {
  @override
  final BuiltList<recentMessage> recentChatList;
  @override
  final bool loading;
  @override
  final String uid;
  @override
  final Function setLoading;

  factory _$RecentChatViewModel(
          [void Function(RecentChatViewModelBuilder) updates]) =>
      (new RecentChatViewModelBuilder()..update(updates)).build();

  _$RecentChatViewModel._(
      {this.recentChatList, this.loading, this.uid, this.setLoading})
      : super._() {
    if (loading == null) {
      throw new BuiltValueNullFieldError('RecentChatViewModel', 'loading');
    }
    if (uid == null) {
      throw new BuiltValueNullFieldError('RecentChatViewModel', 'uid');
    }
    if (setLoading == null) {
      throw new BuiltValueNullFieldError('RecentChatViewModel', 'setLoading');
    }
  }

  @override
  RecentChatViewModel rebuild(
          void Function(RecentChatViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecentChatViewModelBuilder toBuilder() =>
      new RecentChatViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecentChatViewModel &&
        recentChatList == other.recentChatList &&
        loading == other.loading &&
        uid == other.uid &&
        setLoading == other.setLoading;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, recentChatList.hashCode), loading.hashCode),
            uid.hashCode),
        setLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RecentChatViewModel')
          ..add('recentChatList', recentChatList)
          ..add('loading', loading)
          ..add('uid', uid)
          ..add('setLoading', setLoading))
        .toString();
  }
}

class RecentChatViewModelBuilder
    implements Builder<RecentChatViewModel, RecentChatViewModelBuilder> {
  _$RecentChatViewModel _$v;

  ListBuilder<recentMessage> _recentChatList;
  ListBuilder<recentMessage> get recentChatList =>
      _$this._recentChatList ??= new ListBuilder<recentMessage>();
  set recentChatList(ListBuilder<recentMessage> recentChatList) =>
      _$this._recentChatList = recentChatList;

  bool _loading;
  bool get loading => _$this._loading;
  set loading(bool loading) => _$this._loading = loading;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  Function _setLoading;
  Function get setLoading => _$this._setLoading;
  set setLoading(Function setLoading) => _$this._setLoading = setLoading;

  RecentChatViewModelBuilder();

  RecentChatViewModelBuilder get _$this {
    if (_$v != null) {
      _recentChatList = _$v.recentChatList?.toBuilder();
      _loading = _$v.loading;
      _uid = _$v.uid;
      _setLoading = _$v.setLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecentChatViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RecentChatViewModel;
  }

  @override
  void update(void Function(RecentChatViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RecentChatViewModel build() {
    _$RecentChatViewModel _$result;
    try {
      _$result = _$v ??
          new _$RecentChatViewModel._(
              recentChatList: _recentChatList?.build(),
              loading: loading,
              uid: uid,
              setLoading: setLoading);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'recentChatList';
        _recentChatList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RecentChatViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
