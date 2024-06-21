import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/constants/icons.dart';
import 'package:TryOn/core/constants/images.dart';
import 'package:TryOn/core/widgets/custom_loading.dart';
import 'package:TryOn/features/profile/presentation/manager/profile_cubit.dart';
import 'package:TryOn/features/profile/presentation/widgets/profile_data_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var user = ProfileCubit.get(context).user;
        return user != null
            ? Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40.r,
                        backgroundImage: user.image == null
                            ? const AssetImage(AppImageAsset.personAvatar)
                            : NetworkImage(user.image!) as ImageProvider,
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.userName!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.sp,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            '@${user.userName!}',
                            style: TextStyle(
                                fontSize: 14.sp, color: AppColors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30.h),
                  ProfileData(
                    icon: CustomIcons.gender,
                    type: 'Gender',
                    data: 'Not Specified',
                  ),
                  ProfileData(
                    icon: CustomIcons.date,
                    type: 'Birthday',
                    data: 'Not Specified',
                  ),
                  ProfileData(
                    icon: CustomIcons.email,
                    type: 'Email',
                    data: user.userEmail!,
                  ),
                  ProfileData(
                    icon: CustomIcons.phone,
                    type: 'Phone Number',
                    data: user.phoneNumber!,
                  ),
                  ProfileData(
                    icon: CustomIcons.address,
                    type: 'Saved Addresses',
                    data: '',
                  ),
                  ProfileData(
                    icon: CustomIcons.password,
                    type: 'Change Password',
                    data: '•••••••••••',
                  ),
                  SizedBox(height: 20.h),
                  TextButton(
                    onPressed: () {
                      ProfileCubit.get(context).logout();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (route) => false,
                      );
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )
            : const CustomLoadingIndicator();
      },
    );
  }
}
