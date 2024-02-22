import 'package:TryOn/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final String text;
  final void Function() onPressed;
  const AppButton(
      {super.key,
      this.color = AppColors.primaryColor,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: color,
            fixedSize: Size(double.maxFinite, 50),
            alignment: AlignmentDirectional.center,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ));
    ;
  }
}
