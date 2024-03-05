import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/features/auth/presentation/widgets/login_form.dart';
import 'package:TryOn/features/auth/presentation/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoWidget(),
                Text('Login',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 30.sp)),
                const SizedBox(height: 20.0),
                Text('Welcome to TryOn',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.sp)),
                SizedBox(height: 30.h),
                LoginForm(),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style:
                          TextStyle(color: Colors.grey[700], fontSize: 16.sp),
                    ),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor: AppColors.secondaryColor),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
