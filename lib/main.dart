import 'package:TryOn/config/routes/app_routes.dart';
import 'package:TryOn/features/login/presentation/pages/login_screen.dart';
import 'package:TryOn/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'config/theme/app_theme.dart';
import 'config/firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isPhone = MediaQuery.of(context).size.shortestSide < 550;

    if (isPhone) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }

    return MaterialApp(
      title: 'TryOn',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const OnBoardingScreen(),
      routes: appRoutes,
    );
  }
}
