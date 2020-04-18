// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Group extends Group {
  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final GroupVisibility visibility;
  @override
  final BuiltList<User> users;
  @override
  final String authorId;
  @override
  final bool hasUpdates;
  @override
  final BuiltList<User> newInvitation;
  @override
  final String hexColor;
  @override
  final DateTime startDate;

  factory _$Group([void Function(GroupBuilder) updates]) =>
      (new GroupBuilder()..update(updates)).build();

  _$Group._(
      {this.id,
      this.name,
      this.description,
      this.visibility,
      this.users,
      this.authorId,
      this.hasUpdates,
      this.newInvitation,
      this.hexColor,
      this.startDate})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Group', 'name');
    }
    if (visibility == null) {
      throw new BuiltValueNullFieldError('Group', 'visibility');
    }
    if (users == null) {
      throw new BuiltValueNullFieldError('Group', 'users');
    }
    if (hexColor == null) {
      throw new BuiltValueNullFieldError('Group', 'hexColor');
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
        id == other.id &&
        name == other.name &&
        description == other.description &&
        visibility == other.visibility &&
        users == other.users &&
        authorId == other.authorId &&
        hasUpdates == other.hasUpdates &&
        newInvitation == other.newInvitation &&
        hexColor == other.hexColor &&
        startDate == other.startDate;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc($jc(0, id.hashCode), name.hashCode),
                                    description.hashCode),
                                visibility.hashCode),
                            users.hashCode),
                        authorId.hashCode),
                    hasUpdates.hashCode),
                newInvitation.hashCode),
            hexColor.hashCode),
        startDate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Group')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('visibility', visibility)
          ..add('users', users)
          ..add('authorId', authorId)
          ..add('hasUpdates', hasUpdates)
          ..add('newInvitation', newInvitation)
          ..add('hexColor', hexColor)
          ..add('startDate', startDate))
        .toString();
  }
}

class GroupBuilder implements Builder<Group, GroupBuilder> {
  _$Group _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  GroupVisibility _visibility;
  GroupVisibility get visibility => _$this._visibility;
  set visibility(GroupVisibility visibility) => _$this._visibility = visibility;

  ListBuilder<User> _users;
  ListBuilder<User> get users => _$this._users ??= new ListBuilder<User>();
  set users(ListBuilder<User> users) => _$this._users = users;

  String _authorId;
  String get authorId => _$this._authorId;
  set authorId(String authorId) => _$this._authorId = authorId;

  bool _hasUpdates;
  bool get hasUpdates => _$this._hasUpdates;
  set hasUpdates(bool hasUpdates) => _$this._hasUpdates = hasUpdates;

  ListBuilder<User> _newInvitation;
  ListBuilder<User> get newInvitation =>
      _$this._newInvitation ??= new ListBuilder<User>();
  set newInvitation(ListBuilder<User> newInvitation) =>
      _$this._newInvitation = newInvitation;

  String _hexColor;
  String get hexColor => _$this._hexColor;
  set hexColor(String hexColor) => _$this._hexColor = hexColor;

  DateTime _startDate;
  DateTime get startDate => _$this._startDate;
  set startDate(DateTime startDate) => _$this._startDate = startDate;

  GroupBuilder();

  GroupBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _description = _$v.description;
      _visibility = _$v.visibility;
      _users = _$v.users?.toBuilder();
      _authorId = _$v.authorId;
      _hasUpdates = _$v.hasUpdates;
      _newInvitation = _$v.newInvitation?.toBuilder();
      _hexColor = _$v.hexColor;
      _startDate = _$v.startDate;
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
              id: id,
              name: name,
              description: description,
              visibility: visibility,
              users: users.build(),
              authorId: authorId,
              hasUpdates: hasUpdates,
              newInvitation: _newInvitation?.build(),
              hexColor: hexColor,
              startDate: startDate);
    } catch (_) {
      String _$failedField;
      try {
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
