import 'package:TryOn/core/constants/color.dart';
import 'package:flutter/material.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
  useMaterial3: true,
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    titleSmall: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
  ),
);
