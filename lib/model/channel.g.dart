// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Channel extends Channel {
  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final ChannelVisibility visibility;
  @override
  final String hexColor;
  @override
  final bool marked;
  @override
  final bool received;

  factory _$Channel([void Function(ChannelBuilder) updates]) =>
      (new ChannelBuilder()..update(updates)).build();

  _$Channel._(
      {this.id,
      this.name,
      this.description,
      this.visibility,
      this.hexColor,
      this.marked,
      this.received})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Channel', 'name');
    }
    if (visibility == null) {
      throw new BuiltValueNullFieldError('Channel', 'visibility');
    }
    if (hexColor == null) {
      throw new BuiltValueNullFieldError('Channel', 'hexColor');
    }
    if (marked == null) {
      throw new BuiltValueNullFieldError('Channel', 'marked');
    }
    if (received == null) {
      throw new BuiltValueNullFieldError('Channel', 'received');
    }
  }

  @override
  Channel rebuild(void Function(ChannelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChannelBuilder toBuilder() => new ChannelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Channel &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        visibility == other.visibility &&
        hexColor == other.hexColor &&
        marked == other.marked &&
        received == other.received;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), name.hashCode),
                        description.hashCode),
                    visibility.hashCode),
                hexColor.hashCode),
            marked.hashCode),
        received.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Channel')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('visibility', visibility)
          ..add('hexColor', hexColor)
          ..add('marked', marked)
          ..add('received', received))
        .toString();
  }
}

class ChannelBuilder implements Builder<Channel, ChannelBuilder> {
  _$Channel _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  ChannelVisibility _visibility;
  ChannelVisibility get visibility => _$this._visibility;
  set visibility(ChannelVisibility visibility) =>
      _$this._visibility = visibility;

  String _hexColor;
  String get hexColor => _$this._hexColor;
  set hexColor(String hexColor) => _$this._hexColor = hexColor;

  bool _marked;
  bool get marked => _$this._marked;
  set marked(bool marked) => _$this._marked = marked;

  bool _received;
  bool get received => _$this._received;
  set received(bool received) => _$this._received = received;

  ChannelBuilder();

  ChannelBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _description = _$v.description;
      _visibility = _$v.visibility;
      _hexColor = _$v.hexColor;
      _marked = _$v.marked;
      _received = _$v.received;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Channel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Channel;
  }

  @override
  void update(void Function(ChannelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Channel build() {
    final _$result = _$v ??
        new _$Channel._(
            id: id,
            name: name,
            description: description,
            visibility: visibility,
            hexColor: hexColor,
            marked: marked,
            received: received);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
