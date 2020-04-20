// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HomeScreenViewModel extends HomeScreenViewModel {
  @override
  final User user;
  @override
  final BuiltList<User> favorContact;
  @override
  final int messageOnScreen;

  factory _$HomeScreenViewModel(
          [void Function(HomeScreenViewModelBuilder) updates]) =>
      (new HomeScreenViewModelBuilder()..update(updates)).build();

  _$HomeScreenViewModel._({this.user, this.favorContact, this.messageOnScreen})
      : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('HomeScreenViewModel', 'user');
    }
    if (favorContact == null) {
      throw new BuiltValueNullFieldError('HomeScreenViewModel', 'favorContact');
    }
    if (messageOnScreen == null) {
      throw new BuiltValueNullFieldError(
          'HomeScreenViewModel', 'messageOnScreen');
    }
  }

  @override
  HomeScreenViewModel rebuild(
          void Function(HomeScreenViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeScreenViewModelBuilder toBuilder() =>
      new HomeScreenViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeScreenViewModel &&
        user == other.user &&
        favorContact == other.favorContact &&
        messageOnScreen == other.messageOnScreen;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, user.hashCode), favorContact.hashCode),
        messageOnScreen.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HomeScreenViewModel')
          ..add('user', user)
          ..add('favorContact', favorContact)
          ..add('messageOnScreen', messageOnScreen))
        .toString();
  }
}

class HomeScreenViewModelBuilder
    implements Builder<HomeScreenViewModel, HomeScreenViewModelBuilder> {
  _$HomeScreenViewModel _$v;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  ListBuilder<User> _favorContact;
  ListBuilder<User> get favorContact =>
      _$this._favorContact ??= new ListBuilder<User>();
  set favorContact(ListBuilder<User> favorContact) =>
      _$this._favorContact = favorContact;

  int _messageOnScreen;
  int get messageOnScreen => _$this._messageOnScreen;
  set messageOnScreen(int messageOnScreen) =>
      _$this._messageOnScreen = messageOnScreen;

  HomeScreenViewModelBuilder();

  HomeScreenViewModelBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _favorContact = _$v.favorContact?.toBuilder();
      _messageOnScreen = _$v.messageOnScreen;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeScreenViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HomeScreenViewModel;
  }

  @override
  void update(void Function(HomeScreenViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HomeScreenViewModel build() {
    _$HomeScreenViewModel _$result;
    try {
      _$result = _$v ??
          new _$HomeScreenViewModel._(
              user: user.build(),
              favorContact: favorContact.build(),
              messageOnScreen: messageOnScreen);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
        _$failedField = 'favorContact';
        favorContact.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HomeScreenViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
