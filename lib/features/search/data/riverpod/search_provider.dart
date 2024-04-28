import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_provider.g.dart';

@riverpod
Future<QuerySnapshot<Map<String, dynamic>>> post(PostRef ref) {
  return sl
      .get<FirebaseFirestore>()
      .collection('posts')
      .orderBy('publishedDate', descending: true)
      .get();
}

@riverpod
Future<QuerySnapshot> searchUsers(SearchUsersRef ref, String searchText) {
  return sl
      .get<FirebaseFirestore>()
      .collection('users')
      .where('username', isGreaterThanOrEqualTo: searchText)
      .get();
}
