import 'package:TryOn/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    useMaterial3: true,
    primarySwatch: Colors.deepOrange,
    textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
        titleSmall: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.black),
    ));
