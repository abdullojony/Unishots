// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postHash() => r'31bc5f59829210381d2c9cba96f3436a4cb35357';

/// See also [post].
@ProviderFor(post)
final postProvider =
    AutoDisposeFutureProvider<QuerySnapshot<Map<String, dynamic>>>.internal(
  post,
  name: r'postProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$postHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PostRef
    = AutoDisposeFutureProviderRef<QuerySnapshot<Map<String, dynamic>>>;
String _$searchUsersHash() => r'68d269fdd1b3094d8afdcae2565926f297aa869f';

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

/// See also [searchUsers].
@ProviderFor(searchUsers)
const searchUsersProvider = SearchUsersFamily();

/// See also [searchUsers].
class SearchUsersFamily extends Family<AsyncValue<QuerySnapshot>> {
  /// See also [searchUsers].
  const SearchUsersFamily();

  /// See also [searchUsers].
  SearchUsersProvider call(
    String searchText,
  ) {
    return SearchUsersProvider(
      searchText,
    );
  }

  @override
  SearchUsersProvider getProviderOverride(
    covariant SearchUsersProvider provider,
  ) {
    return call(
      provider.searchText,
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
  String? get name => r'searchUsersProvider';
}

/// See also [searchUsers].
class SearchUsersProvider extends AutoDisposeFutureProvider<QuerySnapshot> {
  /// See also [searchUsers].
  SearchUsersProvider(
    String searchText,
  ) : this._internal(
          (ref) => searchUsers(
            ref as SearchUsersRef,
            searchText,
          ),
          from: searchUsersProvider,
          name: r'searchUsersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchUsersHash,
          dependencies: SearchUsersFamily._dependencies,
          allTransitiveDependencies:
              SearchUsersFamily._allTransitiveDependencies,
          searchText: searchText,
        );

  SearchUsersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.searchText,
  }) : super.internal();

  final String searchText;

  @override
  Override overrideWith(
    FutureOr<QuerySnapshot> Function(SearchUsersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchUsersProvider._internal(
        (ref) => create(ref as SearchUsersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        searchText: searchText,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<QuerySnapshot> createElement() {
    return _SearchUsersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchUsersProvider && other.searchText == searchText;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, searchText.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchUsersRef on AutoDisposeFutureProviderRef<QuerySnapshot> {
  /// The parameter `searchText` of this provider.
  String get searchText;
}

class _SearchUsersProviderElement
    extends AutoDisposeFutureProviderElement<QuerySnapshot>
    with SearchUsersRef {
  _SearchUsersProviderElement(super.provider);

  @override
  String get searchText => (origin as SearchUsersProvider).searchText;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
