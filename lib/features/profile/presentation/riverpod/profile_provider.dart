import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/feed/data/models/post_model.dart';
import 'package:instagram_clone/features/feed/domain/entities/post_entity.dart';
import 'package:instagram_clone/features/profile/data/models/user_model.dart';
import 'package:instagram_clone/features/profile/domain/entities/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

@riverpod
Future<UserEntity> userData(UserDataRef ref, String userId) async {
  final snapshot =
      await sl.get<FirebaseFirestore>().collection('users').doc(userId).get();

  return UserModel.fromDocument(snapshot);
}

@riverpod
class User extends _$User {
  @override
  Future<List<PostEntity>> build() async {
    final userId = sl.get<FirebaseAuth>().currentUser!.uid;

    final snapshot = await sl
        .get<FirebaseFirestore>()
        .collection('posts')
        .where('userId', isEqualTo: userId)
        .get();

    return snapshot.docs.map((e) => PostModel.fromDocument(e)).toList();
  }

  Future<void> deletePost(String postId) async {
    final prevState = await future;
    prevState.removeWhere((element) => element.postId == postId);
    state = AsyncData(prevState);
  }

  Future<void> addPost(PostEntity newPost) async {
    final prevState = await future;
    prevState.add(newPost);
    state = AsyncData(prevState);
  }
}

@riverpod
Future<List<dynamic>> userPosts(UserPostsRef ref, String userId) async {
  final snapshot = await sl
      .get<FirebaseFirestore>()
      .collection('posts')
      .where('userId', isEqualTo: userId)
      .get();

  return snapshot.docs;
}

@riverpod
Future<UserEntity?> currentUser(CurrentUserRef ref) async {
  final user = sl.get<FirebaseAuth>().currentUser;
  if (user == null) {
    return null;
  }

  final doc =
      await sl.get<FirebaseFirestore>().collection('users').doc(user.uid).get();

  return UserModel.fromDocument(doc);
}
