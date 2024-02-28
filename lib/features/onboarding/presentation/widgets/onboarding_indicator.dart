import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingIndicator extends StatelessWidget {
  final int count;
  const OnBoardingIndicator({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: OnboardingCubit.get(context).boardController,
      count: count,
      effect: ExpandingDotsEffect(
          activeDotColor: AppColors.primaryColor,
          dotHeight: 10.h,
          dotWidth: 10.w,
          expansionFactor: 2.w,
          spacing: 15.w),
    );
  }
}
