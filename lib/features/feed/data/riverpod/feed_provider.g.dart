// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedStreamHash() => r'7644ba739b65258f57bffea965b04bcdf8ba237a';

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
    extends Family<AsyncValue<QuerySnapshot<Map<String, dynamic>>?>> {
  /// See also [feedStream].
  const FeedStreamFamily();

  /// See also [feedStream].
  FeedStreamProvider call(
    Set<String> feedSet,
  ) {
    return FeedStreamProvider(
      feedSet,
    );
  }

  @override
  FeedStreamProvider getProviderOverride(
    covariant FeedStreamProvider provider,
  ) {
    return call(
      provider.feedSet,
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
    extends AutoDisposeStreamProvider<QuerySnapshot<Map<String, dynamic>>?> {
  /// See also [feedStream].
  FeedStreamProvider(
    Set<String> feedSet,
  ) : this._internal(
          (ref) => feedStream(
            ref as FeedStreamRef,
            feedSet,
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
          feedSet: feedSet,
        );

  FeedStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.feedSet,
  }) : super.internal();

  final Set<String> feedSet;

  @override
  Override overrideWith(
    Stream<QuerySnapshot<Map<String, dynamic>>?> Function(
            FeedStreamRef provider)
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
        feedSet: feedSet,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<QuerySnapshot<Map<String, dynamic>>?>
      createElement() {
    return _FeedStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedStreamProvider && other.feedSet == feedSet;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, feedSet.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FeedStreamRef
    on AutoDisposeStreamProviderRef<QuerySnapshot<Map<String, dynamic>>?> {
  /// The parameter `feedSet` of this provider.
  Set<String> get feedSet;
}

class _FeedStreamProviderElement extends AutoDisposeStreamProviderElement<
    QuerySnapshot<Map<String, dynamic>>?> with FeedStreamRef {
  _FeedStreamProviderElement(super.provider);

  @override
  Set<String> get feedSet => (origin as FeedStreamProvider).feedSet;
}

String _$commentStreamHash() => r'65180f3efc75669c6616a7f04880858706193b3d';

/// See also [commentStream].
@ProviderFor(commentStream)
const commentStreamProvider = CommentStreamFamily();

/// See also [commentStream].
class CommentStreamFamily
    extends Family<AsyncValue<QuerySnapshot<Map<String, dynamic>>>> {
  /// See also [commentStream].
  const CommentStreamFamily();

  /// See also [commentStream].
  CommentStreamProvider call(
    String postId,
  ) {
    return CommentStreamProvider(
      postId,
    );
  }

  @override
  CommentStreamProvider getProviderOverride(
    covariant CommentStreamProvider provider,
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
  String? get name => r'commentStreamProvider';
}

/// See also [commentStream].
class CommentStreamProvider
    extends AutoDisposeStreamProvider<QuerySnapshot<Map<String, dynamic>>> {
  /// See also [commentStream].
  CommentStreamProvider(
    String postId,
  ) : this._internal(
          (ref) => commentStream(
            ref as CommentStreamRef,
            postId,
          ),
          from: commentStreamProvider,
          name: r'commentStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commentStreamHash,
          dependencies: CommentStreamFamily._dependencies,
          allTransitiveDependencies:
              CommentStreamFamily._allTransitiveDependencies,
          postId: postId,
        );

  CommentStreamProvider._internal(
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
    Stream<QuerySnapshot<Map<String, dynamic>>> Function(
            CommentStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CommentStreamProvider._internal(
        (ref) => create(ref as CommentStreamRef),
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
  AutoDisposeStreamProviderElement<QuerySnapshot<Map<String, dynamic>>>
      createElement() {
    return _CommentStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentStreamProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CommentStreamRef
    on AutoDisposeStreamProviderRef<QuerySnapshot<Map<String, dynamic>>> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _CommentStreamProviderElement extends AutoDisposeStreamProviderElement<
    QuerySnapshot<Map<String, dynamic>>> with CommentStreamRef {
  _CommentStreamProviderElement(super.provider);

  @override
  String get postId => (origin as CommentStreamProvider).postId;
}

String _$feedSetHash() => r'4b1a140aba08c57ed389a72358e12b95b137cd87';

/// See also [FeedSet].
@ProviderFor(FeedSet)
final feedSetProvider =
    AutoDisposeNotifierProvider<FeedSet, Set<String>>.internal(
  FeedSet.new,
  name: r'feedSetProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$feedSetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FeedSet = AutoDisposeNotifier<Set<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
