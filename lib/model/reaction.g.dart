// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Reaction extends Reaction {
  @override
  final String emoji;
  @override
  final String userId;
  @override
  final String messageId;

  factory _$Reaction([void Function(ReactionBuilder) updates]) =>
      (new ReactionBuilder()..update(updates)).build();

  _$Reaction._({this.emoji, this.userId, this.messageId}) : super._() {
    if (emoji == null) {
      throw new BuiltValueNullFieldError('Reaction', 'emoji');
    }
    if (userId == null) {
      throw new BuiltValueNullFieldError('Reaction', 'userId');
    }
    if (messageId == null) {
      throw new BuiltValueNullFieldError('Reaction', 'messageId');
    }
  }

  @override
  Reaction rebuild(void Function(ReactionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReactionBuilder toBuilder() => new ReactionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reaction &&
        emoji == other.emoji &&
        userId == other.userId &&
        messageId == other.messageId;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, emoji.hashCode), userId.hashCode), messageId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Reaction')
          ..add('emoji', emoji)
          ..add('userId', userId)
          ..add('messageId', messageId))
        .toString();
  }
}

class ReactionBuilder implements Builder<Reaction, ReactionBuilder> {
  _$Reaction _$v;

  String _emoji;
  String get emoji => _$this._emoji;
  set emoji(String emoji) => _$this._emoji = emoji;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  String _messageId;
  String get messageId => _$this._messageId;
  set messageId(String messageId) => _$this._messageId = messageId;

  ReactionBuilder();

  ReactionBuilder get _$this {
    if (_$v != null) {
      _emoji = _$v.emoji;
      _userId = _$v.userId;
      _messageId = _$v.messageId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Reaction other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Reaction;
  }

  @override
  void update(void Function(ReactionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Reaction build() {
    final _$result = _$v ??
        new _$Reaction._(emoji: emoji, userId: userId, messageId: messageId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
