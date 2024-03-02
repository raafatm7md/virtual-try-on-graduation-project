import 'package:TryOn/features/auth/presentation/widgets/login_body_phone.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBodyPhone(),
    );
  }
}
