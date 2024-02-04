import 'package:TryOn/core/constants/color.dart';
import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/features/onboarding/domain/entities/boarding.dart';
import 'package:flutter/material.dart';

Widget buildOnBoardingItem(BoardingEntity boardingItem) => Column(
      children: [
        Expanded(
            child: Image(
          image: AssetImage(boardingItem.image),
          alignment: AlignmentDirectional.bottomCenter,
        )),
        const SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              Text(
                boardingItem.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                boardingItem.body,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18.0, color: AppColor.grey),
              ),
            ],
          ),
        ),
      ],
    );