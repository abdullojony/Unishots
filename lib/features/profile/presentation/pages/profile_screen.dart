import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/profile/presentation/pages/profile_page.dart';
import 'package:instagram_clone/features/profile/presentation/riverpod/profile_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key, required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider(userId));

    return switch (userData) {
      AsyncData(:final value) => ProfilePage(userData: value),
      AsyncError(:final error) => FailedWidget(error: error.toString()),
      _ => const LoadingWidget(),
    };
  }
}
