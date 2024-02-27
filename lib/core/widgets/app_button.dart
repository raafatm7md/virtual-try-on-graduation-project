import 'package:TryOn/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            fixedSize: Size(double.maxFinite, 50.h),
            alignment: AlignmentDirectional.center,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Text(
          text,
          style: TextStyle(fontSize: 16.sp),
        ));
  }
}
