import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppImageAsset.noConnection,
            color: AppColors.secondaryColor,
            width: .75.sw,
          ),
          SizedBox(height: 20.h),
          Text(
            'Check your connection and try again.',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryColor),
          ),
        ],
      ),
    );
  }
}
