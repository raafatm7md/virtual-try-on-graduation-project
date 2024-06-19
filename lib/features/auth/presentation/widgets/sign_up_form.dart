import 'dart:io';

import 'package:TryOn/core/constants/images.dart';
import 'package:TryOn/core/utilits/functions/is_email.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/core/widgets/custom_loading.dart';
import 'package:TryOn/core/widgets/text_form_field.dart';
import 'package:TryOn/features/auth/presentation/manager/sign_up/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        var signUpCubit = SignUpCubit.get(context);
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
                    backgroundImage: signUpCubit.profileImage == null
                        ? const AssetImage(AppImageAsset.personAvatar)
                        : FileImage(File(signUpCubit.profileImage!))
                            as ImageProvider,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      signUpCubit.getProfileImage();
                    },
                    icon: CircleAvatar(
                      backgroundColor: const Color(0xFFF0F0F0),
                      radius: 25.r,
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
                      type: 'Username',
                      fieldController: _usernameController,
                      inputType: TextInputType.name,
                      hintText: 'Enter your username',
                      validator: (value) {
                        if (value!.length < 3) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15.h),
                    AppTextFormField(
                      type: 'Email',
                      fieldController: _emailController,
                      inputType: TextInputType.emailAddress,
                      hintText: 'Enter your email address',
                      validator: (value) {
                        if (isEmail(value!)) {
                          return null;
                        }
                        return 'Please enter a valid email';
                      },
                    ),
                    SizedBox(height: 15.h),
                    AppTextFormField(
                      type: 'Phone Number',
                      fieldController: _phoneController,
                      inputType: TextInputType.phone,
                      hintText: 'Enter your phone number',
                      validator: (value) {
                        if (value!.length < 3) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15.h),
                    AppTextFormField(
                      type: 'Password',
                      isPassword: true,
                      fieldController: _passwordController,
                      inputType: TextInputType.visiblePassword,
                      hintText: 'Enter your password',
                      validator: (value) {
                        if (value!.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15.h),
                    AppTextFormField(
                      type: 'Confirm Password',
                      isPassword: true,
                      fieldController: _confirmPasswordController,
                      inputType: TextInputType.visiblePassword,
                      hintText: 'Confirm your password',
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      onSubmit: (value) {
                        if (_formKey.currentState!.validate()) {
                          signUpCubit.signup(
                            username: _usernameController.text,
                            email: _emailController.text,
                            phone: _phoneController.text,
                            password: _passwordController.text,
                            passwordConfirm: _confirmPasswordController.text,
                          );
                        }
                      },
                    ),
                  ],
                )),
            SizedBox(height: 30.h),
            state is SignUpLoading
                ? const CustomLoadingIndicator()
                : AppButton(
                    text: 'Sign Up',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        signUpCubit.signup(
                          username: _usernameController.text,
                          email: _emailController.text,
                          phone: _phoneController.text,
                          password: _passwordController.text,
                          passwordConfirm: _confirmPasswordController.text,
                        );
                      }
                    },
                  ),
          ],
        );
      },
    );
  }
}
