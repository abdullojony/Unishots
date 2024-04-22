// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postStreamHash() => r'c8308c81fdf1dcf534573312fb841ee00259993c';

/// See also [postStream].
@ProviderFor(postStream)
final postStreamProvider =
    AutoDisposeStreamProvider<QuerySnapshot<Map<String, dynamic>>>.internal(
  postStream,
  name: r'postStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$postStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PostStreamRef
    = AutoDisposeStreamProviderRef<QuerySnapshot<Map<String, dynamic>>>;
String _$feedStreamHash() => r'b0e48cb9a25e48719ddbc1b05903fd3c953b7635';

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

/// See also [feedStream].
@ProviderFor(feedStream)
const feedStreamProvider = FeedStreamFamily();

/// See also [feedStream].
class FeedStreamFamily
    extends Family<AsyncValue<QuerySnapshot<Map<String, dynamic>>>> {
  /// See also [feedStream].
  const FeedStreamFamily();

  /// See also [feedStream].
  FeedStreamProvider call(
    Set<String> following,
  ) {
    return FeedStreamProvider(
      following,
    );
  }

  @override
  FeedStreamProvider getProviderOverride(
    covariant FeedStreamProvider provider,
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
  String? get name => r'feedStreamProvider';
}

/// See also [feedStream].
class FeedStreamProvider
    extends AutoDisposeStreamProvider<QuerySnapshot<Map<String, dynamic>>> {
  /// See also [feedStream].
  FeedStreamProvider(
    Set<String> following,
  ) : this._internal(
          (ref) => feedStream(
            ref as FeedStreamRef,
            following,
          ),
          from: feedStreamProvider,
          name: r'feedStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedStreamHash,
          dependencies: FeedStreamFamily._dependencies,
          allTransitiveDependencies:
              FeedStreamFamily._allTransitiveDependencies,
          following: following,
        );

  FeedStreamProvider._internal(
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
    Stream<QuerySnapshot<Map<String, dynamic>>> Function(FeedStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FeedStreamProvider._internal(
        (ref) => create(ref as FeedStreamRef),
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
    return _FeedStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedStreamProvider && other.following == following;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, following.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeedStreamRef
    on AutoDisposeStreamProviderRef<QuerySnapshot<Map<String, dynamic>>> {
  /// The parameter `following` of this provider.
  Set<String> get following;
}

class _FeedStreamProviderElement extends AutoDisposeStreamProviderElement<
    QuerySnapshot<Map<String, dynamic>>> with FeedStreamRef {
  _FeedStreamProviderElement(super.provider);

  @override
  Set<String> get following => (origin as FeedStreamProvider).following;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
