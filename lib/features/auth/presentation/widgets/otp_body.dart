import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/features/auth/presentation/manager/forgot_password/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpBody extends StatelessWidget {
  OtpBody({super.key});

  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Text(
          'Enter the OTP sent to your email address',
          style: TextStyle(fontSize: 15.8.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30.h),
        Form(
            key: _formKey,
            child: Column(
              children: [
                OtpTextField(
                  numberOfFields: 5,
                  focusedBorderColor: AppColors.secondaryColor,
                  cursorColor: AppColors.secondaryColor,
                  textStyle: TextStyle(fontSize: 20.sp),
                  enabledBorderColor: AppColors.grey,
                  onSubmit: (String verificationCode) {
                    _otpController.text = verificationCode;
                  }, // end onSubmit
                ),
              ],
            )),
        SizedBox(height: 30.h),
        AppButton(
          text: 'SEND',
          onPressed: () {
            ForgotPasswordCubit.get(context).sendOtp();
          },
        )
      ],
    );
  }
}
