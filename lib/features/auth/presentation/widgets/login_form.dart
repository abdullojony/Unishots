import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram_clone/core/widgets/custom_text_form_field.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/login_button.dart';

class LoginForm extends HookWidget {
  LoginForm(this.login, {super.key});
  final _formKey = GlobalKey<FormState>();
  final Function(String, String) login;

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');

    void doLogin() {
      if (_formKey.currentState!.validate()) {
        FocusScope.of(context).unfocus();
        login(emailController.text, passwordController.text);
      }
    }

    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: emailController,
              hint: 'Enter your email',
              inputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 24),
            CustomTextFormField(
                controller: passwordController,
                hint: 'Enter your password',
                isPassword: true),
            const SizedBox(height: 24),
            LoginButton(text: 'Login', onTap: doLogin),
          ],
        ));
  }
}
