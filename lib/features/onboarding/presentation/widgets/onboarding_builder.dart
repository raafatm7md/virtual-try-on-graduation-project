import 'package:TryOn/features/onboarding/domain/entities/boarding_entity.dart';
import 'package:TryOn/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_item.dart';

class OnBoardingItemsBuilder extends StatelessWidget {
  final List<BoardingEntity> boardingList;
  const OnBoardingItemsBuilder({super.key, required this.boardingList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: BlocProvider.of<OnboardingCubit>(context).boardController,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            OnBoardingItem(context, boardingItem: boardingList[index]),
        itemCount: boardingList.length,
        onPageChanged: (index) {
          // Update the currentPage when the page changes
          BlocProvider.of<OnboardingCubit>(context).updateCurrentPage(index);
        },
      ),
    );
  }
}
