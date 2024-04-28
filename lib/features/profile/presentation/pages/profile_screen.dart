import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/auth/data/models/user_model.dart';
import 'package:instagram_clone/features/profile/data/riverpod/profile_provider.dart';
import 'package:instagram_clone/features/profile/presentation/pages/current_profile_page.dart';
import 'package:instagram_clone/features/profile/presentation/pages/profile_page.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen(
      {required this.userId, required this.isCurrentUser, super.key});
  final String userId;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStream = ref.watch(userStreamProvider(userId));

    return userStream.when(
      data: (userDoc) {
        final user = UserModel.fromDocument(userDoc);
        return isCurrentUser ? CurrentProfilePage(user) : ProfilePage(user);
      },
      loading: () => const LoadingWidget(),
      error: (error, s) => FailedWidget(error: error.toString()),
    );
  }
}
