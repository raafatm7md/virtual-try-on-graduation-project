import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/core/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

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
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text('New Password'),
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
                'Create a new password',
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
                        type: 'Password',
                        fieldController: _passwordController,
                        inputType: TextInputType.emailAddress,
                        hintText: 'Enter a new password',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      appTextFormField(
                        context,
                        type: 'Confirm Password',
                        fieldController: _passwordConfirmController,
                        inputType: TextInputType.emailAddress,
                        hintText: 'Please re-enter your password',
                      )
                    ],
                  )),
              SizedBox(
                height: 30.0,
              ),
              appButton(
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
