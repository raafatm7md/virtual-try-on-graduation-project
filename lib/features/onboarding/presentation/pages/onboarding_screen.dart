import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/features/onboarding/data/data_sources/onboarding_data.dart';
import 'package:TryOn/features/onboarding/presentation/widgets/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController boardController = PageController();
  int currentPage = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    // Start the timer to change the page every second
    timer = Timer.periodic(delayTime, (Timer t) {
      if (currentPage < boardingList.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      boardController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer.cancel();
    boardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: boardController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildOnBoardingItem(context, boardingList[index]),
              itemCount: boardingList.length,
              onPageChanged: (index) {
                // Update the currentPage when the page changes
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          SmoothPageIndicator(
            controller: boardController,
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
            child: appButton(
              text: 'Let\'s Start',
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
