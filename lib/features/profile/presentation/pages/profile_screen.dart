import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/constants/icons.dart';
import 'package:TryOn/core/constants/images.dart';
import 'package:TryOn/features/profile/presentation/widgets/profile_data_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundImage: const AssetImage(AppImageAsset.personAvatar),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Raafat Mohamed',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '@raafatm7md',
                  style: TextStyle(fontSize: 14.sp, color: AppColors.grey),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 30.h),
        ProfileData(
          icon: CustomIcons.gender,
          type: 'Gender',
          data: 'Male',
        ),
        ProfileData(
          icon: CustomIcons.date,
          type: 'Birthday',
          data: '07-09-2002',
        ),
        ProfileData(
          icon: CustomIcons.email,
          type: 'Email',
          data: 'raafatm7md@gmail.com',
        ),
        ProfileData(
          icon: CustomIcons.phone,
          type: 'Phone Number',
          data: '+20 10 12148827',
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
      ],
    );
  }
}
