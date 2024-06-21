import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/features/profile/presentation/pages/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileData extends StatelessWidget {
  final Widget icon;
  final String type;
  final String data;
  const ProfileData({
    super.key,
    required this.icon,
    required this.type,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      onTap: () => Navigator.push(
          context,
          DialogRoute(
            context: context,
            builder: (context) => const EditProfileScreen(),
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 5.w),
        child: Row(
          children: [
            icon,
            SizedBox(width: 16.w),
            Text(
              type,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Text(
              data,
              style: TextStyle(fontSize: 16.sp, color: AppColors.grey),
            ),
            SizedBox(width: 8.w),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grey,
              size: 24.sp,
            )
          ],
        ),
      ),
    );
  }
}
