import 'package:TryOn/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:TryOn/features/auth/presentation/pages/login_screen.dart';
import 'package:TryOn/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:TryOn/features/layout/presentation/pages/layout_page.dart';
import 'package:TryOn/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:TryOn/features/tryon/presentation/pages/tryon_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => const OnBoardingScreen(),
  '/login': (context) => const LoginScreen(),
  '/resetPassword': (context) => const ForgotPasswordScreen(),
  '/signUp': (context) => const SignUpScreen(),
  '/home': (context) => const LayoutPage(),
  '/tryOn': (context) => const TryOnScreen(),
};
