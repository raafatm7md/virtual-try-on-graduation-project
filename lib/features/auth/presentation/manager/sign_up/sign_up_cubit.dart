import 'package:TryOn/core/utilits/functions/shared_pref.dart';
import 'package:TryOn/core/utilits/functions/toast_message.dart';
import 'package:TryOn/features/auth/data/repositories/sign_up_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);

  String? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = pickedFile.path;
      emit(GetImageSuccess());
    } else {
      emit(GetImageError());
    }
  }

  Future<void> signup({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirm,
  }) async {
    emit(SignUpLoading());
    var response = await SignUpRepo.signup(
      username: username.trim(),
      email: email,
      phone: phone,
      password: password,
      passwordConfirm: passwordConfirm,
      profileImage: profileImage,
    );
    response.fold((failure) {
      emit(SignUpFailure());
      showToast(msg: failure.errMessage, bg: Colors.red);
    }, (success) {
      CacheHelper.saveData('accessToken', 'Bearer ${success.access}');
      CacheHelper.saveData('refreshToken', success.refresh);
      emit(SignUpSuccess());
    });
  }
}
