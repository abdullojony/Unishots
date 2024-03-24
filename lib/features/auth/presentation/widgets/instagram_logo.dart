import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InstagramLogo extends StatelessWidget {
  const InstagramLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/ic_instagram.svg',
      colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onSurface, BlendMode.srcIn),
      height: 64,
    );
  }
}
