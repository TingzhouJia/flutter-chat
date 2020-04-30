// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_view.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChannelScreenViewModel extends ChannelScreenViewModel {
  @override
  final Channel curChannel;
  @override
  final BuiltList<User> userList;
  @override
  final BuiltList<User> newInvitation;

  factory _$ChannelScreenViewModel(
          [void Function(ChannelScreenViewModelBuilder) updates]) =>
      (new ChannelScreenViewModelBuilder()..update(updates)).build();

  _$ChannelScreenViewModel._(
      {this.curChannel, this.userList, this.newInvitation})
      : super._() {
    if (curChannel == null) {
      throw new BuiltValueNullFieldError(
          'ChannelScreenViewModel', 'curChannel');
    }
  }

  @override
  ChannelScreenViewModel rebuild(
          void Function(ChannelScreenViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChannelScreenViewModelBuilder toBuilder() =>
      new ChannelScreenViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChannelScreenViewModel &&
        curChannel == other.curChannel &&
        userList == other.userList &&
        newInvitation == other.newInvitation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, curChannel.hashCode), userList.hashCode),
        newInvitation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ChannelScreenViewModel')
          ..add('curChannel', curChannel)
          ..add('userList', userList)
          ..add('newInvitation', newInvitation))
        .toString();
  }
}

class ChannelScreenViewModelBuilder
    implements Builder<ChannelScreenViewModel, ChannelScreenViewModelBuilder> {
  _$ChannelScreenViewModel _$v;

  ChannelBuilder _curChannel;
  ChannelBuilder get curChannel => _$this._curChannel ??= new ChannelBuilder();
  set curChannel(ChannelBuilder curChannel) => _$this._curChannel = curChannel;

  ListBuilder<User> _userList;
  ListBuilder<User> get userList =>
      _$this._userList ??= new ListBuilder<User>();
  set userList(ListBuilder<User> userList) => _$this._userList = userList;

  ListBuilder<User> _newInvitation;
  ListBuilder<User> get newInvitation =>
      _$this._newInvitation ??= new ListBuilder<User>();
  set newInvitation(ListBuilder<User> newInvitation) =>
      _$this._newInvitation = newInvitation;

  ChannelScreenViewModelBuilder();

  ChannelScreenViewModelBuilder get _$this {
    if (_$v != null) {
      _curChannel = _$v.curChannel?.toBuilder();
      _userList = _$v.userList?.toBuilder();
      _newInvitation = _$v.newInvitation?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChannelScreenViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ChannelScreenViewModel;
  }

  @override
  void update(void Function(ChannelScreenViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ChannelScreenViewModel build() {
    _$ChannelScreenViewModel _$result;
    try {
      _$result = _$v ??
          new _$ChannelScreenViewModel._(
              curChannel: curChannel.build(),
              userList: _userList?.build(),
              newInvitation: _newInvitation?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'curChannel';
        curChannel.build();
        _$failedField = 'userList';
        _userList?.build();
        _$failedField = 'newInvitation';
        _newInvitation?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ChannelScreenViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
