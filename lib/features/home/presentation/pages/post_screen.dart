import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/core/widgets/loading_wrapper.dart';
import 'package:instagram_clone/features/profile/presentation/riverpod/profile_provider.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostScreen extends HookConsumerWidget {
  const PostScreen({super.key, required this.postImage});
  final Uint8List postImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    final descriptionController = useTextEditingController(text: '');

    // hooks to manage loading state
    final requestPending = useState<Future<void>?>(null);
    final snapshot = useFuture(requestPending.value);

    void post() {
      requestPending.value = sl
          .get<FirestoreRepositories>()
          .uploadPost(
              userId: userData.value!.userId,
              username: userData.value!.username,
              profileImageUrl: userData.value!.photoUrl,
              postImage: postImage,
              description: descriptionController.text)
          .then((value) => Navigator.of(context).pop(),
              onError: (error) => sl
                  .get<CoreRepositories>()
                  .showSnackBar(context, message: error.toString()));
    }

    return LoadingWrapper(
      isLoading: snapshot.connectionState == ConnectionState.waiting,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New post'),
          centerTitle: false,
          actions: [
            TextButton(onPressed: post, child: const Text('Post').fontSize(18)),
          ],
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (userData case AsyncValue(:final value) when value != null)
              CircleAvatar(
                backgroundImage: NetworkImage(value.photoUrl),
              ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
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
      ),
    );
  }
}
