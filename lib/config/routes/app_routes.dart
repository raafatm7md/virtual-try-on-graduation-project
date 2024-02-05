import 'package:TryOn/features/login/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/login': (context) => LoginScreen(),
};
