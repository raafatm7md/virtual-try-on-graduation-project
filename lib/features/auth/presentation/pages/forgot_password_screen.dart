import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/features/auth/presentation/manager/forgot_password/forgot_password_cubit.dart';
import 'package:TryOn/features/auth/presentation/widgets/otp_body.dart';
import 'package:TryOn/features/auth/presentation/widgets/reset_password_body.dart';
import 'package:TryOn/features/auth/presentation/widgets/send_email_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
        if (state is SuccessState) {
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new, size: 26.sp),
              ),
              title: state is ResetPasswordState
                  ? const Text('New Password')
                  : state is SendOtpState
                      ? const Text('OTP')
                      : const Text('Forgot Password'),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: SingleChildScrollView(
                child: state is ResetPasswordState
                    ? ResetPasswordBody()
                    : state is SendOtpState
                        ? OtpBody()
                        : SendEmailBody(),
              ),
            ));
      }),
    );
  }
}
