import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/core/widgets/loading_wrapper.dart';
import 'package:instagram_clone/features/auth/data/repositories/auth_repositories.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/login_form.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/signup_option.dart';
import 'package:instagram_clone/core/widgets/unishots_logo.dart';
import 'package:instagram_clone/features/home/data/riverpod/home_provider.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requestPending = useState<Future?>(null);
    final snapshot = useFuture(requestPending.value);

    void loginUser(String email, String password) {
      requestPending.value = sl
          .get<AuthRepositories>()
          .loginUser(email: email, password: password)
          .then((value) {
        ref
            .read(currentTabNotifierProvider.notifier)
            .update((state) => TabItem.profile);
        ref.invalidate(currentUserProvider);
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
                Flexible(flex: 2, child: Container()),
                const UnishotsLogo(height: 60),
                const SizedBox(height: 64),
                LoginForm(loginUser),
                const SizedBox(height: 12),
                Flexible(flex: 2, child: Container()),
                const SignupOption(),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
