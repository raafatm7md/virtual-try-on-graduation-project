import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/features/profile/presentation/widgets/edit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: backIcon,
        ),
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding:
            EdgeInsetsDirectional.only(start: padding, end: padding, top: 30.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              EditForm(),
            ],
          ),
        ),
      ),
    );
  }
}
