import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram_clone/core/widgets/custom_text_form_field.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/login_button.dart';
import 'package:styled_widget/styled_widget.dart';

class SignupForm extends HookWidget {
  SignupForm(this.signup, {super.key});
  final _formKey = GlobalKey<FormState>();
  final Function(String, String, String, String) signup;

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');
    final usernameController = useTextEditingController(text: '');
    final bioController = useTextEditingController(text: '');

    void doSignup() {
      if (_formKey.currentState!.validate()) {
        FocusScope.of(context).unfocus();
        signup(emailController.text, passwordController.text,
            usernameController.text, bioController.text);
      }
    }

    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              hint: 'Enter your username',
              controller: usernameController,
            ),
            CustomTextFormField(
              hint: 'Enter your email',
              inputType: TextInputType.emailAddress,
              controller: emailController,
            ).padding(vertical: 24),
            CustomTextFormField(
              hint: 'Enter your password',
              controller: passwordController,
              isPassword: true,
            ),
            CustomTextFormField(
              hint: 'Enter your bio',
              controller: bioController,
              isRequred: false,
            ).padding(vertical: 24),
            LoginButton(text: 'Sign up', onTap: doSignup),
          ],
        ));
  }
}
