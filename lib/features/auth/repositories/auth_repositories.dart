import 'dart:typed_data';

abstract class AuthRepositories {
  Future<void> signupUser(
      {required String email,
      required String password,
      required String username,
      required String bio,
      required Uint8List profileImage});

  Future<void> loginUser({required String email, required String password});
}
