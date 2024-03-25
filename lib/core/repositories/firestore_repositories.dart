import 'dart:typed_data';

abstract class FirestoreRepositories {
  Future<void> uploadPost(
      {required String userId,
      required String username,
      required String profileImageUrl,
      required Uint8List postImage,
      required String description});
}
