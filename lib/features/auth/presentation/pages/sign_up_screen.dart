import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/features/auth/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: backIcon,
        ),
        title: const Text('Sign up'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: SingleChildScrollView(
          child: SignUpForm(),
        ),
      ),
    );
  }
}
