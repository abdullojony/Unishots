import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

abstract class CoreRepositories {
  Future<Uint8List?> pickImage({required ImageSource source});

  void showSnackBar(BuildContext context,
      {required String message, Duration duration});
}
