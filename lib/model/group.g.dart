// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Group extends Group {
  @override
  final Channel curChannel;
  @override
  final BuiltList<User> users;
  @override
  final bool hasUpdates;
  @override
  final BuiltList<User> newInvitation;

  factory _$Group([void Function(GroupBuilder) updates]) =>
      (new GroupBuilder()..update(updates)).build();

  _$Group._({this.curChannel, this.users, this.hasUpdates, this.newInvitation})
      : super._() {
    if (curChannel == null) {
      throw new BuiltValueNullFieldError('Group', 'curChannel');
    }
    if (users == null) {
      throw new BuiltValueNullFieldError('Group', 'users');
    }
  }

  @override
  Group rebuild(void Function(GroupBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GroupBuilder toBuilder() => new GroupBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Group &&
        curChannel == other.curChannel &&
        users == other.users &&
        hasUpdates == other.hasUpdates &&
        newInvitation == other.newInvitation;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, curChannel.hashCode), users.hashCode),
            hasUpdates.hashCode),
        newInvitation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Group')
          ..add('curChannel', curChannel)
          ..add('users', users)
          ..add('hasUpdates', hasUpdates)
          ..add('newInvitation', newInvitation))
        .toString();
  }
}

class GroupBuilder implements Builder<Group, GroupBuilder> {
  _$Group _$v;

  ChannelBuilder _curChannel;
  ChannelBuilder get curChannel => _$this._curChannel ??= new ChannelBuilder();
  set curChannel(ChannelBuilder curChannel) => _$this._curChannel = curChannel;

  ListBuilder<User> _users;
  ListBuilder<User> get users => _$this._users ??= new ListBuilder<User>();
  set users(ListBuilder<User> users) => _$this._users = users;

  bool _hasUpdates;
  bool get hasUpdates => _$this._hasUpdates;
  set hasUpdates(bool hasUpdates) => _$this._hasUpdates = hasUpdates;

  ListBuilder<User> _newInvitation;
  ListBuilder<User> get newInvitation =>
      _$this._newInvitation ??= new ListBuilder<User>();
  set newInvitation(ListBuilder<User> newInvitation) =>
      _$this._newInvitation = newInvitation;

  GroupBuilder();

  GroupBuilder get _$this {
    if (_$v != null) {
      _curChannel = _$v.curChannel?.toBuilder();
      _users = _$v.users?.toBuilder();
      _hasUpdates = _$v.hasUpdates;
      _newInvitation = _$v.newInvitation?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Group other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Group;
  }

  @override
  void update(void Function(GroupBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Group build() {
    _$Group _$result;
    try {
      _$result = _$v ??
          new _$Group._(
              curChannel: curChannel.build(),
              users: users.build(),
              hasUpdates: hasUpdates,
              newInvitation: _newInvitation?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'curChannel';
        curChannel.build();
        _$failedField = 'users';
        users.build();

        _$failedField = 'newInvitation';
        _newInvitation?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Group', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
