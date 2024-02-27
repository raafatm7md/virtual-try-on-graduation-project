import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/core/utilits/service_locator/service_locator.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/features/onboarding/data/data_sources/onboarding_data.dart';
import 'package:TryOn/features/onboarding/domain/repositories/onboarding_repo.dart';
import 'package:TryOn/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:TryOn/features/onboarding/presentation/widgets/onboarding_builder.dart';
import 'package:TryOn/features/onboarding/presentation/widgets/onboarding_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(getIt.get<OnBoardingRepo>())
        ..startAnimate(boardingList.length),
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingDone) Navigator.pushNamed(context, '/login');
        },
        builder: (context, state) {
          var cubit = OnboardingCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  OnBoardingItemsBuilder(boardingList: boardingList),
                  SizedBox(height: 35.h),
                  OnBoardingIndicator(count: boardingList.length),
                  SizedBox(height: 35.h),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: padding, end: padding, bottom: 80.h),
                    child: AppButton(
                        text: 'Let\'s Start', onPressed: () => cubit.dispose()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
