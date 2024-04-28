// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatStreamHash() => r'b959115bfea435e1776ae11e9ac573f80deae2e5';

/// See also [chatStream].
@ProviderFor(chatStream)
final chatStreamProvider =
    AutoDisposeStreamProvider<QuerySnapshot<Map<String, dynamic>>>.internal(
  chatStream,
  name: r'chatStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChatStreamRef
    = AutoDisposeStreamProviderRef<QuerySnapshot<Map<String, dynamic>>>;
String _$messageStreamHash() => r'db6526bf963df1ae116cc265c1ae7205aa21077c';

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

/// See also [messageStream].
@ProviderFor(messageStream)
const messageStreamProvider = MessageStreamFamily();

/// See also [messageStream].
class MessageStreamFamily
    extends Family<AsyncValue<QuerySnapshot<Map<String, dynamic>>>> {
  /// See also [messageStream].
  const MessageStreamFamily();

  /// See also [messageStream].
  MessageStreamProvider call(
    String userId,
    String chatId,
  ) {
    return MessageStreamProvider(
      userId,
      chatId,
    );
  }

  @override
  MessageStreamProvider getProviderOverride(
    covariant MessageStreamProvider provider,
  ) {
    return call(
      provider.userId,
      provider.chatId,
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
  String? get name => r'messageStreamProvider';
}

/// See also [messageStream].
class MessageStreamProvider
    extends AutoDisposeStreamProvider<QuerySnapshot<Map<String, dynamic>>> {
  /// See also [messageStream].
  MessageStreamProvider(
    String userId,
    String chatId,
  ) : this._internal(
          (ref) => messageStream(
            ref as MessageStreamRef,
            userId,
            chatId,
          ),
          from: messageStreamProvider,
          name: r'messageStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$messageStreamHash,
          dependencies: MessageStreamFamily._dependencies,
          allTransitiveDependencies:
              MessageStreamFamily._allTransitiveDependencies,
          userId: userId,
          chatId: chatId,
        );

  MessageStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.chatId,
  }) : super.internal();

  final String userId;
  final String chatId;

  @override
  Override overrideWith(
    Stream<QuerySnapshot<Map<String, dynamic>>> Function(
            MessageStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MessageStreamProvider._internal(
        (ref) => create(ref as MessageStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        chatId: chatId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<QuerySnapshot<Map<String, dynamic>>>
      createElement() {
    return _MessageStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MessageStreamProvider &&
        other.userId == userId &&
        other.chatId == chatId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, chatId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MessageStreamRef
    on AutoDisposeStreamProviderRef<QuerySnapshot<Map<String, dynamic>>> {
  /// The parameter `userId` of this provider.
  String get userId;

  /// The parameter `chatId` of this provider.
  String get chatId;
}

class _MessageStreamProviderElement extends AutoDisposeStreamProviderElement<
    QuerySnapshot<Map<String, dynamic>>> with MessageStreamRef {
  _MessageStreamProviderElement(super.provider);

  @override
  String get userId => (origin as MessageStreamProvider).userId;
  @override
  String get chatId => (origin as MessageStreamProvider).chatId;
}

String _$openChatHash() => r'484dd1963d72bcf9ad117fc87bd6327ca4a48bec';

/// See also [OpenChat].
@ProviderFor(OpenChat)
final openChatProvider =
    NotifierProvider<OpenChat, Function(ChatEntity)?>.internal(
  OpenChat.new,
  name: r'openChatProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$openChatHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OpenChat = Notifier<Function(ChatEntity)?>;
String _$unreadMessagesHash() => r'91dca04c822822a9728af4febbf3cd799f008a96';

/// See also [UnreadMessages].
@ProviderFor(UnreadMessages)
final unreadMessagesProvider =
    AutoDisposeNotifierProvider<UnreadMessages, int>.internal(
  UnreadMessages.new,
  name: r'unreadMessagesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$unreadMessagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UnreadMessages = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
