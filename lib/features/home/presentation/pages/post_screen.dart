import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:styled_widget/styled_widget.dart';

class PostScreen extends HookWidget {
  const PostScreen({super.key, required this.postImage});
  final Uint8List postImage;

  @override
  Widget build(BuildContext context) {
    final descriptionController = useTextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(
        title: const Text('New post'),
        centerTitle: false,
        actions: [
          TextButton(onPressed: () {}, child: const Text('Post').fontSize(18)),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Write a caption...',
                border: InputBorder.none,
              ),
              maxLines: 8,
            ),
          ),
          SizedBox(
            width: 45,
            height: 45,
            child: AspectRatio(
              aspectRatio: 487 / 451,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: MemoryImage(postImage),
                  fit: BoxFit.fill,
                  alignment: FractionalOffset.topCenter,
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
