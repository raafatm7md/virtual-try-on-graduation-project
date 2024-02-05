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
                Image(
                  image: AssetImage(AppImageAsset.logo),
                  height: 130,
                  width: 130,
                ),
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Welcome to TryOn',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        appTextFormField(
                          fieldController: _emailController,
                          inputType: TextInputType.emailAddress,
                          hintText: 'Enter email address',
                        ),
                        Text(
                          'Password',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        appTextFormField(
                            fieldController: _passwordController,
                            inputType: TextInputType.visiblePassword,
                            hintText: 'Enter your password',
                            suffix: Icon(
                              Icons.visibility_outlined,
                              size: 25,
                            )),
                        Container(
                          height: 35.0,
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                foregroundColor: AppColor.secondaryColor),
                            child: Text(
                              'Forgot Password?',
                            ),
                          ),
                        ),
                      ],
                    )),
                appButton(
                  text: 'Log In',
                  onPressed: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: AppColor.secondaryColor),
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
