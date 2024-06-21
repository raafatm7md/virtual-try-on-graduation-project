import 'package:TryOn/config/routes/app_routes.dart';
import 'package:TryOn/core/utilits/functions/bloc_observer.dart';
import 'package:TryOn/core/utilits/functions/service_locator.dart';
import 'package:TryOn/features/tryon/presentation/manager/camera_kit_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/firebase/firebase_options.dart';
import 'config/theme/app_theme.dart';
import 'core/utilits/functions/api_service.dart';
import 'core/utilits/functions/shared_pref.dart';
import 'features/profile/presentation/manager/profile_cubit.dart';
import 'features/wishlist/presentation/manager/wishlist_cubit.dart';

Future<void> main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  ApiService.init();
  Bloc.observer = MyBlocObserver();
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

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => CameraKitCubit()..initCameraKit(),
            lazy: false),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => WishlistCubit())
      ],
      child: ScreenUtilInit(
        designSize: MediaQuery.of(context).orientation == Orientation.portrait
            ? const Size(430, 898)
            : const Size(1000, 900),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          title: 'Prova 3D',
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          initialRoute: '/',
          routes: appRoutes,
        ),
      ),
    );
  }
}
