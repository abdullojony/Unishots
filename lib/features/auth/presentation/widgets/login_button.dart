import 'package:flutter/material.dart';
import 'package:instagram_clone/config/theme/theme.dart';
import 'package:styled_widget/styled_widget.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.text, this.onTap});
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          color: blueColor,
        ),
        child: Text(text).textColor(Theme.of(context).primaryColor),
      ),
    );
  }
}
