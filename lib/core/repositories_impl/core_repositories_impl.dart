import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';

class CoreRepositoriesImpl implements CoreRepositories {
  @override
  Future<Uint8List?> pickImage({required ImageSource source}) async {
    final ImagePicker imagePicker = ImagePicker();

    XFile? file = await imagePicker.pickImage(
        source: source, imageQuality: 85, maxHeight: 1024, maxWidth: 1024);

    return await file?.readAsBytes();
  }

  @override
  void showSnackBar(BuildContext context,
      {required String message,
      Duration duration = const Duration(seconds: 2)}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: duration),
    );
  }
}
