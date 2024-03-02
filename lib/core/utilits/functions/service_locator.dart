import 'package:TryOn/features/onboarding/data/repositories/onborading_repo_impl.dart';
import 'package:TryOn/features/onboarding/domain/repositories/onboarding_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<OnBoardingRepo>(OnBoardingRepoImpl());
}
