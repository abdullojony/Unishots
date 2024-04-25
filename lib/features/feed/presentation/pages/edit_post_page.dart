import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/core/widgets/loading_wrapper.dart';
import 'package:instagram_clone/features/feed/domain/entities/post_entity.dart';
import 'package:styled_widget/styled_widget.dart';

class EditPostPage extends HookWidget {
  const EditPostPage(this.post, {super.key});
  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    final descriptionController =
        useTextEditingController(text: post.description);

    // hooks to manage loading state
    final requestPending = useState<Future<void>?>(null);
    final snapshot = useFuture(requestPending.value);

    void submit() {
      FocusScope.of(context).unfocus();
      requestPending.value = sl
          .get<FirestoreRepositories>()
          .updatePost(
              postId: post.postId, description: descriptionController.text)
          .then((value) => Navigator.of(context).pop(),
              onError: (error) => sl
                  .get<CoreRepositories>()
                  .showSnackBar(context, message: error.toString()));
    }

    return LoadingWrapper(
      isLoading: snapshot.connectionState == ConnectionState.waiting,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit post'),
          centerTitle: false,
          actions: [
            TextButton(
                onPressed: submit, child: const Text('Edit').fontSize(18)),
          ],
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(post.profileImageUrl),
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
                    image: NetworkImage(post.postUrl),
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
