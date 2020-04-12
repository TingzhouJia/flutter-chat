// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recentMessage.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$recentMessage extends recentMessage {
  @override
  final String id;
  @override
  final String authorId;
  @override
  final String imgUrl;
  @override
  final String userName;
  @override
  final String body;
  @override
  final MessageType messageType;
  @override
  final bool pending;
  @override
  final DateTime timestamp;

  factory _$recentMessage([void Function(recentMessageBuilder) updates]) =>
      (new recentMessageBuilder()..update(updates)).build();

  _$recentMessage._(
      {this.id,
      this.authorId,
      this.imgUrl,
      this.userName,
      this.body,
      this.messageType,
      this.pending,
      this.timestamp})
      : super._() {
    if (imgUrl == null) {
      throw new BuiltValueNullFieldError('recentMessage', 'imgUrl');
    }
    if (userName == null) {
      throw new BuiltValueNullFieldError('recentMessage', 'userName');
    }
    if (body == null) {
      throw new BuiltValueNullFieldError('recentMessage', 'body');
    }
    if (messageType == null) {
      throw new BuiltValueNullFieldError('recentMessage', 'messageType');
    }
    if (pending == null) {
      throw new BuiltValueNullFieldError('recentMessage', 'pending');
    }
    if (timestamp == null) {
      throw new BuiltValueNullFieldError('recentMessage', 'timestamp');
    }
  }

  @override
  recentMessage rebuild(void Function(recentMessageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  recentMessageBuilder toBuilder() => new recentMessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is recentMessage &&
        id == other.id &&
        authorId == other.authorId &&
        imgUrl == other.imgUrl &&
        userName == other.userName &&
        body == other.body &&
        messageType == other.messageType &&
        pending == other.pending &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), authorId.hashCode),
                            imgUrl.hashCode),
                        userName.hashCode),
                    body.hashCode),
                messageType.hashCode),
            pending.hashCode),
        timestamp.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('recentMessage')
          ..add('id', id)
          ..add('authorId', authorId)
          ..add('imgUrl', imgUrl)
          ..add('userName', userName)
          ..add('body', body)
          ..add('messageType', messageType)
          ..add('pending', pending)
          ..add('timestamp', timestamp))
        .toString();
  }
}

class recentMessageBuilder
    implements Builder<recentMessage, recentMessageBuilder> {
  _$recentMessage _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _authorId;
  String get authorId => _$this._authorId;
  set authorId(String authorId) => _$this._authorId = authorId;

  String _imgUrl;
  String get imgUrl => _$this._imgUrl;
  set imgUrl(String imgUrl) => _$this._imgUrl = imgUrl;

  String _userName;
  String get userName => _$this._userName;
  set userName(String userName) => _$this._userName = userName;

  String _body;
  String get body => _$this._body;
  set body(String body) => _$this._body = body;

  MessageType _messageType;
  MessageType get messageType => _$this._messageType;
  set messageType(MessageType messageType) => _$this._messageType = messageType;

  bool _pending;
  bool get pending => _$this._pending;
  set pending(bool pending) => _$this._pending = pending;

  DateTime _timestamp;
  DateTime get timestamp => _$this._timestamp;
  set timestamp(DateTime timestamp) => _$this._timestamp = timestamp;

  recentMessageBuilder();

  recentMessageBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _authorId = _$v.authorId;
      _imgUrl = _$v.imgUrl;
      _userName = _$v.userName;
      _body = _$v.body;
      _messageType = _$v.messageType;
      _pending = _$v.pending;
      _timestamp = _$v.timestamp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(recentMessage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$recentMessage;
  }

  @override
  void update(void Function(recentMessageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$recentMessage build() {
    final _$result = _$v ??
        new _$recentMessage._(
            id: id,
            authorId: authorId,
            imgUrl: imgUrl,
            userName: userName,
            body: body,
            messageType: messageType,
            pending: pending,
            timestamp: timestamp);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
