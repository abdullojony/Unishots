import 'package:flutter/material.dart';

class FailedWidget extends StatelessWidget {
  const FailedWidget({this.error, super.key});
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error ?? 'Error'));
  }
}
