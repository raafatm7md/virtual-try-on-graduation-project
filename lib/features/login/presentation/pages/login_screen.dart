import 'package:TryOn/core/constants/color.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: padding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80.0, bottom: 30.0),
                  child: Image(
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
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Welcome to TryOn',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appTextFormField(
                          context,
                          type: 'Email',
                          fieldController: _emailController,
                          inputType: TextInputType.emailAddress,
                          hintText: 'Enter your email address',
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        appTextFormField(
                          context,
                          type: 'Password',
                          fieldController: _passwordController,
                          inputType: TextInputType.visiblePassword,
                          hintText: 'Enter your password',
                          suffix: Icon(
                            Icons.visibility_outlined,
                            size: 25,
                          ),
                        ),
                        Container(
                          height: 35.0,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/resetPassword');
                            },
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                foregroundColor: AppColor.secondaryColor),
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 20.0,
                ),
                appButton(
                  text: 'Log In',
                  onPressed: () {},
                ),
                SizedBox(
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
                            foregroundColor: AppColor.secondaryColor),
                        child: Text(
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
