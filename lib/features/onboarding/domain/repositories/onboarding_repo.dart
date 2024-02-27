import 'package:flutter/material.dart';

abstract class OnBoardingRepo {
  void animateOnboarding(PageController boardController, int pageNumber);
  int updatePageNumber(int currentPage, int maxLength);
}
