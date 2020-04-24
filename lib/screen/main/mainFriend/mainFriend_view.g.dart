// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mainFriend_view.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MainFriendScreenViewModel extends MainFriendScreenViewModel {
  @override
  final BuiltList<User> friendList;
  @override
  final BuiltMap<String, double> groupList;

  factory _$MainFriendScreenViewModel(
          [void Function(MainFriendScreenViewModelBuilder) updates]) =>
      (new MainFriendScreenViewModelBuilder()..update(updates)).build();

  _$MainFriendScreenViewModel._({this.friendList, this.groupList}) : super._() {
    if (friendList == null) {
      throw new BuiltValueNullFieldError(
          'MainFriendScreenViewModel', 'friendList');
    }
    if (groupList == null) {
      throw new BuiltValueNullFieldError(
          'MainFriendScreenViewModel', 'groupList');
    }
  }

  @override
  MainFriendScreenViewModel rebuild(
          void Function(MainFriendScreenViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MainFriendScreenViewModelBuilder toBuilder() =>
      new MainFriendScreenViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MainFriendScreenViewModel &&
        friendList == other.friendList &&
        groupList == other.groupList;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, friendList.hashCode), groupList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MainFriendScreenViewModel')
          ..add('friendList', friendList)
          ..add('groupList', groupList))
        .toString();
  }
}

class MainFriendScreenViewModelBuilder
    implements
        Builder<MainFriendScreenViewModel, MainFriendScreenViewModelBuilder> {
  _$MainFriendScreenViewModel _$v;

  ListBuilder<User> _friendList;
  ListBuilder<User> get friendList =>
      _$this._friendList ??= new ListBuilder<User>();
  set friendList(ListBuilder<User> friendList) =>
      _$this._friendList = friendList;

  MapBuilder<String, double> _groupList;
  MapBuilder<String, double> get groupList =>
      _$this._groupList ??= new MapBuilder<String, double>();
  set groupList(MapBuilder<String, double> groupList) =>
      _$this._groupList = groupList;

  MainFriendScreenViewModelBuilder();

  MainFriendScreenViewModelBuilder get _$this {
    if (_$v != null) {
      _friendList = _$v.friendList?.toBuilder();
      _groupList = _$v.groupList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MainFriendScreenViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MainFriendScreenViewModel;
  }

  @override
  void update(void Function(MainFriendScreenViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MainFriendScreenViewModel build() {
    _$MainFriendScreenViewModel _$result;
    try {
      _$result = _$v ??
          new _$MainFriendScreenViewModel._(
              friendList: friendList.build(), groupList: groupList.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'friendList';
        friendList.build();
        _$failedField = 'groupList';
        groupList.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MainFriendScreenViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
