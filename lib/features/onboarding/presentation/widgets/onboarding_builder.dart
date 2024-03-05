import 'package:TryOn/features/onboarding/domain/entities/boarding_entity.dart';
import 'package:TryOn/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'onboarding_item.dart';

class OnBoardingItemsBuilder extends StatelessWidget {
  final List<BoardingEntity> boardingList;
  const OnBoardingItemsBuilder({super.key, required this.boardingList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: PageView.builder(
        controller: OnboardingCubit.get(context).boardController,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            OnBoardingItem(context, boardingItem: boardingList[index]),
        itemCount: boardingList.length,
        onPageChanged: (index) {
          // Update the currentPage when the page changes
          OnboardingCubit.get(context).updateCurrentPage(index);
        },
      ),
    );
  }
}
