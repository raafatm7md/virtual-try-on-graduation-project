import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/core/constants/images.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  const CheckoutSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: padding),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImageAsset.bags),
              SizedBox(height: 20.h),
              Text(
                'Success!',
                style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              const Text(
                'Your order will be delivered soon.',
                style: TextStyle(color: AppColors.grey),
              ),
              const Text(
                'Thank you for choosing our app!',
                style: TextStyle(color: AppColors.grey),
              ),
              SizedBox(height: 10.h),
              AppButton(
                text: 'CONTINUE SHOPPING',
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
