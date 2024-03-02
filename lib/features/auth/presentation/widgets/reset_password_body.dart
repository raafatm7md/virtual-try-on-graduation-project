import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/core/widgets/text_form_field.dart';
import 'package:TryOn/features/auth/presentation/manager/forgot_password/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordBody extends StatelessWidget {
  ResetPasswordBody({super.key});

  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Text(
          'Create a new password',
          style: TextStyle(fontSize: 15.8.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30.h),
        Form(
            key: _formKey,
            child: Column(
              children: [
                AppTextFormField(
                  type: 'Password',
                  fieldController: _passwordController,
                  inputType: TextInputType.emailAddress,
                  hintText: 'Enter a new password',
                ),
                SizedBox(height: 20.h),
                AppTextFormField(
                  type: 'Confirm Password',
                  fieldController: _passwordConfirmController,
                  inputType: TextInputType.emailAddress,
                  hintText: 'Please re-enter your password',
                )
              ],
            )),
        SizedBox(height: 30.h),
        AppButton(
          text: 'CONFIRM',
          onPressed: () {
            ForgotPasswordCubit.get(context).resetPassword();
          },
        )
      ],
    );
  }
}
