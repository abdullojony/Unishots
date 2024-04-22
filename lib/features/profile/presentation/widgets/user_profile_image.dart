import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage(this.url, {required this.isCurrentUser, super.key});
  final String url;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return isCurrentUser
        ? CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(url),
            radius: 40,
          )
        : CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(url),
            radius: 40,
          );
  }
}
