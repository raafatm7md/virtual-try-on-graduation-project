import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/features/onboarding/data/data_sources/onboarding_data.dart';
import 'package:TryOn/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:TryOn/features/onboarding/presentation/widgets/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit()..startAnimate(boardingList.length),
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingDone) {
            Navigator.pushNamed(context, '/login');
          }
        },
        builder: (context, state) {
          var cubit = OnboardingCubit.get(context);
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: cubit.boardController,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => OnBoardingItem(context,
                        boardingItem: boardingList[index]),
                    itemCount: boardingList.length,
                    onPageChanged: (index) {
                      // Update the currentPage when the page changes
                      cubit.updateCurrentPage(index);
                    },
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                SmoothPageIndicator(
                  controller: cubit.boardController,
                  count: boardingList.length,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primaryColor,
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 2,
                      spacing: 15),
                ),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: padding,
                      end: padding,
                      bottom: MediaQuery.of(context).size.height / 11.2),
                  child: AppButton(
                    text: 'Let\'s Start',
                    onPressed: () => cubit.dispose(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
