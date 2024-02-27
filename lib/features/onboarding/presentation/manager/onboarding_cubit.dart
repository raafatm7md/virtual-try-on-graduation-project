import 'dart:async';
import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/features/onboarding/domain/repositories/onboarding_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this.onBoardingRepo) : super(OnboardingInitial());
  static OnboardingCubit get(context) => BlocProvider.of(context);

  final OnBoardingRepo onBoardingRepo;
  PageController boardController = PageController();
  late Timer timer;
  int currentPage = 0;

  void updateCurrentPage(int index) {
    currentPage = index;
  }

  void startAnimate(int maxLength) {
    timer = Timer.periodic(delayTime, (Timer t) {
      currentPage = onBoardingRepo.updatePageNumber(currentPage, maxLength);
      onBoardingRepo.animateOnboarding(boardController, currentPage);
    });
  }

  void dispose() {
    emit(OnboardingDone());
    timer.cancel();
  }
}
