import 'package:TryOn/core/constants/colors.dart';
import 'package:flutter/material.dart';

Widget appButton({
  Color color = AppColors.primaryColor,
  required String text,
  required void Function() onPressed,
}) =>
    ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: color,
            fixedSize: Size(double.maxFinite, 50),
            alignment: AlignmentDirectional.center,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8))),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ));