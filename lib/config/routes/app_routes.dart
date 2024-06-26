import 'package:TryOn/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:TryOn/features/auth/presentation/pages/login_screen.dart';
import 'package:TryOn/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:TryOn/features/checkout/presentation/pages/checkout_screen.dart';
import 'package:TryOn/features/checkout/presentation/pages/checkout_success.dart';
import 'package:TryOn/features/checkout/presentation/pages/payment_method.dart';
import 'package:TryOn/features/layout/presentation/pages/layout_page.dart';
import 'package:TryOn/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:TryOn/features/product/presentation/pages/product_details.dart';
import 'package:TryOn/features/search/presentation/pages/search_screen.dart';
import 'package:TryOn/features/tryon/presentation/pages/tryon_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => const OnBoardingScreen(),
  '/login': (context) => const LoginScreen(),
  '/resetPassword': (context) => const ForgotPasswordScreen(),
  '/signUp': (context) => const SignUpScreen(),
  '/home': (context) => const LayoutPage(),
  '/tryOn': (context) => const TryOnScreen(),
  '/productDetails': (context) => const ProductDetailsScreen(),
  '/search': (context) => const SearchScreen(),
  '/checkout': (context) => const CheckoutScreen(),
  '/checkoutSuccess': (context) => const CheckoutSuccessScreen(),
  '/paymentMethod': (context) => const PaymentMethodScreen(),
};
