import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UnishotsLogo extends StatelessWidget {
  const UnishotsLogo({super.key, this.height = 64});
  final double height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/unishots.svg',
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.onSurface,
        BlendMode.srcIn,
      ),
      height: height,
    );
  }
}
