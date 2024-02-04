import 'package:TryOn/core/constants/images.dart';
import 'package:TryOn/features/onboarding/domain/entities/boarding.dart';

List<BoardingEntity> boardingList = [
  BoardingEntity(
      image: AppImageAsset.onBoardingImageOne,
      title: 'Try Before You Buy',
      body: 'Try Shoes, Hoodies, T-shirts and more before you buy.'
  ),
  BoardingEntity(
      image: AppImageAsset.onBoardingImageTwo,
      title: 'Personalized Recommendations',
      body: 'Get personalized size recommendations that suits you, hassle free.'
  ),
  BoardingEntity(
      image: AppImageAsset.onBoardingImageThree,
      title: 'Seamless Shopping Experience',
      body: 'Shop from different global and local stores that you love.'
  ),
];