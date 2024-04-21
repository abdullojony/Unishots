import 'dart:typed_data';

import 'package:instagram_clone/features/auth/domain/entities/user_entitiy.dart';

abstract class AuthRepositories {
  Future<UserEntity> signupUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List? profileImage});

  Future<void> loginUser({required String email, required String password});

  Future<void> signOut();
}
