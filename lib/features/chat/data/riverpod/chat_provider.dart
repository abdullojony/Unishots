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
      .orderBy('unreadCount', descending: true)
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

@Riverpod(keepAlive: true)
class OpenChat extends _$OpenChat {
  /// Constructor for default state.
  @override
  Function(ChatEntity)? build() => null;

  /// Function to update the state.
  @override
  set state(Function(ChatEntity)? newState) => super.state = newState;
  Function(ChatEntity)? update(
          Function(ChatEntity)? Function(Function(ChatEntity)? state) cb) =>
      state = cb(state);
}

@riverpod
class UnreadMessages extends _$UnreadMessages {
  /// Constructor for default state.
  @override
  int build() => 0;

  /// Function to update the state.
  @override
  set state(int newState) => super.state = newState;
  int update(int Function(int state) cb) => state = cb(state);
}
