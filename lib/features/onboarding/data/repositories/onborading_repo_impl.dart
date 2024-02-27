import 'package:TryOn/features/onboarding/domain/repositories/onboarding_repo.dart';
import 'package:flutter/material.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  @override
  void animateOnboarding(PageController boardController, int pageNumber) {
    boardController.animateToPage(
      pageNumber,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  int updatePageNumber(int currentPage, int maxLength) {
    if (currentPage < maxLength - 1) {
      currentPage++;
    } else {
      currentPage = 0;
    }
    return currentPage;
  }
}
