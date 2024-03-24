import 'dart:typed_data';

abstract class StorageRepositories {
  Future<String> uploadImage(
      {required String folderName,
      required Uint8List image,
      required bool isPost});
}
