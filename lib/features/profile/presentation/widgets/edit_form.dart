import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/core/widgets/custom_loading.dart';
import 'package:TryOn/core/widgets/text_form_field.dart';
import 'package:TryOn/features/profile/presentation/manager/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditForm extends StatelessWidget {
  EditForm({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var profileCubit = ProfileCubit.get(context);
        _usernameController.text = profileCubit.user!.userName!;
        _emailController.text = profileCubit.user!.userEmail!;
        _phoneController.text = profileCubit.user!.phoneNumber!;
        _addressController.text = profileCubit.user?.address ?? '';
        return Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextFormField(
                    type: 'Username',
                    fieldController: _usernameController,
                    inputType: TextInputType.name,
                    hintText: 'Enter your username',
                    enabled: false,
                  ),
                  SizedBox(height: 20.h),
                  AppTextFormField(
                    type: 'Email',
                    fieldController: _emailController,
                    inputType: TextInputType.emailAddress,
                    hintText: 'Enter your email address',
                    enabled: false,
                  ),
                  SizedBox(height: 20.h),
                  AppTextFormField(
                    type: 'Phone Number',
                    fieldController: _phoneController,
                    inputType: TextInputType.phone,
                    hintText: 'Enter your phone number',
                    validator: (value) {
                      if (value!.length < 3) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),
                  AppTextFormField(
                    type: 'Address',
                    fieldController: _addressController,
                    inputType: TextInputType.streetAddress,
                    hintText: 'Enter your phone address',
                    validator: (value) {
                      if (value!.length < 3) {
                        return 'Please enter your address ';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            state is EditProfileLoading
                ? const CustomLoadingIndicator()
                : AppButton(
                    text: 'Submit',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        profileCubit.editUserData(
                            phoneNumber: _phoneController.text,
                            address: _addressController.text);
                      }
                    },
                  )
          ],
        );
      },
    );
  }
}
