// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_models.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatModel> _$chatModelSerializer = new _$ChatModelSerializer();

class _$ChatModelSerializer implements StructuredSerializer<ChatModel> {
  @override
  final Iterable<Type> types = const [ChatModel, _$ChatModel];
  @override
  final String wireName = 'ChatModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChatModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'chatId',
      serializers.serialize(object.chatId,
          specifiedType: const FullType(String)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'profileImageUrl',
      serializers.serialize(object.profileImageUrl,
          specifiedType: const FullType(String)),
      'comments',
      serializers.serialize(object.comments,
          specifiedType:
              const FullType(BuiltList, const [const FullType(MessageEntity)])),
    ];

    return result;
  }

  @override
  ChatModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'chatId':
          result.chatId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'profileImageUrl':
          result.profileImageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'comments':
          result.comments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(MessageEntity)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ChatModel extends ChatModel {
  @override
  final String chatId;
  @override
  final String username;
  @override
  final String profileImageUrl;
  @override
  final BuiltList<MessageEntity> comments;

  factory _$ChatModel([void Function(ChatModelBuilder)? updates]) =>
      (new ChatModelBuilder()..update(updates))._build();

  _$ChatModel._(
      {required this.chatId,
      required this.username,
      required this.profileImageUrl,
      required this.comments})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(chatId, r'ChatModel', 'chatId');
    BuiltValueNullFieldError.checkNotNull(username, r'ChatModel', 'username');
    BuiltValueNullFieldError.checkNotNull(
        profileImageUrl, r'ChatModel', 'profileImageUrl');
    BuiltValueNullFieldError.checkNotNull(comments, r'ChatModel', 'comments');
  }

  @override
  ChatModel rebuild(void Function(ChatModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatModelBuilder toBuilder() => new ChatModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatModel &&
        chatId == other.chatId &&
        username == other.username &&
        profileImageUrl == other.profileImageUrl &&
        comments == other.comments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, chatId.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, profileImageUrl.hashCode);
    _$hash = $jc(_$hash, comments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatModel')
          ..add('chatId', chatId)
          ..add('username', username)
          ..add('profileImageUrl', profileImageUrl)
          ..add('comments', comments))
        .toString();
  }
}

class ChatModelBuilder implements Builder<ChatModel, ChatModelBuilder> {
  _$ChatModel? _$v;

  String? _chatId;
  String? get chatId => _$this._chatId;
  set chatId(String? chatId) => _$this._chatId = chatId;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _profileImageUrl;
  String? get profileImageUrl => _$this._profileImageUrl;
  set profileImageUrl(String? profileImageUrl) =>
      _$this._profileImageUrl = profileImageUrl;

  ListBuilder<MessageEntity>? _comments;
  ListBuilder<MessageEntity> get comments =>
      _$this._comments ??= new ListBuilder<MessageEntity>();
  set comments(ListBuilder<MessageEntity>? comments) =>
      _$this._comments = comments;

  ChatModelBuilder();

  ChatModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _chatId = $v.chatId;
      _username = $v.username;
      _profileImageUrl = $v.profileImageUrl;
      _comments = $v.comments.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatModel;
  }

  @override
  void update(void Function(ChatModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatModel build() => _build();

  _$ChatModel _build() {
    _$ChatModel _$result;
    try {
      _$result = _$v ??
          new _$ChatModel._(
              chatId: BuiltValueNullFieldError.checkNotNull(
                  chatId, r'ChatModel', 'chatId'),
              username: BuiltValueNullFieldError.checkNotNull(
                  username, r'ChatModel', 'username'),
              profileImageUrl: BuiltValueNullFieldError.checkNotNull(
                  profileImageUrl, r'ChatModel', 'profileImageUrl'),
              comments: comments.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'comments';
        comments.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ChatModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
