import 'dart:math';

import 'package:TryOn/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final String type;
  final TextEditingController fieldController;
  final TextInputType inputType;
  final String hintText;
  final bool isPassword;
  final Widget? suffix;
  const AppTextFormField({
    super.key,
    required this.type,
    required this.fieldController,
    required this.inputType,
    required this.hintText,
    this.isPassword = false,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 2.0),
        SizedBox(
          height: max(50.h, 50.w),
          child: TextFormField(
            obscureText: isPassword,
            controller: fieldController,
            keyboardType: inputType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 16.sp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              isDense: true,
              suffixIcon: suffix,
              // fillColor: Color(0xFFF1F1F1),
              // filled: true,
            ),
          ),
        ),
      ],
    );
  }
}
