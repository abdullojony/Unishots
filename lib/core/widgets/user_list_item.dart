import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/features/home/presentation/pages/home_screen.dart';
import 'package:instagram_clone/features/profile/presentation/pages/profile_screen.dart';

class UserListItem extends StatelessWidget {
  const UserListItem(this.user, {super.key});
  final QueryDocumentSnapshot user;

  @override
  Widget build(BuildContext context) {
    final currentUserId = context
        .dependOnInheritedWidgetOfExactType<HomeResources>()!
        .currentUser
        .userId;

    return ListTile(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        final userId = user['userId'];

        return ProfileScreen(
          userId: userId,
          isCurrentUser: userId == currentUserId,
        );
      })),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user['profileImage']),
        radius: 16,
      ),
      title: Text(user['username']),
    );
  }
}
