import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/core/widgets/text_form_field.dart';
import 'package:TryOn/features/auth/presentation/manager/forgot_password/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendEmailBody extends StatelessWidget {
  SendEmailBody({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Text(
          'Enter your email address to reset your password',
          style: TextStyle(fontSize: 15.8.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30.h),
        Form(
            key: _formKey,
            child: Column(
              children: [
                AppTextFormField(
                  type: 'Email',
                  fieldController: _emailController,
                  inputType: TextInputType.emailAddress,
                  hintText: 'Enter your Email',
                )
              ],
            )),
        SizedBox(height: 30.h),
        AppButton(
          text: 'SEND',
          onPressed: () {
            ForgotPasswordCubit.get(context).sendEmail();
          },
        )
      ],
    );
  }
}
