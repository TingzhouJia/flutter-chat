// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_screen_view.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FriendScreenViewModel extends FriendScreenViewModel {
  @override
  final Friend friend;

  factory _$FriendScreenViewModel(
          [void Function(FriendScreenViewModelBuilder) updates]) =>
      (new FriendScreenViewModelBuilder()..update(updates)).build();

  _$FriendScreenViewModel._({this.friend}) : super._() {
    if (friend == null) {
      throw new BuiltValueNullFieldError('FriendScreenViewModel', 'friend');
    }
  }

  @override
  FriendScreenViewModel rebuild(
          void Function(FriendScreenViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FriendScreenViewModelBuilder toBuilder() =>
      new FriendScreenViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FriendScreenViewModel && friend == other.friend;
  }

  @override
  int get hashCode {
    return $jf($jc(0, friend.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FriendScreenViewModel')
          ..add('friend', friend))
        .toString();
  }
}

class FriendScreenViewModelBuilder
    implements Builder<FriendScreenViewModel, FriendScreenViewModelBuilder> {
  _$FriendScreenViewModel _$v;

  FriendBuilder _friend;
  FriendBuilder get friend => _$this._friend ??= new FriendBuilder();
  set friend(FriendBuilder friend) => _$this._friend = friend;

  FriendScreenViewModelBuilder();

  FriendScreenViewModelBuilder get _$this {
    if (_$v != null) {
      _friend = _$v.friend?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FriendScreenViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FriendScreenViewModel;
  }

  @override
  void update(void Function(FriendScreenViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FriendScreenViewModel build() {
    _$FriendScreenViewModel _$result;
    try {
      _$result = _$v ?? new _$FriendScreenViewModel._(friend: friend.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'friend';
        friend.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'FriendScreenViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
