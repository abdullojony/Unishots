import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/home/presentation/pages/post_screen.dart';

class CupertinoDialog extends StatelessWidget {
  const CupertinoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(title: const Text('Choose a method'), actions: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoDialogAction(
            onPressed: () {
              sl
                  .get<CoreRepositories>()
                  .pickImage(source: ImageSource.camera)
                  .then((value) {
                if (value != null) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => PostScreen(postImage: value)));
                } else {
                  Navigator.of(context).pop();
                }
              });
            },
            child: const Text('Camera'),
          ),
          const Divider(thickness: 0.3),
          CupertinoDialogAction(
            onPressed: () async {
              sl
                  .get<CoreRepositories>()
                  .pickImage(source: ImageSource.gallery)
                  .then((value) {
                if (value != null) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => PostScreen(postImage: value)));
                } else {
                  Navigator.of(context).pop();
                }
              });
            },
            child: const Text('Gallery'),
          ),
        ],
      ),
    ]);
  }
}
