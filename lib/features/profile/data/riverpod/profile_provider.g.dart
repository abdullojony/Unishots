// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userPostStreamHash() => r'8d4d8c1da34d0d4f421f3d0ddad5d4e03bcc7370';

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

/// See also [userPostStream].
@ProviderFor(userPostStream)
const userPostStreamProvider = UserPostStreamFamily();

/// See also [userPostStream].
class UserPostStreamFamily
    extends Family<AsyncValue<QuerySnapshot<Map<String, dynamic>>>> {
  /// See also [userPostStream].
  const UserPostStreamFamily();

  /// See also [userPostStream].
  UserPostStreamProvider call(
    String userId,
  ) {
    return UserPostStreamProvider(
      userId,
    );
  }

  @override
  UserPostStreamProvider getProviderOverride(
    covariant UserPostStreamProvider provider,
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
  String? get name => r'userPostStreamProvider';
}

/// See also [userPostStream].
class UserPostStreamProvider
    extends AutoDisposeStreamProvider<QuerySnapshot<Map<String, dynamic>>> {
  /// See also [userPostStream].
  UserPostStreamProvider(
    String userId,
  ) : this._internal(
          (ref) => userPostStream(
            ref as UserPostStreamRef,
            userId,
          ),
          from: userPostStreamProvider,
          name: r'userPostStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userPostStreamHash,
          dependencies: UserPostStreamFamily._dependencies,
          allTransitiveDependencies:
              UserPostStreamFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserPostStreamProvider._internal(
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
    Stream<QuerySnapshot<Map<String, dynamic>>> Function(
            UserPostStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserPostStreamProvider._internal(
        (ref) => create(ref as UserPostStreamRef),
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
  AutoDisposeStreamProviderElement<QuerySnapshot<Map<String, dynamic>>>
      createElement() {
    return _UserPostStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserPostStreamProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserPostStreamRef
    on AutoDisposeStreamProviderRef<QuerySnapshot<Map<String, dynamic>>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserPostStreamProviderElement extends AutoDisposeStreamProviderElement<
    QuerySnapshot<Map<String, dynamic>>> with UserPostStreamRef {
  _UserPostStreamProviderElement(super.provider);

  @override
  String get userId => (origin as UserPostStreamProvider).userId;
}

String _$userStreamHash() => r'fc77a3f5f7af6c92238d293b615252d202b241af';

/// See also [userStream].
@ProviderFor(userStream)
const userStreamProvider = UserStreamFamily();

/// See also [userStream].
class UserStreamFamily
    extends Family<AsyncValue<QuerySnapshot<Map<String, dynamic>>>> {
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
    extends AutoDisposeStreamProvider<QuerySnapshot<Map<String, dynamic>>> {
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
    Stream<QuerySnapshot<Map<String, dynamic>>> Function(UserStreamRef provider)
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
  AutoDisposeStreamProviderElement<QuerySnapshot<Map<String, dynamic>>>
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
    on AutoDisposeStreamProviderRef<QuerySnapshot<Map<String, dynamic>>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserStreamProviderElement extends AutoDisposeStreamProviderElement<
    QuerySnapshot<Map<String, dynamic>>> with UserStreamRef {
  _UserStreamProviderElement(super.provider);

  @override
  String get userId => (origin as UserStreamProvider).userId;
}

String _$followerStreamHash() => r'143e331914065adc45da6d34110cf40a41132951';

/// See also [followerStream].
@ProviderFor(followerStream)
const followerStreamProvider = FollowerStreamFamily();

/// See also [followerStream].
class FollowerStreamFamily
    extends Family<AsyncValue<QuerySnapshot<Map<String, dynamic>>>> {
  /// See also [followerStream].
  const FollowerStreamFamily();

  /// See also [followerStream].
  FollowerStreamProvider call(
    Set<String> followers,
  ) {
    return FollowerStreamProvider(
      followers,
    );
  }

  @override
  FollowerStreamProvider getProviderOverride(
    covariant FollowerStreamProvider provider,
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
  String? get name => r'followerStreamProvider';
}

/// See also [followerStream].
class FollowerStreamProvider
    extends AutoDisposeStreamProvider<QuerySnapshot<Map<String, dynamic>>> {
  /// See also [followerStream].
  FollowerStreamProvider(
    Set<String> followers,
  ) : this._internal(
          (ref) => followerStream(
            ref as FollowerStreamRef,
            followers,
          ),
          from: followerStreamProvider,
          name: r'followerStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$followerStreamHash,
          dependencies: FollowerStreamFamily._dependencies,
          allTransitiveDependencies:
              FollowerStreamFamily._allTransitiveDependencies,
          followers: followers,
        );

  FollowerStreamProvider._internal(
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
    Stream<QuerySnapshot<Map<String, dynamic>>> Function(
            FollowerStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FollowerStreamProvider._internal(
        (ref) => create(ref as FollowerStreamRef),
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
  AutoDisposeStreamProviderElement<QuerySnapshot<Map<String, dynamic>>>
      createElement() {
    return _FollowerStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FollowerStreamProvider && other.followers == followers;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, followers.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FollowerStreamRef
    on AutoDisposeStreamProviderRef<QuerySnapshot<Map<String, dynamic>>> {
  /// The parameter `followers` of this provider.
  Set<String> get followers;
}

class _FollowerStreamProviderElement extends AutoDisposeStreamProviderElement<
    QuerySnapshot<Map<String, dynamic>>> with FollowerStreamRef {
  _FollowerStreamProviderElement(super.provider);

  @override
  Set<String> get followers => (origin as FollowerStreamProvider).followers;
}

String _$followingStreamHash() => r'27f8a696dd2a832f84063a4298db316b1d765866';

/// See also [followingStream].
@ProviderFor(followingStream)
const followingStreamProvider = FollowingStreamFamily();

/// See also [followingStream].
class FollowingStreamFamily
    extends Family<AsyncValue<QuerySnapshot<Map<String, dynamic>>>> {
  /// See also [followingStream].
  const FollowingStreamFamily();

  /// See also [followingStream].
  FollowingStreamProvider call(
    Set<String> following,
  ) {
    return FollowingStreamProvider(
      following,
    );
  }

  @override
  FollowingStreamProvider getProviderOverride(
    covariant FollowingStreamProvider provider,
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
  String? get name => r'followingStreamProvider';
}

/// See also [followingStream].
class FollowingStreamProvider
    extends AutoDisposeStreamProvider<QuerySnapshot<Map<String, dynamic>>> {
  /// See also [followingStream].
  FollowingStreamProvider(
    Set<String> following,
  ) : this._internal(
          (ref) => followingStream(
            ref as FollowingStreamRef,
            following,
          ),
          from: followingStreamProvider,
          name: r'followingStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$followingStreamHash,
          dependencies: FollowingStreamFamily._dependencies,
          allTransitiveDependencies:
              FollowingStreamFamily._allTransitiveDependencies,
          following: following,
        );

  FollowingStreamProvider._internal(
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
    Stream<QuerySnapshot<Map<String, dynamic>>> Function(
            FollowingStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FollowingStreamProvider._internal(
        (ref) => create(ref as FollowingStreamRef),
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
  AutoDisposeStreamProviderElement<QuerySnapshot<Map<String, dynamic>>>
      createElement() {
    return _FollowingStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FollowingStreamProvider && other.following == following;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, following.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FollowingStreamRef
    on AutoDisposeStreamProviderRef<QuerySnapshot<Map<String, dynamic>>> {
  /// The parameter `following` of this provider.
  Set<String> get following;
}

class _FollowingStreamProviderElement extends AutoDisposeStreamProviderElement<
    QuerySnapshot<Map<String, dynamic>>> with FollowingStreamRef {
  _FollowingStreamProviderElement(super.provider);

  @override
  Set<String> get following => (origin as FollowingStreamProvider).following;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
