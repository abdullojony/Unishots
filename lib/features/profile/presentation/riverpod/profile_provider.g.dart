// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userDataHash() => r'2df507288a3a28f077b6ccfaf563d492f848a4b2';

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

/// See also [userData].
@ProviderFor(userData)
const userDataProvider = UserDataFamily();

/// See also [userData].
class UserDataFamily extends Family<AsyncValue<UserEntity>> {
  /// See also [userData].
  const UserDataFamily();

  /// See also [userData].
  UserDataProvider call(
    String userId,
  ) {
    return UserDataProvider(
      userId,
    );
  }

  @override
  UserDataProvider getProviderOverride(
    covariant UserDataProvider provider,
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
  String? get name => r'userDataProvider';
}

/// See also [userData].
class UserDataProvider extends AutoDisposeFutureProvider<UserEntity> {
  /// See also [userData].
  UserDataProvider(
    String userId,
  ) : this._internal(
          (ref) => userData(
            ref as UserDataRef,
            userId,
          ),
          from: userDataProvider,
          name: r'userDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userDataHash,
          dependencies: UserDataFamily._dependencies,
          allTransitiveDependencies: UserDataFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserDataProvider._internal(
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
    FutureOr<UserEntity> Function(UserDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserDataProvider._internal(
        (ref) => create(ref as UserDataRef),
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
  AutoDisposeFutureProviderElement<UserEntity> createElement() {
    return _UserDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDataProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserDataRef on AutoDisposeFutureProviderRef<UserEntity> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserDataProviderElement
    extends AutoDisposeFutureProviderElement<UserEntity> with UserDataRef {
  _UserDataProviderElement(super.provider);

  @override
  String get userId => (origin as UserDataProvider).userId;
}

String _$userPostsHash() => r'0deb33d887143f39236fc51b24be55318298764d';

/// See also [userPosts].
@ProviderFor(userPosts)
const userPostsProvider = UserPostsFamily();

/// See also [userPosts].
class UserPostsFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [userPosts].
  const UserPostsFamily();

  /// See also [userPosts].
  UserPostsProvider call(
    String userId,
  ) {
    return UserPostsProvider(
      userId,
    );
  }

  @override
  UserPostsProvider getProviderOverride(
    covariant UserPostsProvider provider,
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
  String? get name => r'userPostsProvider';
}

/// See also [userPosts].
class UserPostsProvider extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [userPosts].
  UserPostsProvider(
    String userId,
  ) : this._internal(
          (ref) => userPosts(
            ref as UserPostsRef,
            userId,
          ),
          from: userPostsProvider,
          name: r'userPostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userPostsHash,
          dependencies: UserPostsFamily._dependencies,
          allTransitiveDependencies: UserPostsFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserPostsProvider._internal(
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
    FutureOr<List<dynamic>> Function(UserPostsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserPostsProvider._internal(
        (ref) => create(ref as UserPostsRef),
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
  AutoDisposeFutureProviderElement<List<dynamic>> createElement() {
    return _UserPostsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserPostsProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserPostsRef on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserPostsProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>> with UserPostsRef {
  _UserPostsProviderElement(super.provider);

  @override
  String get userId => (origin as UserPostsProvider).userId;
}

String _$currentUserHash() => r'cf78de99822563cea5eecd8fc4c1f76eb1672797';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = AutoDisposeFutureProvider<UserEntity?>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserRef = AutoDisposeFutureProviderRef<UserEntity?>;
String _$userHash() => r'203223c21135383394d12a435056ef7d3bd4c60a';

/// See also [User].
@ProviderFor(User)
final userProvider =
    AutoDisposeAsyncNotifierProvider<User, List<PostEntity>>.internal(
  User.new,
  name: r'userProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$User = AutoDisposeAsyncNotifier<List<PostEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
