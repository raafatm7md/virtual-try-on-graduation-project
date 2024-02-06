import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/core/widgets/text_form_field.dart';
import 'package:TryOn/features/login/presentation/pages/otp_screen.dart';
import 'package:flutter/material.dart';

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
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: padding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Enter your email address to reset your password',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30.0,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      appTextFormField(
                        context,
                        type: 'Email',
                        fieldController: _emailController,
                        inputType: TextInputType.emailAddress,
                        hintText: 'Enter your Email',
                      )
                    ],
                  )),
              SizedBox(
                height: 30.0,
              ),
              appButton(
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
