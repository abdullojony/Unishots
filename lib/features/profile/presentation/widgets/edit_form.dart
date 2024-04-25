import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram_clone/core/widgets/custom_text_form_field.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/login_button.dart';
import 'package:styled_widget/styled_widget.dart';

class EditForm extends HookWidget {
  EditForm(this.username, this.bio, this.submit, {super.key});
  final _formKey = GlobalKey<FormState>();
  final String username;
  final String bio;
  final Function(String) submit;

  @override
  Widget build(BuildContext context) {
    final bioController = useTextEditingController(text: bio);

    void doSubmit() {
      if (_formKey.currentState!.validate()) {
        FocusScope.of(context).unfocus();
        submit(bioController.text);
      }
    }

    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              hint: 'Enter your bio',
              controller: bioController,
              isRequred: false,
            ).padding(vertical: 24),
            LoginButton(text: 'Submit', onTap: doSubmit),
          ],
        ));
  }
}
