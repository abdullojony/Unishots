import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone/core/repositories/storage_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/auth/data/models/user_model.dart';
import 'package:instagram_clone/features/auth/domain/repositories/auth_repositories.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entity.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  @override
  Future<UserEntity> signupUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List? profileImage}) async {
    // check if username exist
    final duplicates = await sl
        .get<FirebaseFirestore>()
        .collection('users')
        .where('username', isEqualTo: username)
        .get();

    if (duplicates.docs.isNotEmpty) {
      throw Exception('Username already exist');
    }

    // register a new user
    final credentials = await sl
        .get<FirebaseAuth>()
        .createUserWithEmailAndPassword(email: email, password: password);

    if (profileImage == null) {
      ByteData bytes = await rootBundle.load('assets/profile_placeholder.png');
      profileImage = bytes.buffer.asUint8List();
    }

    // upload profileImage to storage
    String storageUrl = await sl.get<StorageRepositories>().uploadImage(
        folderName: 'profilePics', image: profileImage, isPost: false);

    // create user model
    final user = UserModel((b) => b
      ..userId = credentials.user!.uid
      ..username = username
      ..email = email
      ..bio = bio
      ..profileImage = storageUrl
      ..posts = ListBuilder()
      ..savedPosts = SetBuilder()
      ..followers = SetBuilder()
      ..following = SetBuilder());

    // Add userdata to firestore
    await sl
        .get<FirebaseFirestore>()
        .collection('users')
        .doc(credentials.user!.uid)
        .set(user.toMap());

    return user;
  }

  @override
  Future<void> loginUser(
      {required String email, required String password}) async {
    await sl
        .get<FirebaseAuth>()
        .signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await sl.get<FirebaseAuth>().signOut();
  }
}
