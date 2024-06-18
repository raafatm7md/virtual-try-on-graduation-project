import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/core/widgets/custom_loading.dart';
import 'package:TryOn/core/widgets/text_form_field.dart';
import 'package:TryOn/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var loginCubit = LoginCubit.get(context);
        return Column(
          children: [
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
                    SizedBox(height: 20.h),
                    AppTextFormField(
                      type: 'Password',
                      isPassword: loginCubit.passwordInvisibility,
                      fieldController: _passwordController,
                      inputType: TextInputType.visiblePassword,
                      hintText: 'Enter your password',
                      suffix: IconButton(
                        onPressed: () => loginCubit.changePasswordVisibility(),
                        icon: Icon(
                          loginCubit.suffix,
                          size: 25.sp,
                        ),
                      ),
                      validator: (value) {
                        if (value!.length < 4) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onSubmit: (value) {
                        if (_formKey.currentState!.validate()) {
                          loginCubit.login(
                              username: _usernameController.text,
                              password: _passwordController.text);
                        }
                      },
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
            SizedBox(height: 20.h),
            state is LoginLoading
                ? const CustomLoadingIndicator()
                : AppButton(
                    text: 'Log In',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        loginCubit.login(
                            username: _usernameController.text,
                            password: _passwordController.text);
                      }
                    },
                  ),
          ],
        );
      },
    );
  }
}
