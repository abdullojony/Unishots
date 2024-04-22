import 'package:flutter/material.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entitiy.dart';
import 'package:instagram_clone/features/profile/presentation/pages/profile_screen.dart';

class UserListItem extends StatelessWidget {
  const UserListItem(this.user, {super.key});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ProfileScreen(userId: user.userId))),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.profileImage),
        radius: 16,
      ),
      title: Text(user.username),
    );
  }
}
