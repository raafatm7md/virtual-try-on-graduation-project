import 'dart:math';
import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/features/onboarding/domain/entities/boarding_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingItem extends StatelessWidget {
  final BuildContext context;
  final BoardingEntity boardingItem;
  const OnBoardingItem(this.context, {super.key, required this.boardingItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: SizedBox()),
        Image(
            image: AssetImage(boardingItem.image),
            alignment: AlignmentDirectional.bottomCenter,
            height: min(boardingItem.imgHeight.dg, boardingItem.imgHeight.h),
            width: boardingItem.imgWidth.w,
            fit: BoxFit.fitHeight),
        SizedBox(height: 25.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            children: [
              Text(boardingItem.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8.0),
              Text(boardingItem.body,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19.sp, color: AppColors.grey)),
            ],
          ),
        ),
      ],
    );
  }
}
