import 'dart:typed_data';

import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto(this.image, this.selectImage, {super.key});
  final Function() selectImage;
  final Uint8List? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image == null
            ? const CircleAvatar(
                radius: 64,
                backgroundImage: AssetImage('assets/profile_placeholder.png'))
            : CircleAvatar(radius: 64, backgroundImage: MemoryImage(image!)),
        Positioned(
          bottom: -10,
          left: 80,
          child: IconButton(
            onPressed: selectImage,
            icon: const Icon(Icons.add_a_photo),
          ),
        )
      ],
    );
  }
}
