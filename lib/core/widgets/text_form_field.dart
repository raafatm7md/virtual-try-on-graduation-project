import 'package:flutter/material.dart';

Widget appTextFormField({
  required TextEditingController fieldController,
  required TextInputType inputType,
  required String hintText,
  bool isPassword = false,
  Widget? suffix,
}) =>
    Container(
      height: 50,
      child: TextFormField(
        obscureText: isPassword,
        controller: fieldController,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          isDense: true,
          suffixIcon: suffix,
        ),
      ),
    );
