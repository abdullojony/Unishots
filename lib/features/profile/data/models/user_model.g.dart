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
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'photoUrl',
      serializers.serialize(object.photoUrl,
          specifiedType: const FullType(String)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'bio',
      serializers.serialize(object.bio, specifiedType: const FullType(String)),
      'followers',
      serializers.serialize(object.followers,
          specifiedType:
              const FullType(BuiltList, const [const FullType(dynamic)])),
      'following',
      serializers.serialize(object.following,
          specifiedType:
              const FullType(BuiltList, const [const FullType(dynamic)])),
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
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'photoUrl':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'followers':
          result.followers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(dynamic)]))!
              as BuiltList<Object?>);
          break;
        case 'following':
          result.following.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(dynamic)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$UserModel extends UserModel {
  @override
  final String email;
  @override
  final String uid;
  @override
  final String photoUrl;
  @override
  final String username;
  @override
  final String bio;
  @override
  final BuiltList<dynamic> followers;
  @override
  final BuiltList<dynamic> following;

  factory _$UserModel([void Function(UserModelBuilder)? updates]) =>
      (new UserModelBuilder()..update(updates))._build();

  _$UserModel._(
      {required this.email,
      required this.uid,
      required this.photoUrl,
      required this.username,
      required this.bio,
      required this.followers,
      required this.following})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(email, r'UserModel', 'email');
    BuiltValueNullFieldError.checkNotNull(uid, r'UserModel', 'uid');
    BuiltValueNullFieldError.checkNotNull(photoUrl, r'UserModel', 'photoUrl');
    BuiltValueNullFieldError.checkNotNull(username, r'UserModel', 'username');
    BuiltValueNullFieldError.checkNotNull(bio, r'UserModel', 'bio');
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
        email == other.email &&
        uid == other.uid &&
        photoUrl == other.photoUrl &&
        username == other.username &&
        bio == other.bio &&
        followers == other.followers &&
        following == other.following;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, bio.hashCode);
    _$hash = $jc(_$hash, followers.hashCode);
    _$hash = $jc(_$hash, following.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserModel')
          ..add('email', email)
          ..add('uid', uid)
          ..add('photoUrl', photoUrl)
          ..add('username', username)
          ..add('bio', bio)
          ..add('followers', followers)
          ..add('following', following))
        .toString();
  }
}

class UserModelBuilder implements Builder<UserModel, UserModelBuilder> {
  _$UserModel? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  ListBuilder<dynamic>? _followers;
  ListBuilder<dynamic> get followers =>
      _$this._followers ??= new ListBuilder<dynamic>();
  set followers(ListBuilder<dynamic>? followers) =>
      _$this._followers = followers;

  ListBuilder<dynamic>? _following;
  ListBuilder<dynamic> get following =>
      _$this._following ??= new ListBuilder<dynamic>();
  set following(ListBuilder<dynamic>? following) =>
      _$this._following = following;

  UserModelBuilder();

  UserModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _uid = $v.uid;
      _photoUrl = $v.photoUrl;
      _username = $v.username;
      _bio = $v.bio;
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
              email: BuiltValueNullFieldError.checkNotNull(
                  email, r'UserModel', 'email'),
              uid: BuiltValueNullFieldError.checkNotNull(
                  uid, r'UserModel', 'uid'),
              photoUrl: BuiltValueNullFieldError.checkNotNull(
                  photoUrl, r'UserModel', 'photoUrl'),
              username: BuiltValueNullFieldError.checkNotNull(
                  username, r'UserModel', 'username'),
              bio: BuiltValueNullFieldError.checkNotNull(
                  bio, r'UserModel', 'bio'),
              followers: followers.build(),
              following: following.build());
    } catch (_) {
      late String _$failedField;
      try {
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
