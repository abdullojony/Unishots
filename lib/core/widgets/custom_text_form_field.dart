import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTextFormField extends HookWidget {
  const CustomTextFormField(
      {required this.controller,
      this.inputType = TextInputType.text,
      this.hint,
      this.isRequred = true,
      this.isPassword = false,
      this.onSubmitted,
      super.key});
  final TextEditingController controller;
  final TextInputType inputType;
  final bool isRequred;
  final bool isPassword;
  final String? hint;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    final hide = useState(controller.text.isEmpty);

    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      obscureText: isPassword,
      validator: (value) {
        if (isRequred && (value == null || value.isEmpty)) {
          return 'Required field';
        } else if (isPassword && (value == null || value.length < 6)) {
          return 'Password is too short';
        }
        return null;
      },
      onChanged: (value) {
        if (hide.value || value.isEmpty) {
          hide.value = value.isEmpty;
        }
      },
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        fillColor: Theme.of(context).colorScheme.surface,
        filled: true,
        hintText: hint,
        suffixIcon: !hide.value
            ? IconButton(
                onPressed: () {
                  controller.clear();
                  hide.value = true;
                },
                icon: const Icon(Icons.cancel, size: 20))
            : null,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
      ),
    );
  }
}
