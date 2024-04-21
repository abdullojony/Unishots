import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedProfileImage extends StatelessWidget {
  const CachedProfileImage(this.url, {super.key});
  final String url;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey,
      backgroundImage: CachedNetworkImageProvider(
        url,
      ),
      radius: 40,
    );
  }
}
