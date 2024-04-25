import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_provider.g.dart';

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>?> feedStream(
    FeedStreamRef ref, Set<String> feedSet) {
  if (feedSet.isEmpty) {
    return Stream.value(null);
  }
  return sl
      .get<FirebaseFirestore>()
      .collection('posts')
      .where('userId', whereIn: feedSet)
      .orderBy('publishedDate', descending: true)
      .snapshots();
}

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>> commentStream(
    CommentStreamRef ref, String postId) {
  return sl
      .get<FirebaseFirestore>()
      .collection('posts')
      .doc(postId)
      .collection('comments')
      .snapshots();
}

@riverpod
class FeedSet extends _$FeedSet {
  @override
  Set<String> build() => {};

  void add(String userId) {
    state = {...state, userId};
  }

  void remove(String userId) {
    state.remove(userId);
    state = Set.from(state);
  }

  @override
  set state(Set<String> newState) => super.state = newState;
  Set<String> update(Set<String> Function(Set<String> state) cb) =>
      state = cb(state);
}
