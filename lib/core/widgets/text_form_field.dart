import 'package:flutter/material.dart';

// Widget AppTextFormField(
//   , {
//
// }) =>

class AppTextFormField extends StatelessWidget {
  final BuildContext context;
  final String type;
  final TextEditingController fieldController;
  final TextInputType inputType;
  final String hintText;
  final bool isPassword;
  final Widget? suffix;
  const AppTextFormField(
    this.context, {
    super.key,
    required this.type,
    required this.fieldController,
    required this.inputType,
    required this.hintText,
    this.isPassword = false,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
  }
}
