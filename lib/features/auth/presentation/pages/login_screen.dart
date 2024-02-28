import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/core/constants/images.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/core/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 11.7,
                      bottom: 30.0),
                  child: const Image(
                    image: AssetImage(AppImageAsset.logo),
                    height: 170,
                    width: 170,
                  ),
                ),
                Text(
                  'Login',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 30),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Welcome to TryOn',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextFormField(
                          context,
                          type: 'Email',
                          fieldController: _emailController,
                          inputType: TextInputType.emailAddress,
                          hintText: 'Enter your email address',
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        AppTextFormField(
                          context,
                          type: 'Password',
                          fieldController: _passwordController,
                          inputType: TextInputType.visiblePassword,
                          hintText: 'Enter your password',
                          suffix: const Icon(
                            Icons.visibility_outlined,
                            size: 25,
                          ),
                        ),
                        SizedBox(
                          height: 35.0,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/resetPassword');
                            },
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                foregroundColor: AppColors.secondaryColor),
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                AppButton(
                  text: 'Log In',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.grey[700], fontSize: 16),
                    ),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor: AppColors.secondaryColor),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
