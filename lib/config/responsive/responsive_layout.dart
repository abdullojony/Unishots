import 'package:flutter/material.dart';
import 'package:instagram_clone/config/constants/constants.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout(
      {super.key,
      required this.webScreenLayout,
      required this.mobileScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        // web layout
        return webScreenLayout;
      } else {
        // mobile
        return mobileScreenLayout;
      }
    });
  }
}
