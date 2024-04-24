import 'dart:typed_data';

import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto(this.image, this.imageUrl, this.selectImage, {super.key});
  final Uint8List? image;
  final String imageUrl;
  final Function() selectImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image == null
            ? CircleAvatar(radius: 64, backgroundImage: NetworkImage(imageUrl))
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
