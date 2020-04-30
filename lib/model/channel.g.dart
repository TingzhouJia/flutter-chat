// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Channel extends Channel {
  @override
  final String id;
  @override
  final String authorId;
  @override
  final String name;
  @override
  final String backgroudImg;
  @override
  final String description;
  @override
  final ChannelVisibility visibility;
  @override
  final String hexColor;
  @override
  final List<String> tags;
  @override
  final bool marked;
  @override
  final bool received;
  @override
  final DateTime startDate;

  factory _$Channel([void Function(ChannelBuilder) updates]) =>
      (new ChannelBuilder()..update(updates)).build();

  _$Channel._(
      {this.id,
      this.authorId,
      this.name,
      this.backgroudImg,
      this.description,
      this.visibility,
      this.hexColor,
      this.tags,
      this.marked,
      this.received,
      this.startDate})
      : super._() {
    if (authorId == null) {
      throw new BuiltValueNullFieldError('Channel', 'authorId');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Channel', 'name');
    }
    if (visibility == null) {
      throw new BuiltValueNullFieldError('Channel', 'visibility');
    }
    if (hexColor == null) {
      throw new BuiltValueNullFieldError('Channel', 'hexColor');
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
        authorId == other.authorId &&
        name == other.name &&
        backgroudImg == other.backgroudImg &&
        description == other.description &&
        visibility == other.visibility &&
        hexColor == other.hexColor &&
        tags == other.tags &&
        marked == other.marked &&
        received == other.received &&
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
                                $jc(
                                    $jc(
                                        $jc($jc(0, id.hashCode),
                                            authorId.hashCode),
                                        name.hashCode),
                                    backgroudImg.hashCode),
                                description.hashCode),
                            visibility.hashCode),
                        hexColor.hashCode),
                    tags.hashCode),
                marked.hashCode),
            received.hashCode),
        startDate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Channel')
          ..add('id', id)
          ..add('authorId', authorId)
          ..add('name', name)
          ..add('backgroudImg', backgroudImg)
          ..add('description', description)
          ..add('visibility', visibility)
          ..add('hexColor', hexColor)
          ..add('tags', tags)
          ..add('marked', marked)
          ..add('received', received)
          ..add('startDate', startDate))
        .toString();
  }
}

class ChannelBuilder implements Builder<Channel, ChannelBuilder> {
  _$Channel _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _authorId;
  String get authorId => _$this._authorId;
  set authorId(String authorId) => _$this._authorId = authorId;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _backgroudImg;
  String get backgroudImg => _$this._backgroudImg;
  set backgroudImg(String backgroudImg) => _$this._backgroudImg = backgroudImg;

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

  List<String> _tags;
  List<String> get tags => _$this._tags;
  set tags(List<String> tags) => _$this._tags = tags;

  bool _marked;
  bool get marked => _$this._marked;
  set marked(bool marked) => _$this._marked = marked;

  bool _received;
  bool get received => _$this._received;
  set received(bool received) => _$this._received = received;

  DateTime _startDate;
  DateTime get startDate => _$this._startDate;
  set startDate(DateTime startDate) => _$this._startDate = startDate;

  ChannelBuilder();

  ChannelBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _authorId = _$v.authorId;
      _name = _$v.name;
      _backgroudImg = _$v.backgroudImg;
      _description = _$v.description;
      _visibility = _$v.visibility;
      _hexColor = _$v.hexColor;
      _tags = _$v.tags;
      _marked = _$v.marked;
      _received = _$v.received;
      _startDate = _$v.startDate;
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
            authorId: authorId,
            name: name,
            backgroudImg: backgroudImg,
            description: description,
            visibility: visibility,
            hexColor: hexColor,
            tags: tags,
            marked: marked,
            received: received,
            startDate: startDate);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
