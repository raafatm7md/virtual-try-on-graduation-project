import 'package:TryOn/core/utilits/functions/shared_pref.dart';
import 'package:TryOn/features/profile/data/repositories/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  Future<void> logout() async {
    await ProfileRepo.logout();
    CacheHelper.removeData('accessToken');
    CacheHelper.removeData('refreshToken');
  }
}
