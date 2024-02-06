import 'package:flutter/material.dart';

Widget appTextFormField(
  BuildContext context, {
  required String type,
  required TextEditingController fieldController,
  required TextInputType inputType,
  required String hintText,
  bool isPassword = false,
  Widget? suffix,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$type',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: 2,
        ),
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
              // fillColor: Color(0xFFF1F1F1),
              // filled: true,
            ),
          ),
        ),
      ],
    );
