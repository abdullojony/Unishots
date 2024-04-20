import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_provider.g.dart';

@riverpod
Future<List<dynamic>> posts(PostsRef ref) async {
  final snapshot = await sl
      .get<FirebaseFirestore>()
      .collection('posts')
      .orderBy('publishedDate')
      .get();

  return snapshot.docs;
}
