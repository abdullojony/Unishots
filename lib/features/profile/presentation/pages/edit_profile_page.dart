import 'dart:typed_data';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/core/widgets/loading_wrapper.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entity.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/edit_form.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/user_photo.dart';
import 'package:styled_widget/styled_widget.dart';

class EditProfilePage extends HookConsumerWidget {
  const EditProfilePage(this.user, {super.key});
  final UserEntity user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileImage = useState<Uint8List?>(null);
    final requestPending = useState<Future?>(null);
    final snapshot = useFuture(requestPending.value);

    void selectImage() async {
      sl.get<CoreRepositories>().pickImage(source: ImageSource.gallery).then(
          (image) {
        if (image != null) {
          profileImage.value = image;
        }
      },
          onError: (e) => sl
              .get<CoreRepositories>()
              .showSnackBar(context, message: e.toString()));
    }

    Future<void> submit(String bio) async {
      requestPending.value = sl
          .get<FirestoreRepositories>()
          .updateInfo(
              userId: user.userId,
              bio: bio,
              profileImageUrl: user.profileImage,
              profileImage: profileImage.value)
          .then((user) {
        Navigator.of(context).pop();
      }, onError: (error) {
        String e = error.toString();
        sl
            .get<CoreRepositories>()
            .showSnackBar(context, message: e.substring(e.indexOf(' ') + 1));
      });
    }

    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Edit Profile').fontSize(18).fontWeight(FontWeight.bold),
      ),
      body: LoadingWrapper(
        isLoading: snapshot.connectionState == ConnectionState.waiting,
        child: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 64),
                  UserPhoto(profileImage.value, user.profileImage, selectImage),
                  const SizedBox(height: 24),
                  EditForm(user.username, user.bio, submit),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
