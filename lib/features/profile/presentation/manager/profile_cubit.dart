import 'package:TryOn/core/utilits/functions/shared_pref.dart';
import 'package:TryOn/core/utilits/functions/toast_message.dart';
import 'package:TryOn/features/profile/data/models/user_data.dart';
import 'package:TryOn/features/profile/data/repositories/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  UserData? user;

  Future<void> getUserData() async {
    var response = await ProfileRepo.getUserData();
    response.fold((failure) {
      emit(ProfileGetDataError());
      showToast(msg: failure.errMessage, bg: Colors.red);
    }, (userData) {
      user = userData;
      emit(ProfileGetDataSuccess());
    });
  }

  Future<void> logout() async {
    await ProfileRepo.logout();
    CacheHelper.removeData('accessToken');
    CacheHelper.removeData('refreshToken');
  }
}
