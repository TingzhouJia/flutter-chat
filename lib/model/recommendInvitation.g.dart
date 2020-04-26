// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendInvitation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RecoInvi extends RecoInvi {
  @override
  final String imgUrl;
  @override
  final String name;
  @override
  final String targetId;

  factory _$RecoInvi([void Function(RecoInviBuilder) updates]) =>
      (new RecoInviBuilder()..update(updates)).build();

  _$RecoInvi._({this.imgUrl, this.name, this.targetId}) : super._() {
    if (imgUrl == null) {
      throw new BuiltValueNullFieldError('RecoInvi', 'imgUrl');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('RecoInvi', 'name');
    }
    if (targetId == null) {
      throw new BuiltValueNullFieldError('RecoInvi', 'targetId');
    }
  }

  @override
  RecoInvi rebuild(void Function(RecoInviBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecoInviBuilder toBuilder() => new RecoInviBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecoInvi &&
        imgUrl == other.imgUrl &&
        name == other.name &&
        targetId == other.targetId;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, imgUrl.hashCode), name.hashCode), targetId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RecoInvi')
          ..add('imgUrl', imgUrl)
          ..add('name', name)
          ..add('targetId', targetId))
        .toString();
  }
}

class RecoInviBuilder implements Builder<RecoInvi, RecoInviBuilder> {
  _$RecoInvi _$v;

  String _imgUrl;
  String get imgUrl => _$this._imgUrl;
  set imgUrl(String imgUrl) => _$this._imgUrl = imgUrl;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _targetId;
  String get targetId => _$this._targetId;
  set targetId(String targetId) => _$this._targetId = targetId;

  RecoInviBuilder();

  RecoInviBuilder get _$this {
    if (_$v != null) {
      _imgUrl = _$v.imgUrl;
      _name = _$v.name;
      _targetId = _$v.targetId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecoInvi other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RecoInvi;
  }

  @override
  void update(void Function(RecoInviBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RecoInvi build() {
    final _$result =
        _$v ?? new _$RecoInvi._(imgUrl: imgUrl, name: name, targetId: targetId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
