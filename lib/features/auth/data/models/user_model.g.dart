// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserModel> _$userModelSerializer = new _$UserModelSerializer();

class _$UserModelSerializer implements StructuredSerializer<UserModel> {
  @override
  final Iterable<Type> types = const [UserModel, _$UserModel];
  @override
  final String wireName = 'UserModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId,
          specifiedType: const FullType(String)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'profileImage',
      serializers.serialize(object.profileImage,
          specifiedType: const FullType(String)),
      'bio',
      serializers.serialize(object.bio, specifiedType: const FullType(String)),
      'posts',
      serializers.serialize(object.posts,
          specifiedType:
              const FullType(BuiltList, const [const FullType(PostItem)])),
      'savedPosts',
      serializers.serialize(object.savedPosts,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(String)])),
      'followers',
      serializers.serialize(object.followers,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(String)])),
      'following',
      serializers.serialize(object.following,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  UserModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserModelBuilder();

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
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'profileImage':
          result.profileImage = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'posts':
          result.posts.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PostItem)]))!
              as BuiltList<Object?>);
          break;
        case 'savedPosts':
          result.savedPosts.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))!
              as BuiltSet<Object?>);
          break;
        case 'followers':
          result.followers.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))!
              as BuiltSet<Object?>);
          break;
        case 'following':
          result.following.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))!
              as BuiltSet<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$UserModel extends UserModel {
  @override
  final String userId;
  @override
  final String username;
  @override
  final String email;
  @override
  final String profileImage;
  @override
  final String bio;
  @override
  final BuiltList<PostItem> posts;
  @override
  final BuiltSet<String> savedPosts;
  @override
  final BuiltSet<String> followers;
  @override
  final BuiltSet<String> following;

  factory _$UserModel([void Function(UserModelBuilder)? updates]) =>
      (new UserModelBuilder()..update(updates))._build();

  _$UserModel._(
      {required this.userId,
      required this.username,
      required this.email,
      required this.profileImage,
      required this.bio,
      required this.posts,
      required this.savedPosts,
      required this.followers,
      required this.following})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, r'UserModel', 'userId');
    BuiltValueNullFieldError.checkNotNull(username, r'UserModel', 'username');
    BuiltValueNullFieldError.checkNotNull(email, r'UserModel', 'email');
    BuiltValueNullFieldError.checkNotNull(
        profileImage, r'UserModel', 'profileImage');
    BuiltValueNullFieldError.checkNotNull(bio, r'UserModel', 'bio');
    BuiltValueNullFieldError.checkNotNull(posts, r'UserModel', 'posts');
    BuiltValueNullFieldError.checkNotNull(
        savedPosts, r'UserModel', 'savedPosts');
    BuiltValueNullFieldError.checkNotNull(followers, r'UserModel', 'followers');
    BuiltValueNullFieldError.checkNotNull(following, r'UserModel', 'following');
  }

  @override
  UserModel rebuild(void Function(UserModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserModelBuilder toBuilder() => new UserModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserModel &&
        userId == other.userId &&
        username == other.username &&
        email == other.email &&
        profileImage == other.profileImage &&
        bio == other.bio &&
        posts == other.posts &&
        savedPosts == other.savedPosts &&
        followers == other.followers &&
        following == other.following;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, profileImage.hashCode);
    _$hash = $jc(_$hash, bio.hashCode);
    _$hash = $jc(_$hash, posts.hashCode);
    _$hash = $jc(_$hash, savedPosts.hashCode);
    _$hash = $jc(_$hash, followers.hashCode);
    _$hash = $jc(_$hash, following.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserModel')
          ..add('userId', userId)
          ..add('username', username)
          ..add('email', email)
          ..add('profileImage', profileImage)
          ..add('bio', bio)
          ..add('posts', posts)
          ..add('savedPosts', savedPosts)
          ..add('followers', followers)
          ..add('following', following))
        .toString();
  }
}

class UserModelBuilder implements Builder<UserModel, UserModelBuilder> {
  _$UserModel? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _profileImage;
  String? get profileImage => _$this._profileImage;
  set profileImage(String? profileImage) => _$this._profileImage = profileImage;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  ListBuilder<PostItem>? _posts;
  ListBuilder<PostItem> get posts =>
      _$this._posts ??= new ListBuilder<PostItem>();
  set posts(ListBuilder<PostItem>? posts) => _$this._posts = posts;

  SetBuilder<String>? _savedPosts;
  SetBuilder<String> get savedPosts =>
      _$this._savedPosts ??= new SetBuilder<String>();
  set savedPosts(SetBuilder<String>? savedPosts) =>
      _$this._savedPosts = savedPosts;

  SetBuilder<String>? _followers;
  SetBuilder<String> get followers =>
      _$this._followers ??= new SetBuilder<String>();
  set followers(SetBuilder<String>? followers) => _$this._followers = followers;

  SetBuilder<String>? _following;
  SetBuilder<String> get following =>
      _$this._following ??= new SetBuilder<String>();
  set following(SetBuilder<String>? following) => _$this._following = following;

  UserModelBuilder();

  UserModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _username = $v.username;
      _email = $v.email;
      _profileImage = $v.profileImage;
      _bio = $v.bio;
      _posts = $v.posts.toBuilder();
      _savedPosts = $v.savedPosts.toBuilder();
      _followers = $v.followers.toBuilder();
      _following = $v.following.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserModel;
  }

  @override
  void update(void Function(UserModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserModel build() => _build();

  _$UserModel _build() {
    _$UserModel _$result;
    try {
      _$result = _$v ??
          new _$UserModel._(
              userId: BuiltValueNullFieldError.checkNotNull(
                  userId, r'UserModel', 'userId'),
              username: BuiltValueNullFieldError.checkNotNull(
                  username, r'UserModel', 'username'),
              email: BuiltValueNullFieldError.checkNotNull(
                  email, r'UserModel', 'email'),
              profileImage: BuiltValueNullFieldError.checkNotNull(
                  profileImage, r'UserModel', 'profileImage'),
              bio: BuiltValueNullFieldError.checkNotNull(
                  bio, r'UserModel', 'bio'),
              posts: posts.build(),
              savedPosts: savedPosts.build(),
              followers: followers.build(),
              following: following.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'posts';
        posts.build();
        _$failedField = 'savedPosts';
        savedPosts.build();
        _$failedField = 'followers';
        followers.build();
        _$failedField = 'following';
        following.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
