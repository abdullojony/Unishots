// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostModel> _$postModelSerializer = new _$PostModelSerializer();

class _$PostModelSerializer implements StructuredSerializer<PostModel> {
  @override
  final Iterable<Type> types = const [PostModel, _$PostModel];
  @override
  final String wireName = 'PostModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'postId',
      serializers.serialize(object.postId,
          specifiedType: const FullType(String)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'profileImageUrl',
      serializers.serialize(object.profileImageUrl,
          specifiedType: const FullType(String)),
      'postUrl',
      serializers.serialize(object.postUrl,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'publishedDate',
      serializers.serialize(object.publishedDate,
          specifiedType: const FullType(String)),
      'comments',
      serializers.serialize(object.comments,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'likes',
      serializers.serialize(object.likes,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  PostModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'postId':
          result.postId = serializers.deserialize(value,
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
        case 'postUrl':
          result.postUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'publishedDate':
          result.publishedDate = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'comments':
          result.comments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'likes':
          result.likes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PostModel extends PostModel {
  @override
  final String userId;
  @override
  final String postId;
  @override
  final String username;
  @override
  final String profileImageUrl;
  @override
  final String postUrl;
  @override
  final String description;
  @override
  final String publishedDate;
  @override
  final BuiltList<String> comments;
  @override
  final BuiltList<String> likes;

  factory _$PostModel([void Function(PostModelBuilder)? updates]) =>
      (new PostModelBuilder()..update(updates))._build();

  _$PostModel._(
      {required this.userId,
      required this.postId,
      required this.username,
      required this.profileImageUrl,
      required this.postUrl,
      required this.description,
      required this.publishedDate,
      required this.comments,
      required this.likes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, r'PostModel', 'userId');
    BuiltValueNullFieldError.checkNotNull(postId, r'PostModel', 'postId');
    BuiltValueNullFieldError.checkNotNull(username, r'PostModel', 'username');
    BuiltValueNullFieldError.checkNotNull(
        profileImageUrl, r'PostModel', 'profileImageUrl');
    BuiltValueNullFieldError.checkNotNull(postUrl, r'PostModel', 'postUrl');
    BuiltValueNullFieldError.checkNotNull(
        description, r'PostModel', 'description');
    BuiltValueNullFieldError.checkNotNull(
        publishedDate, r'PostModel', 'publishedDate');
    BuiltValueNullFieldError.checkNotNull(comments, r'PostModel', 'comments');
    BuiltValueNullFieldError.checkNotNull(likes, r'PostModel', 'likes');
  }

  @override
  PostModel rebuild(void Function(PostModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostModelBuilder toBuilder() => new PostModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostModel &&
        userId == other.userId &&
        postId == other.postId &&
        username == other.username &&
        profileImageUrl == other.profileImageUrl &&
        postUrl == other.postUrl &&
        description == other.description &&
        publishedDate == other.publishedDate &&
        comments == other.comments &&
        likes == other.likes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, postId.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, profileImageUrl.hashCode);
    _$hash = $jc(_$hash, postUrl.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, publishedDate.hashCode);
    _$hash = $jc(_$hash, comments.hashCode);
    _$hash = $jc(_$hash, likes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostModel')
          ..add('userId', userId)
          ..add('postId', postId)
          ..add('username', username)
          ..add('profileImageUrl', profileImageUrl)
          ..add('postUrl', postUrl)
          ..add('description', description)
          ..add('publishedDate', publishedDate)
          ..add('comments', comments)
          ..add('likes', likes))
        .toString();
  }
}

class PostModelBuilder implements Builder<PostModel, PostModelBuilder> {
  _$PostModel? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _postId;
  String? get postId => _$this._postId;
  set postId(String? postId) => _$this._postId = postId;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _profileImageUrl;
  String? get profileImageUrl => _$this._profileImageUrl;
  set profileImageUrl(String? profileImageUrl) =>
      _$this._profileImageUrl = profileImageUrl;

  String? _postUrl;
  String? get postUrl => _$this._postUrl;
  set postUrl(String? postUrl) => _$this._postUrl = postUrl;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _publishedDate;
  String? get publishedDate => _$this._publishedDate;
  set publishedDate(String? publishedDate) =>
      _$this._publishedDate = publishedDate;

  ListBuilder<String>? _comments;
  ListBuilder<String> get comments =>
      _$this._comments ??= new ListBuilder<String>();
  set comments(ListBuilder<String>? comments) => _$this._comments = comments;

  ListBuilder<String>? _likes;
  ListBuilder<String> get likes => _$this._likes ??= new ListBuilder<String>();
  set likes(ListBuilder<String>? likes) => _$this._likes = likes;

  PostModelBuilder();

  PostModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _postId = $v.postId;
      _username = $v.username;
      _profileImageUrl = $v.profileImageUrl;
      _postUrl = $v.postUrl;
      _description = $v.description;
      _publishedDate = $v.publishedDate;
      _comments = $v.comments.toBuilder();
      _likes = $v.likes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostModel;
  }

  @override
  void update(void Function(PostModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostModel build() => _build();

  _$PostModel _build() {
    _$PostModel _$result;
    try {
      _$result = _$v ??
          new _$PostModel._(
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, r'PostModel', 'userId'),
              postId: BuiltValueNullFieldError.checkNotNull(
                  postId, r'PostModel', 'postId'),
              username: BuiltValueNullFieldError.checkNotNull(
                  username, r'PostModel', 'username'),
              profileImageUrl: BuiltValueNullFieldError.checkNotNull(
                  profileImageUrl, r'PostModel', 'profileImageUrl'),
              postUrl: BuiltValueNullFieldError.checkNotNull(
                  postUrl, r'PostModel', 'postUrl'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'PostModel', 'description'),
              publishedDate: BuiltValueNullFieldError.checkNotNull(
                  publishedDate, r'PostModel', 'publishedDate'),
              comments: comments.build(),
              likes: likes.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'comments';
        comments.build();
        _$failedField = 'likes';
        likes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PostModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
