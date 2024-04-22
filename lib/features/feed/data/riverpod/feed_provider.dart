import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_provider.g.dart';

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>> postStream(PostStreamRef ref) {
  return sl.get<FirebaseFirestore>().collection('posts').snapshots();
}

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>> feedStream(
    FeedStreamRef ref, Set<String> following) {
  return sl
      .get<FirebaseFirestore>()
      .collection('posts')
      .where('userId', whereIn: following)
      .snapshots();
}
