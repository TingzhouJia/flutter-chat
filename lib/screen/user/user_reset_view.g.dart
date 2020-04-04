// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reset_view.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserResetViewModel extends UserResetViewModel {
  @override
  final void Function(String status) submitStatus;
  @override
  final void Function(DateTime birthday) submitBirthday;
  @override
  final void Function(int gender) submitGender;
  @override
  final void Function(String name) submitName;
  @override
  final void Function(String location) submitLocation;

  factory _$UserResetViewModel(
          [void Function(UserResetViewModelBuilder) updates]) =>
      (new UserResetViewModelBuilder()..update(updates)).build();

  _$UserResetViewModel._(
      {this.submitStatus,
      this.submitBirthday,
      this.submitGender,
      this.submitName,
      this.submitLocation})
      : super._() {
    if (submitStatus == null) {
      throw new BuiltValueNullFieldError('UserResetViewModel', 'submitStatus');
    }
    if (submitBirthday == null) {
      throw new BuiltValueNullFieldError(
          'UserResetViewModel', 'submitBirthday');
    }
    if (submitGender == null) {
      throw new BuiltValueNullFieldError('UserResetViewModel', 'submitGender');
    }
    if (submitName == null) {
      throw new BuiltValueNullFieldError('UserResetViewModel', 'submitName');
    }
    if (submitLocation == null) {
      throw new BuiltValueNullFieldError(
          'UserResetViewModel', 'submitLocation');
    }
  }

  @override
  UserResetViewModel rebuild(
          void Function(UserResetViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserResetViewModelBuilder toBuilder() =>
      new UserResetViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is UserResetViewModel &&
        submitStatus == _$dynamicOther.submitStatus &&
        submitBirthday == _$dynamicOther.submitBirthday &&
        submitGender == _$dynamicOther.submitGender &&
        submitName == _$dynamicOther.submitName &&
        submitLocation == _$dynamicOther.submitLocation;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, submitStatus.hashCode), submitBirthday.hashCode),
                submitGender.hashCode),
            submitName.hashCode),
        submitLocation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserResetViewModel')
          ..add('submitStatus', submitStatus)
          ..add('submitBirthday', submitBirthday)
          ..add('submitGender', submitGender)
          ..add('submitName', submitName)
          ..add('submitLocation', submitLocation))
        .toString();
  }
}

class UserResetViewModelBuilder
    implements Builder<UserResetViewModel, UserResetViewModelBuilder> {
  _$UserResetViewModel _$v;

  void Function(String status) _submitStatus;
  void Function(String status) get submitStatus => _$this._submitStatus;
  set submitStatus(void Function(String status) submitStatus) =>
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

  UserResetViewModelBuilder();

  UserResetViewModelBuilder get _$this {
    if (_$v != null) {
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
  void replace(UserResetViewModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserResetViewModel;
  }

  @override
  void update(void Function(UserResetViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserResetViewModel build() {
    final _$result = _$v ??
        new _$UserResetViewModel._(
            submitStatus: submitStatus,
            submitBirthday: submitBirthday,
            submitGender: submitGender,
            submitName: submitName,
            submitLocation: submitLocation);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
