import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class FollowButton extends StatelessWidget {
  final Function()? function;
  final Color? backgroundColor;
  final Color? borderColor;
  final String text;
  final Color? textColor;
  const FollowButton(
      {Key? key,
      this.backgroundColor,
      this.borderColor,
      required this.text,
      this.textColor,
      this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).primaryColor,
        border: Border.all(
          color: borderColor ?? Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      width: 250,
      height: 27,
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? Theme.of(context).primaryColorDark,
          fontWeight: FontWeight.bold,
        ),
      ),
    ).gestures(onTap: function);
  }
}
