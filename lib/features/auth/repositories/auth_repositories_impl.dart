import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/core/storage/storage_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/auth/repositories/auth_repositories.dart';
import 'package:instagram_clone/features/profile/data/models/user_model.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  @override
  Future<void> signupUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List profileImage}) async {
    // register a new user
    final credentials = await sl
        .get<FirebaseAuth>()
        .createUserWithEmailAndPassword(email: email, password: password);

    // upload profileImage to storage
    String photoUrl = await sl.get<StorageRepositories>().uploadImage(
        folderName: 'profilePics', image: profileImage, isPost: false);

    final user = UserModel((b) => b
      ..email = email
      ..uid = credentials.user!.uid
      ..username = username
      ..bio = bio
      ..photoUrl = photoUrl
      ..followers = ListBuilder()
      ..following = ListBuilder());

    // Add userdata to firestore
    await sl
        .get<FirebaseFirestore>()
        .collection('users')
        .doc(credentials.user!.uid)
        .set(user.toMap());
  }

  @override
  Future<void> loginUser(
      {required String email, required String password}) async {
    await sl
        .get<FirebaseAuth>()
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
