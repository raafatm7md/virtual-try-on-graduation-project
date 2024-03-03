import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/core/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextFormField(
                  type: 'Email',
                  fieldController: _emailController,
                  inputType: TextInputType.emailAddress,
                  hintText: 'Enter your email address',
                ),
                SizedBox(
                  height: 20.h,
                ),
                AppTextFormField(
                  type: 'Password',
                  isPassword: true,
                  fieldController: _passwordController,
                  inputType: TextInputType.visiblePassword,
                  hintText: 'Enter your password',
                  suffix: Icon(
                    Icons.visibility_outlined,
                    size: 25.sp,
                  ),
                ),
                SizedBox(
                  height: 35.h,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/resetPassword');
                    },
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        foregroundColor: AppColors.secondaryColor),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            )),
        SizedBox(
          height: 20.h,
        ),
        AppButton(
          text: 'Log In',
          onPressed: () {},
        ),
      ],
    );
  }
}
