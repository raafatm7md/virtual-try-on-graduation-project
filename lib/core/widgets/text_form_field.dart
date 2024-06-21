import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final String type;
  final TextEditingController fieldController;
  final TextInputType inputType;
  final String hintText;
  final bool isPassword;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmit;
  final bool enabled;
  const AppTextFormField({
    super.key,
    required this.type,
    required this.fieldController,
    required this.inputType,
    required this.hintText,
    this.isPassword = false,
    this.suffix,
    this.validator,
    this.onSubmit,
    this.enabled = true,
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
        TextFormField(
          enabled: enabled,
          obscureText: isPassword,
          controller: fieldController,
          keyboardType: inputType,
          validator: validator,
          onFieldSubmitted: onSubmit,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 16.sp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            contentPadding: EdgeInsetsDirectional.all(15.w),
            suffixIcon: suffix,
            // fillColor: Color(0xFFF1F1F1),
            // filled: true,
          ),
        ),
      ],
    );
  }
}
