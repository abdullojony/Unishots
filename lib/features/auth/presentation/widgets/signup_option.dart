import 'package:flutter/material.dart';
import 'package:instagram_clone/features/auth/presentation/pages/signup_screen.dart';

class SignupOption extends StatelessWidget {
  const SignupOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: const Text(
            'Dont have an account?',
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => const SignupScreen())),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const Text(
              ' Signup.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
