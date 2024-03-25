import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram_clone/core/repositories/storage_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:uuid/uuid.dart';

class StorageRepositoriesImpl implements StorageRepositories {
  @override
  Future<String> uploadImage(
      {required String folderName,
      required Uint8List image,
      required bool isPost}) async {
    final String uid = sl.get<FirebaseAuth>().currentUser!.uid;

    Reference ref =
        sl.get<FirebaseStorage>().ref().child(folderName).child(uid);

    if (isPost) {
      final String id = const Uuid().v1();
      ref = ref.child(id);
    }

    final TaskSnapshot snapshot = await ref.putData(image);
    return await snapshot.ref.getDownloadURL();
  }
}
