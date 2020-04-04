// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_view.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserScreenViewModel extends UserScreenViewModel {
  @override
  final User user;
  @override
  final void Function(String Status) submitStatus;
  @override
  final void Function(DateTime birthday) submitBirthday;
  @override
  final void Function(int gender) submitGender;
  @override
  final void Function(String name) submitName;
  @override
  final void Function(String location) submitLocation;

  factory _$UserScreenViewModel(
          [void Function(UserScreenViewModelBuilder) updates]) =>
      (new UserScreenViewModelBuilder()..update(updates)).build();

  _$UserScreenViewModel._(
      {this.user,
      this.submitStatus,
      this.submitBirthday,
      this.submitGender,
      this.submitName,
      this.submitLocation})
      : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('UserScreenViewModel', 'user');
    }
    if (submitStatus == null) {
      throw new BuiltValueNullFieldError('UserScreenViewModel', 'submitStatus');
    }
    if (submitBirthday == null) {
      throw new BuiltValueNullFieldError(
          'UserScreenViewModel', 'submitBirthday');
    }
    if (submitGender == null) {
      throw new BuiltValueNullFieldError('UserScreenViewModel', 'submitGender');
    }
    if (submitName == null) {
      throw new BuiltValueNullFieldError('UserScreenViewModel', 'submitName');
    }
    if (submitLocation == null) {
      throw new BuiltValueNullFieldError(
          'UserScreenViewModel', 'submitLocation');
    }
  }

  @override
  UserScreenViewModel rebuild(
          void Function(UserScreenViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserScreenViewModelBuilder toBuilder() =>
      new UserScreenViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserScreenViewModel && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserScreenViewModel')
          ..add('user', user)
          ..add('submitStatus', submitStatus)
          ..add('submitBirthday', submitBirthday)
          ..add('submitGender', submitGender)
          ..add('submitName', submitName)
          ..add('submitLocation', submitLocation))
        .toString();
  }
}

class UserScreenViewModelBuilder
    implements Builder<UserScreenViewModel, UserScreenViewModelBuilder> {
  _$UserScreenViewModel _$v;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  void Function(String Status) _submitStatus;
  void Function(String Status) get submitStatus => _$this._submitStatus;
  set submitStatus(void Function(String Status) submitStatus) =>
      _$this._submitStatus = submitStatus;

  void Function(DateTime birthday) _submitBirthday;
  void Function(DateTime birthday) get submitBirthday => _$this._submitBirthday;
  set submitBirthday(void Function(DateTime birthday) submitBirthday) =>
      _$this._submitBirthday = submitBirthday;

  void Function(int gender) _submitGender;
  void Function(int gender) get submitGender => _$this._submitGender;
  set submitGender(void Function(int gender) submitGender) =>
      _$this._submitGender = submitGender;

  void Function(String name) _submitName;
  void Function(String name) get submitName => _$this._submitName;
  set submitName(void Function(String name) submitName) =>
      _$this._submitName = submitName;

  void Function(String location) _submitLocation;
  void Function(String location) get submitLocation => _$this._submitLocation;
  set submitLocation(void Function(String location) submitLocation) =>
      _$this._submitLocation = submitLocation;

  UserScreenViewModelBuilder();

  UserScreenViewModelBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user?.toBuilder();
      _submitStatus = _$v.submitStatus;
      _submitBirthday = _$v.submitBirthday;
      _submitGender = _$v.submitGender;
      _submitName = _$v.submitName;
      _submitLocation = _$v.submitLocation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserScreenViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserScreenViewModel;
  }

  @override
  void update(void Function(UserScreenViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserScreenViewModel build() {
    _$UserScreenViewModel _$result;
    try {
      _$result = _$v ??
          new _$UserScreenViewModel._(
              user: user.build(),
              submitStatus: submitStatus,
              submitBirthday: submitBirthday,
              submitGender: submitGender,
              submitName: submitName,
              submitLocation: submitLocation);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserScreenViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
