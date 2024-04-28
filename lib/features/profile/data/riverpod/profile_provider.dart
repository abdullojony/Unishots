import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

@riverpod
Stream<DocumentSnapshot<Map<String, dynamic>>> userStream(
    UserStreamRef ref, String userId) {
  return sl
      .get<FirebaseFirestore>()
      .collection('users')
      .doc(userId)
      .snapshots();
}

@riverpod
Future<QuerySnapshot<Map<String, dynamic>>?> followerUsers(
    FollowerUsersRef ref, Set<String> followers) {
  if (followers.isEmpty) {
    return Future(() => null);
  }
  return sl
      .get<FirebaseFirestore>()
      .collection('users')
      .where('userId', whereIn: followers)
      .get();
}

@riverpod
Future<QuerySnapshot<Map<String, dynamic>>?> followingUsers(
    FollowingUsersRef ref, Set<String> following) {
  if (following.isEmpty) {
    return Future(() => null);
  }
  return sl
      .get<FirebaseFirestore>()
      .collection('users')
      .where('userId', whereIn: following)
      .get();
}

@riverpod
Future<QuerySnapshot<Map<String, dynamic>>?> savedPosts(
    SavedPostsRef ref, BuiltSet<String> savedSet) {
  if (savedSet.isEmpty) {
    return Future(() => null);
  }
  return sl
      .get<FirebaseFirestore>()
      .collection('posts')
      .where('postId', whereIn: savedSet)
      .get();
}

@riverpod
Stream<DocumentSnapshot<Map<String, dynamic>>> singlePostStream(
    SinglePostStreamRef ref, String postId) {
  return sl
      .get<FirebaseFirestore>()
      .collection('posts')
      .doc(postId)
      .snapshots();
}
