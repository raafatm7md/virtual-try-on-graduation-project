import 'package:TryOn/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 75.h, bottom: 30.h),
      child: Image(
        image: const AssetImage(AppImageAsset.logo),
        height: 170.h,
        width: 170.w,
      ),
    );
  }
}
