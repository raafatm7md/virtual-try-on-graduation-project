import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/core/widgets/text_form_field.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:TryOn/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, size: 26.sp),
        ),
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                'Enter your email address to reset your password',
                style:
                    TextStyle(fontSize: 15.8.sp, fontWeight: FontWeight.bold),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OTPScreen(),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, size: 26.sp),
        ),
        title: const Text('OTP'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                'Enter the OTP sent to your email address',
                style:
                    TextStyle(fontSize: 15.8.sp, fontWeight: FontWeight.bold),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewPasswordScreen(),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, size: 26.sp),
        ),
        title: const Text('New Password'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text(
                'Create a new password',
                style:
                    TextStyle(fontSize: 15.8.sp, fontWeight: FontWeight.bold),
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
                  Navigator.popUntil(context, ModalRoute.withName('/login'));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
