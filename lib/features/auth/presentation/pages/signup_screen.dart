import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/core/widgets/loading_wrapper.dart';
import 'package:instagram_clone/features/auth/domain/repositories/auth_repositories.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/login_option.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/profile_photo.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/signup_form.dart';
import 'package:instagram_clone/core/widgets/unishots_logo.dart';
import 'package:instagram_clone/features/home/data/riverpod/home_provider.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';

class SignupScreen extends HookConsumerWidget {
  const SignupScreen({super.key});

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

    Future<void> signup(
        String email, String password, String username, String bio) async {
      requestPending.value = sl
          .get<AuthRepositories>()
          .signupUser(
              email: email,
              password: password,
              username: username,
              bio: bio,
              profileImage: profileImage.value)
          .then((user) {
        ref
            .read(currentTabNotifierProvider.notifier)
            .update((state) => TabItem.profile);
        ref.read(currentUserProvider.notifier).signup(user);
        Navigator.of(context).pop();
      }, onError: (error) {
        String e = error.toString();
        sl
            .get<CoreRepositories>()
            .showSnackBar(context, message: e.substring(e.indexOf(' ') + 1));
      });
    }

    return Scaffold(
      body: LoadingWrapper(
        isLoading: snapshot.connectionState == ConnectionState.waiting,
        child: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(),
                  ),
                  const UnishotsLogo(height: 60),
                  const SizedBox(height: 64),
                  ProfilePhoto(profileImage.value, selectImage),
                  const SizedBox(height: 24),
                  SignupForm(signup),
                  const SizedBox(height: 12),
                  Flexible(flex: 2, child: Container()),
                  const LoginOption(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
