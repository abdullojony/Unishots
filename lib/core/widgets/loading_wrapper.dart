import 'package:flutter/material.dart';

class LoadingWrapper extends StatelessWidget {
  const LoadingWrapper(
      {super.key, required this.child, required this.isLoading});
  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Visibility(
            visible: isLoading,
            child: SafeArea(
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Theme.of(context)
                      .colorScheme
                      .secondaryContainer
                      .withOpacity(0.35),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator()),
            ))
      ],
    );
  }
}
