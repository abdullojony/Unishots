// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_models.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatModel> _$chatModelSerializer = new _$ChatModelSerializer();
Serializer<MessageModel> _$messageModelSerializer =
    new _$MessageModelSerializer();

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
      'unreadCount',
      serializers.serialize(object.unreadCount,
          specifiedType: const FullType(int)),
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
        case 'unreadCount':
          result.unreadCount = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$MessageModelSerializer implements StructuredSerializer<MessageModel> {
  @override
  final Iterable<Type> types = const [MessageModel, _$MessageModel];
  @override
  final String wireName = 'MessageModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, MessageModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'messageId',
      serializers.serialize(object.messageId,
          specifiedType: const FullType(String)),
      'senderId',
      serializers.serialize(object.senderId,
          specifiedType: const FullType(String)),
      'receiverId',
      serializers.serialize(object.receiverId,
          specifiedType: const FullType(String)),
      'content',
      serializers.serialize(object.content,
          specifiedType: const FullType(String)),
      'userImage',
      serializers.serialize(object.userImage,
          specifiedType: const FullType(String)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'created',
      serializers.serialize(object.created,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  MessageModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MessageModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'messageId':
          result.messageId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'senderId':
          result.senderId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'receiverId':
          result.receiverId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'userImage':
          result.userImage = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'created':
          result.created = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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
  final int unreadCount;

  factory _$ChatModel([void Function(ChatModelBuilder)? updates]) =>
      (new ChatModelBuilder()..update(updates))._build();

  _$ChatModel._(
      {required this.chatId,
      required this.username,
      required this.profileImageUrl,
      required this.unreadCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(chatId, r'ChatModel', 'chatId');
    BuiltValueNullFieldError.checkNotNull(username, r'ChatModel', 'username');
    BuiltValueNullFieldError.checkNotNull(
        profileImageUrl, r'ChatModel', 'profileImageUrl');
    BuiltValueNullFieldError.checkNotNull(
        unreadCount, r'ChatModel', 'unreadCount');
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
        unreadCount == other.unreadCount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, chatId.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, profileImageUrl.hashCode);
    _$hash = $jc(_$hash, unreadCount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatModel')
          ..add('chatId', chatId)
          ..add('username', username)
          ..add('profileImageUrl', profileImageUrl)
          ..add('unreadCount', unreadCount))
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

  int? _unreadCount;
  int? get unreadCount => _$this._unreadCount;
  set unreadCount(int? unreadCount) => _$this._unreadCount = unreadCount;

  ChatModelBuilder();

  ChatModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _chatId = $v.chatId;
      _username = $v.username;
      _profileImageUrl = $v.profileImageUrl;
      _unreadCount = $v.unreadCount;
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
    final _$result = _$v ??
        new _$ChatModel._(
            chatId: BuiltValueNullFieldError.checkNotNull(
                chatId, r'ChatModel', 'chatId'),
            username: BuiltValueNullFieldError.checkNotNull(
                username, r'ChatModel', 'username'),
            profileImageUrl: BuiltValueNullFieldError.checkNotNull(
                profileImageUrl, r'ChatModel', 'profileImageUrl'),
            unreadCount: BuiltValueNullFieldError.checkNotNull(
                unreadCount, r'ChatModel', 'unreadCount'));
    replace(_$result);
    return _$result;
  }
}

class _$MessageModel extends MessageModel {
  @override
  final String messageId;
  @override
  final String senderId;
  @override
  final String receiverId;
  @override
  final String content;
  @override
  final String userImage;
  @override
  final String username;
  @override
  final String created;

  factory _$MessageModel([void Function(MessageModelBuilder)? updates]) =>
      (new MessageModelBuilder()..update(updates))._build();

  _$MessageModel._(
      {required this.messageId,
      required this.senderId,
      required this.receiverId,
      required this.content,
      required this.userImage,
      required this.username,
      required this.created})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        messageId, r'MessageModel', 'messageId');
    BuiltValueNullFieldError.checkNotNull(
        senderId, r'MessageModel', 'senderId');
    BuiltValueNullFieldError.checkNotNull(
        receiverId, r'MessageModel', 'receiverId');
    BuiltValueNullFieldError.checkNotNull(content, r'MessageModel', 'content');
    BuiltValueNullFieldError.checkNotNull(
        userImage, r'MessageModel', 'userImage');
    BuiltValueNullFieldError.checkNotNull(
        username, r'MessageModel', 'username');
    BuiltValueNullFieldError.checkNotNull(created, r'MessageModel', 'created');
  }

  @override
  MessageModel rebuild(void Function(MessageModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageModelBuilder toBuilder() => new MessageModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageModel &&
        messageId == other.messageId &&
        senderId == other.senderId &&
        receiverId == other.receiverId &&
        content == other.content &&
        userImage == other.userImage &&
        username == other.username &&
        created == other.created;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, messageId.hashCode);
    _$hash = $jc(_$hash, senderId.hashCode);
    _$hash = $jc(_$hash, receiverId.hashCode);
    _$hash = $jc(_$hash, content.hashCode);
    _$hash = $jc(_$hash, userImage.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, created.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MessageModel')
          ..add('messageId', messageId)
          ..add('senderId', senderId)
          ..add('receiverId', receiverId)
          ..add('content', content)
          ..add('userImage', userImage)
          ..add('username', username)
          ..add('created', created))
        .toString();
  }
}

class MessageModelBuilder
    implements Builder<MessageModel, MessageModelBuilder> {
  _$MessageModel? _$v;

  String? _messageId;
  String? get messageId => _$this._messageId;
  set messageId(String? messageId) => _$this._messageId = messageId;

  String? _senderId;
  String? get senderId => _$this._senderId;
  set senderId(String? senderId) => _$this._senderId = senderId;

  String? _receiverId;
  String? get receiverId => _$this._receiverId;
  set receiverId(String? receiverId) => _$this._receiverId = receiverId;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  String? _userImage;
  String? get userImage => _$this._userImage;
  set userImage(String? userImage) => _$this._userImage = userImage;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _created;
  String? get created => _$this._created;
  set created(String? created) => _$this._created = created;

  MessageModelBuilder();

  MessageModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _messageId = $v.messageId;
      _senderId = $v.senderId;
      _receiverId = $v.receiverId;
      _content = $v.content;
      _userImage = $v.userImage;
      _username = $v.username;
      _created = $v.created;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessageModel;
  }

  @override
  void update(void Function(MessageModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MessageModel build() => _build();

  _$MessageModel _build() {
    final _$result = _$v ??
        new _$MessageModel._(
            messageId: BuiltValueNullFieldError.checkNotNull(
                messageId, r'MessageModel', 'messageId'),
            senderId: BuiltValueNullFieldError.checkNotNull(
                senderId, r'MessageModel', 'senderId'),
            receiverId: BuiltValueNullFieldError.checkNotNull(
                receiverId, r'MessageModel', 'receiverId'),
            content: BuiltValueNullFieldError.checkNotNull(
                content, r'MessageModel', 'content'),
            userImage: BuiltValueNullFieldError.checkNotNull(
                userImage, r'MessageModel', 'userImage'),
            username: BuiltValueNullFieldError.checkNotNull(
                username, r'MessageModel', 'username'),
            created: BuiltValueNullFieldError.checkNotNull(
                created, r'MessageModel', 'created'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
