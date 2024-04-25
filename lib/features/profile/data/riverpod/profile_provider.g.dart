// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userStreamHash() => r'd0b802ff43f82a191b22d1b34539234ae86afea1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [userStream].
@ProviderFor(userStream)
const userStreamProvider = UserStreamFamily();

/// See also [userStream].
class UserStreamFamily
    extends Family<AsyncValue<DocumentSnapshot<Map<String, dynamic>>>> {
  /// See also [userStream].
  const UserStreamFamily();

  /// See also [userStream].
  UserStreamProvider call(
    String userId,
  ) {
    return UserStreamProvider(
      userId,
    );
  }

  @override
  UserStreamProvider getProviderOverride(
    covariant UserStreamProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userStreamProvider';
}

/// See also [userStream].
class UserStreamProvider
    extends AutoDisposeStreamProvider<DocumentSnapshot<Map<String, dynamic>>> {
  /// See also [userStream].
  UserStreamProvider(
    String userId,
  ) : this._internal(
          (ref) => userStream(
            ref as UserStreamRef,
            userId,
          ),
          from: userStreamProvider,
          name: r'userStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userStreamHash,
          dependencies: UserStreamFamily._dependencies,
          allTransitiveDependencies:
              UserStreamFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    Stream<DocumentSnapshot<Map<String, dynamic>>> Function(
            UserStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserStreamProvider._internal(
        (ref) => create(ref as UserStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<DocumentSnapshot<Map<String, dynamic>>>
      createElement() {
    return _UserStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserStreamProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserStreamRef
    on AutoDisposeStreamProviderRef<DocumentSnapshot<Map<String, dynamic>>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserStreamProviderElement extends AutoDisposeStreamProviderElement<
    DocumentSnapshot<Map<String, dynamic>>> with UserStreamRef {
  _UserStreamProviderElement(super.provider);

  @override
  String get userId => (origin as UserStreamProvider).userId;
}

String _$followerUsersHash() => r'6693749def8b172ea1d877d53e67f0fb7fd46706';

/// See also [followerUsers].
@ProviderFor(followerUsers)
const followerUsersProvider = FollowerUsersFamily();

/// See also [followerUsers].
class FollowerUsersFamily
    extends Family<AsyncValue<QuerySnapshot<Map<String, dynamic>>?>> {
  /// See also [followerUsers].
  const FollowerUsersFamily();

  /// See also [followerUsers].
  FollowerUsersProvider call(
    Set<String> followers,
  ) {
    return FollowerUsersProvider(
      followers,
    );
  }

  @override
  FollowerUsersProvider getProviderOverride(
    covariant FollowerUsersProvider provider,
  ) {
    return call(
      provider.followers,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'followerUsersProvider';
}

/// See also [followerUsers].
class FollowerUsersProvider
    extends AutoDisposeFutureProvider<QuerySnapshot<Map<String, dynamic>>?> {
  /// See also [followerUsers].
  FollowerUsersProvider(
    Set<String> followers,
  ) : this._internal(
          (ref) => followerUsers(
            ref as FollowerUsersRef,
            followers,
          ),
          from: followerUsersProvider,
          name: r'followerUsersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$followerUsersHash,
          dependencies: FollowerUsersFamily._dependencies,
          allTransitiveDependencies:
              FollowerUsersFamily._allTransitiveDependencies,
          followers: followers,
        );

  FollowerUsersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.followers,
  }) : super.internal();

  final Set<String> followers;

  @override
  Override overrideWith(
    FutureOr<QuerySnapshot<Map<String, dynamic>>?> Function(
            FollowerUsersRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FollowerUsersProvider._internal(
        (ref) => create(ref as FollowerUsersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        followers: followers,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<QuerySnapshot<Map<String, dynamic>>?>
      createElement() {
    return _FollowerUsersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FollowerUsersProvider && other.followers == followers;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, followers.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FollowerUsersRef
    on AutoDisposeFutureProviderRef<QuerySnapshot<Map<String, dynamic>>?> {
  /// The parameter `followers` of this provider.
  Set<String> get followers;
}

class _FollowerUsersProviderElement extends AutoDisposeFutureProviderElement<
    QuerySnapshot<Map<String, dynamic>>?> with FollowerUsersRef {
  _FollowerUsersProviderElement(super.provider);

  @override
  Set<String> get followers => (origin as FollowerUsersProvider).followers;
}

String _$followingUsersHash() => r'5fccbf2febed594bf46dbdd5fcde55ab6b050b10';

/// See also [followingUsers].
@ProviderFor(followingUsers)
const followingUsersProvider = FollowingUsersFamily();

/// See also [followingUsers].
class FollowingUsersFamily
    extends Family<AsyncValue<QuerySnapshot<Map<String, dynamic>>?>> {
  /// See also [followingUsers].
  const FollowingUsersFamily();

  /// See also [followingUsers].
  FollowingUsersProvider call(
    Set<String> following,
  ) {
    return FollowingUsersProvider(
      following,
    );
  }

  @override
  FollowingUsersProvider getProviderOverride(
    covariant FollowingUsersProvider provider,
  ) {
    return call(
      provider.following,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'followingUsersProvider';
}

/// See also [followingUsers].
class FollowingUsersProvider
    extends AutoDisposeFutureProvider<QuerySnapshot<Map<String, dynamic>>?> {
  /// See also [followingUsers].
  FollowingUsersProvider(
    Set<String> following,
  ) : this._internal(
          (ref) => followingUsers(
            ref as FollowingUsersRef,
            following,
          ),
          from: followingUsersProvider,
          name: r'followingUsersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$followingUsersHash,
          dependencies: FollowingUsersFamily._dependencies,
          allTransitiveDependencies:
              FollowingUsersFamily._allTransitiveDependencies,
          following: following,
        );

  FollowingUsersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.following,
  }) : super.internal();

  final Set<String> following;

  @override
  Override overrideWith(
    FutureOr<QuerySnapshot<Map<String, dynamic>>?> Function(
            FollowingUsersRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FollowingUsersProvider._internal(
        (ref) => create(ref as FollowingUsersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        following: following,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<QuerySnapshot<Map<String, dynamic>>?>
      createElement() {
    return _FollowingUsersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FollowingUsersProvider && other.following == following;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, following.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FollowingUsersRef
    on AutoDisposeFutureProviderRef<QuerySnapshot<Map<String, dynamic>>?> {
  /// The parameter `following` of this provider.
  Set<String> get following;
}

class _FollowingUsersProviderElement extends AutoDisposeFutureProviderElement<
    QuerySnapshot<Map<String, dynamic>>?> with FollowingUsersRef {
  _FollowingUsersProviderElement(super.provider);

  @override
  Set<String> get following => (origin as FollowingUsersProvider).following;
}

String _$singlePostStreamHash() => r'84b293368653334bccbc801615a5cca7e270214b';

/// See also [singlePostStream].
@ProviderFor(singlePostStream)
const singlePostStreamProvider = SinglePostStreamFamily();

/// See also [singlePostStream].
class SinglePostStreamFamily
    extends Family<AsyncValue<DocumentSnapshot<Map<String, dynamic>>>> {
  /// See also [singlePostStream].
  const SinglePostStreamFamily();

  /// See also [singlePostStream].
  SinglePostStreamProvider call(
    String postId,
  ) {
    return SinglePostStreamProvider(
      postId,
    );
  }

  @override
  SinglePostStreamProvider getProviderOverride(
    covariant SinglePostStreamProvider provider,
  ) {
    return call(
      provider.postId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'singlePostStreamProvider';
}

/// See also [singlePostStream].
class SinglePostStreamProvider
    extends AutoDisposeStreamProvider<DocumentSnapshot<Map<String, dynamic>>> {
  /// See also [singlePostStream].
  SinglePostStreamProvider(
    String postId,
  ) : this._internal(
          (ref) => singlePostStream(
            ref as SinglePostStreamRef,
            postId,
          ),
          from: singlePostStreamProvider,
          name: r'singlePostStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singlePostStreamHash,
          dependencies: SinglePostStreamFamily._dependencies,
          allTransitiveDependencies:
              SinglePostStreamFamily._allTransitiveDependencies,
          postId: postId,
        );

  SinglePostStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final String postId;

  @override
  Override overrideWith(
    Stream<DocumentSnapshot<Map<String, dynamic>>> Function(
            SinglePostStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SinglePostStreamProvider._internal(
        (ref) => create(ref as SinglePostStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<DocumentSnapshot<Map<String, dynamic>>>
      createElement() {
    return _SinglePostStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SinglePostStreamProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SinglePostStreamRef
    on AutoDisposeStreamProviderRef<DocumentSnapshot<Map<String, dynamic>>> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _SinglePostStreamProviderElement extends AutoDisposeStreamProviderElement<
    DocumentSnapshot<Map<String, dynamic>>> with SinglePostStreamRef {
  _SinglePostStreamProviderElement(super.provider);

  @override
  String get postId => (origin as SinglePostStreamProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
