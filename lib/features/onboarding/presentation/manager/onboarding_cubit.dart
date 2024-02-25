import 'dart:async';
import 'package:TryOn/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  static OnboardingCubit get(context) => BlocProvider.of(context);

  PageController boardController = PageController();
  int currentPage = 0;
  late Timer timer;

  void updateCurrentPage(int index) {
    currentPage = index;
  }

  void startAnimate(int maxLength) {
    timer = Timer.periodic(delayTime, (Timer t) {
      if (currentPage < maxLength - 1) {
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

  void dispose() {
    emit(OnboardingDone());
    timer.cancel();
    boardController.dispose();
  }
}
