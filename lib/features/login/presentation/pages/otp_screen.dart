import 'package:TryOn/core/constants/color.dart';
import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/core/widgets/text_form_field.dart';
import 'package:TryOn/features/login/presentation/pages/new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _OTPController = TextEditingController();

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
        title: Text('OTP'),
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
                'Enter the OTP sent to your email address',
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
                      OtpTextField(
                        numberOfFields: 5,
                        focusedBorderColor: AppColor.secondaryColor,
                        cursorColor: AppColor.secondaryColor,
                        textStyle: TextStyle(fontSize: 20),
                        enabledBorderColor: AppColor.grey,
                        onSubmit: (String verificationCode) {
                          _OTPController.text = verificationCode;
                        }, // end onSubmit
                      ),
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
                        builder: (context) => NewPasswordScreen(),
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
