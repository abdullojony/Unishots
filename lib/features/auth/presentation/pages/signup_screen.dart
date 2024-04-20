import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/core/widgets/loading_wrapper.dart';
import 'package:instagram_clone/core/widgets/text_input_field.dart';
import 'package:instagram_clone/features/auth/repositories/auth_repositories.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/instagram_logo.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/login_button.dart';
import 'package:instagram_clone/features/profile/presentation/riverpod/profile_provider.dart';
import 'package:styled_widget/styled_widget.dart';

class SignupScreen extends HookConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');
    final usernameController = useTextEditingController(text: '');
    final bioController = useTextEditingController(text: '');
    final profileImage = useState<Uint8List?>(null);
    final requestPending = useState<Future?>(null);
    final snapshot = useFuture(requestPending.value);

    void selectImage() async {
      sl
          .get<CoreRepositories>()
          .pickImage(source: ImageSource.gallery)
          .then((image) {
        if (image != null) {
          profileImage.value = image;
        }
      }).catchError((error) => null);
    }

    Future<void> signup() async {
      FocusScope.of(context).unfocus();
      requestPending.value = sl
          .get<AuthRepositories>()
          .signupUser(
              email: emailController.text,
              password: passwordController.text,
              username: usernameController.text,
              bio: bioController.text,
              profileImage: profileImage.value!)
          .then((value) {
        ref.invalidate(currentUserProvider);
        Navigator.of(context).pop();
      },
              onError: (error) => sl
                  .get<CoreRepositories>()
                  .showSnackBar(context, message: error.toString()));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  const InstagramLogo(),
                  const SizedBox(height: 64),
                  Stack(
                    children: [
                      profileImage.value == null
                          ? const CircleAvatar(
                              radius: 64,
                              backgroundImage: NetworkImage(
                                  'https://i.stack.imgur.com/l60Hf.png'))
                          : CircleAvatar(
                              radius: 64,
                              backgroundImage:
                                  MemoryImage(profileImage.value!)),
                      Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                          onPressed: selectImage,
                          icon: const Icon(Icons.add_a_photo),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  TextInputField(
                    hintText: 'Enter your username',
                    textInputType: TextInputType.text,
                    textEditingController: usernameController,
                  ),
                  TextInputField(
                    hintText: 'Enter your email',
                    textInputType: TextInputType.emailAddress,
                    textEditingController: emailController,
                  ).padding(vertical: 24),
                  TextInputField(
                    hintText: 'Enter your password',
                    textInputType: TextInputType.text,
                    textEditingController: passwordController,
                    isPass: true,
                  ),
                  TextInputField(
                    hintText: 'Enter your bio',
                    textInputType: TextInputType.text,
                    textEditingController: bioController,
                  ).padding(vertical: 24),
                  LoginButton(text: 'Sign up', onTap: signup),
                  const SizedBox(height: 12),
                  Flexible(flex: 2, child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text('Already have an account?'),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: const Text(
                            ' Login.',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
