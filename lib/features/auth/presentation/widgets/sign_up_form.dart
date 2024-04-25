import 'package:TryOn/core/constants/images.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/core/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.h),
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 85.r,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: CircleAvatar(
                radius: 75.r,
                backgroundImage: const AssetImage(AppImageAsset.personAvatar),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  backgroundColor: const Color(0xFFF0F0F0),
                  radius: 28.r,
                  child: Icon(
                    Icons.image_outlined,
                    size: 32.sp,
                  ),
                ))
          ],
        ),
        SizedBox(height: 10.h),
        Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextFormField(
                    type: 'Name',
                    fieldController: _nameController,
                    inputType: TextInputType.name,
                    hintText: 'Enter your name'),
                SizedBox(height: 15.h),
                AppTextFormField(
                    type: 'Email',
                    fieldController: _emailController,
                    inputType: TextInputType.emailAddress,
                    hintText: 'Enter your email address'),
                SizedBox(height: 15.h),
                AppTextFormField(
                    type: 'Phone Number',
                    fieldController: _phoneController,
                    inputType: TextInputType.phone,
                    hintText: 'Enter your phone number'),
                SizedBox(height: 15.h),
                AppTextFormField(
                    type: 'Password',
                    isPassword: true,
                    fieldController: _passwordController,
                    inputType: TextInputType.visiblePassword,
                    hintText: 'Enter your password'),
                SizedBox(height: 15.h),
                AppTextFormField(
                    type: 'Confirm Password',
                    isPassword: true,
                    fieldController: _confirmPasswordController,
                    inputType: TextInputType.visiblePassword,
                    hintText: 'Confirm your password'),
              ],
            )),
        SizedBox(height: 30.h),
        AppButton(
          text: 'Sign Up',
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          },
        ),
      ],
    );
  }
}
