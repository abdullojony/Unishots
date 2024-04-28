import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entity.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/post_grid.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/profile_header.dart';
import 'package:styled_widget/styled_widget.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage(this.user, {super.key});
  final UserEntity user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username).fontWeight(FontWeight.bold),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ProfileHeader(user, false),
            const Divider(height: 1),
            PostGrid(user.posts)
          ],
        ),
      ),
    );
  }
}
