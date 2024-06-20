import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:TryOn/features/auth/presentation/widgets/login_form.dart';
import 'package:TryOn/features/auth/presentation/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        child: Scaffold(
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
                          style: TextStyle(
                              color: Colors.grey[700], fontSize: 16.sp),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/signUp');
                            },
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
        ),
      ),
    );
  }
}
