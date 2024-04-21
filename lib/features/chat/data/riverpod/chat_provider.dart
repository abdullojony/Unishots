import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/chat/domain/entities/chat_entities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_provider.g.dart';

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>> chatStream(ChatStreamRef ref) {
  final userId = sl.get<FirebaseAuth>().currentUser!.uid;
  return sl
      .get<FirebaseFirestore>()
      .collection('users')
      .doc(userId)
      .collection('chats')
      .snapshots();
}

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>> messageStream(
    MessageStreamRef ref, String userId, String chatId) {
  return sl
      .get<FirebaseFirestore>()
      .collection('users')
      .doc(userId)
      .collection('chats')
      .doc(chatId)
      .collection('messages')
      .orderBy('created', descending: true)
      .snapshots();
}

/// Notifier that holds the chat that needs to be opened.
@riverpod
class ChatNotifier extends _$ChatNotifier {
  /// Constructor for default state.
  @override
  ChatEntity? build() => null;

  /// Function to update the state.
  @override
  set state(ChatEntity? newState) => super.state = newState;
  ChatEntity? update(ChatEntity? Function(ChatEntity? state) cb) =>
      state = cb(state);
}
