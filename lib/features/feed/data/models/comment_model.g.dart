// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommentModel> _$commentModelSerializer =
    new _$CommentModelSerializer();

class _$CommentModelSerializer implements StructuredSerializer<CommentModel> {
  @override
  final Iterable<Type> types = const [CommentModel, _$CommentModel];
  @override
  final String wireName = 'CommentModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, CommentModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'postId',
      serializers.serialize(object.postId,
          specifiedType: const FullType(String)),
      'commentId',
      serializers.serialize(object.commentId,
          specifiedType: const FullType(String)),
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'commentText',
      serializers.serialize(object.commentText,
          specifiedType: const FullType(String)),
      'profileImageUrl',
      serializers.serialize(object.profileImageUrl,
          specifiedType: const FullType(String)),
      'publishedDate',
      serializers.serialize(object.publishedDate,
          specifiedType: const FullType(String)),
      'likes',
      serializers.serialize(object.likes,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  CommentModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommentModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'postId':
          result.postId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'commentId':
          result.commentId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'commentText':
          result.commentText = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'profileImageUrl':
          result.profileImageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'publishedDate':
          result.publishedDate = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
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

class _$CommentModel extends CommentModel {
  @override
  final String postId;
  @override
  final String commentId;
  @override
  final String userId;
  @override
  final String username;
  @override
  final String commentText;
  @override
  final String profileImageUrl;
  @override
  final String publishedDate;
  @override
  final BuiltList<String> likes;

  factory _$CommentModel([void Function(CommentModelBuilder)? updates]) =>
      (new CommentModelBuilder()..update(updates))._build();

  _$CommentModel._(
      {required this.postId,
      required this.commentId,
      required this.userId,
      required this.username,
      required this.commentText,
      required this.profileImageUrl,
      required this.publishedDate,
      required this.likes})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(postId, r'CommentModel', 'postId');
    BuiltValueNullFieldError.checkNotNull(
        commentId, r'CommentModel', 'commentId');
    BuiltValueNullFieldError.checkNotNull(userId, r'CommentModel', 'userId');
    BuiltValueNullFieldError.checkNotNull(
        username, r'CommentModel', 'username');
    BuiltValueNullFieldError.checkNotNull(
        commentText, r'CommentModel', 'commentText');
    BuiltValueNullFieldError.checkNotNull(
        profileImageUrl, r'CommentModel', 'profileImageUrl');
    BuiltValueNullFieldError.checkNotNull(
        publishedDate, r'CommentModel', 'publishedDate');
    BuiltValueNullFieldError.checkNotNull(likes, r'CommentModel', 'likes');
  }

  @override
  CommentModel rebuild(void Function(CommentModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommentModelBuilder toBuilder() => new CommentModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommentModel &&
        postId == other.postId &&
        commentId == other.commentId &&
        userId == other.userId &&
        username == other.username &&
        commentText == other.commentText &&
        profileImageUrl == other.profileImageUrl &&
        publishedDate == other.publishedDate &&
        likes == other.likes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, postId.hashCode);
    _$hash = $jc(_$hash, commentId.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, commentText.hashCode);
    _$hash = $jc(_$hash, profileImageUrl.hashCode);
    _$hash = $jc(_$hash, publishedDate.hashCode);
    _$hash = $jc(_$hash, likes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommentModel')
          ..add('postId', postId)
          ..add('commentId', commentId)
          ..add('userId', userId)
          ..add('username', username)
          ..add('commentText', commentText)
          ..add('profileImageUrl', profileImageUrl)
          ..add('publishedDate', publishedDate)
          ..add('likes', likes))
        .toString();
  }
}

class CommentModelBuilder
    implements Builder<CommentModel, CommentModelBuilder> {
  _$CommentModel? _$v;

  String? _postId;
  String? get postId => _$this._postId;
  set postId(String? postId) => _$this._postId = postId;

  String? _commentId;
  String? get commentId => _$this._commentId;
  set commentId(String? commentId) => _$this._commentId = commentId;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _commentText;
  String? get commentText => _$this._commentText;
  set commentText(String? commentText) => _$this._commentText = commentText;

  String? _profileImageUrl;
  String? get profileImageUrl => _$this._profileImageUrl;
  set profileImageUrl(String? profileImageUrl) =>
      _$this._profileImageUrl = profileImageUrl;

  String? _publishedDate;
  String? get publishedDate => _$this._publishedDate;
  set publishedDate(String? publishedDate) =>
      _$this._publishedDate = publishedDate;

  ListBuilder<String>? _likes;
  ListBuilder<String> get likes => _$this._likes ??= new ListBuilder<String>();
  set likes(ListBuilder<String>? likes) => _$this._likes = likes;

  CommentModelBuilder();

  CommentModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _postId = $v.postId;
      _commentId = $v.commentId;
      _userId = $v.userId;
      _username = $v.username;
      _commentText = $v.commentText;
      _profileImageUrl = $v.profileImageUrl;
      _publishedDate = $v.publishedDate;
      _likes = $v.likes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommentModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommentModel;
  }

  @override
  void update(void Function(CommentModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommentModel build() => _build();

  _$CommentModel _build() {
    _$CommentModel _$result;
    try {
      _$result = _$v ??
          new _$CommentModel._(
              postId: BuiltValueNullFieldError.checkNotNull(
                  postId, r'CommentModel', 'postId'),
              commentId: BuiltValueNullFieldError.checkNotNull(
                  commentId, r'CommentModel', 'commentId'),
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, r'CommentModel', 'userId'),
              username: BuiltValueNullFieldError.checkNotNull(
                  username, r'CommentModel', 'username'),
              commentText: BuiltValueNullFieldError.checkNotNull(
                  commentText, r'CommentModel', 'commentText'),
              profileImageUrl: BuiltValueNullFieldError.checkNotNull(
                  profileImageUrl, r'CommentModel', 'profileImageUrl'),
              publishedDate: BuiltValueNullFieldError.checkNotNull(
                  publishedDate, r'CommentModel', 'publishedDate'),
              likes: likes.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'likes';
        likes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CommentModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
