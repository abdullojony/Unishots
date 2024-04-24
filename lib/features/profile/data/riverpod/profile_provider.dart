import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>> userPostStream(
    UserPostStreamRef ref, String userId) {
  return sl
      .get<FirebaseFirestore>()
      .collection('posts')
      .where('userId', isEqualTo: userId)
      .orderBy('publishedDate', descending: true)
      .snapshots();
}

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>> userStream(
    UserStreamRef ref, String userId) {
  return sl
      .get<FirebaseFirestore>()
      .collection('users')
      .where('userId', isEqualTo: userId)
      .snapshots();
}

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>> followerStream(
    FollowerStreamRef ref, Set<String> followers) {
  return sl
      .get<FirebaseFirestore>()
      .collection('users')
      .where('userId', whereIn: followers)
      .snapshots();
}

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>> followingStream(
    FollowingStreamRef ref, Set<String> following) {
  return sl
      .get<FirebaseFirestore>()
      .collection('users')
      .where('userId', whereIn: following)
      .snapshots();
}
