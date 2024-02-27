import 'package:TryOn/core/constants/images.dart';
import 'package:TryOn/features/onboarding/domain/entities/boarding_entity.dart';

List<BoardingEntity> boardingList = [
  const BoardingEntity(
      image: AppImageAsset.onBoardingImageOne,
      title: 'Try Before You Buy',
      body: 'Try Shoes, Hoodies, T-shirts and more before you buy.',
      imgWidth: 234,
      imgHeight: 481),
  const BoardingEntity(
      image: AppImageAsset.onBoardingImageTwo,
      title: 'Personalized Recommendations',
      body: 'Get personalized size recommendations that suits you, hassle free.',
      imgWidth: 430,
      imgHeight: 459),
  const BoardingEntity(
      image: AppImageAsset.onBoardingImageThree,
      title: 'Seamless Shopping Experience',
      body: 'Shop from different global and local stores that you love.',
      imgWidth: 430,
      imgHeight: 400)
];
