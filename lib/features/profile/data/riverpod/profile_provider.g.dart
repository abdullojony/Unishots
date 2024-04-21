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

String _$userPostStreamHash() => r'5e1e51900ee3807d6c2ef75401ddfc3b67d056ec';

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

String _$followsHash() => r'df493bb524a47965522d0765bf5e162db6c904fd';

/// See also [Follows].
@ProviderFor(Follows)
final followsProvider =
    AutoDisposeNotifierProvider<Follows, Set<String>>.internal(
  Follows.new,
  name: r'followsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$followsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Follows = AutoDisposeNotifier<Set<String>>;
String _$postCounterHash() => r'1a4e156ab9e81c173de92e1adada7afc10d15b62';

/// See also [PostCounter].
@ProviderFor(PostCounter)
final postCounterProvider =
    AutoDisposeNotifierProvider<PostCounter, int>.internal(
  PostCounter.new,
  name: r'postCounterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$postCounterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PostCounter = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
