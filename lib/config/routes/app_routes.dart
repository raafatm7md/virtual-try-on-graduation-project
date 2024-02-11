import 'package:TryOn/features/login/presentation/pages/login_screen.dart';
import 'package:TryOn/features/login/presentation/pages/reset_password_screen.dart';
import 'package:TryOn/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => OnBoardingScreen(),
  '/login': (context) => LoginScreen(),
  '/resetPassword': (context) => ResetPasswordScreen(),
};
