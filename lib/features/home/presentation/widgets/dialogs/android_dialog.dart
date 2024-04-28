import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/home/presentation/pages/post_screen.dart';
import 'package:styled_widget/styled_widget.dart';

class AndroidDialog extends StatelessWidget {
  const AndroidDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Choose a method'),
        ],
      ),
      actions: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text('Camera')
                        .fontSize(18)
                        .textColor(Theme.of(context).colorScheme.primary))
                .gestures(onTap: () {
              sl.get<CoreRepositories>().pickImage(source: ImageSource.camera).then(
                  (value) {
                if (value != null) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (_) => PostScreen(postImage: value)));
                } else {
                  Navigator.of(context).pop();
                }
              },
                  onError: (e) => sl
                      .get<CoreRepositories>()
                      .showSnackBar(context, message: e.toString()));
            }),
            const Divider(),
            Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text('Gallery')
                        .fontSize(18)
                        .textColor(Theme.of(context).colorScheme.primary))
                .gestures(onTap: () {
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
              },
                      onError: (e) => sl
                          .get<CoreRepositories>()
                          .showSnackBar(context, message: e.toString()));
            }),
          ],
        )
      ],
    );
  }
}
