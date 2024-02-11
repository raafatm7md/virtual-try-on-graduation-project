import 'package:TryOn/core/constants/colors.dart';
import 'package:flutter/material.dart';

final appTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    useMaterial3: true,
    primarySwatch: Colors.deepOrange,
    textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.black),
    ));
