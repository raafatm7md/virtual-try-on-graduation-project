import 'package:TryOn/core/utilits/functions/shared_pref.dart';
import 'package:TryOn/core/utilits/functions/toast_message.dart';
import 'package:TryOn/features/auth/data/repositories/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> login(
      {required String username, required String password}) async {
    emit(LoginLoading());
    var response =
        await LoginRepo.login(username: username.trim(), password: password);
    response.fold((failure) {
      emit(LoginFailure());
      showToast(msg: failure.errMessage, bg: Colors.red);
    }, (success) {
      CacheHelper.saveData('accessToken', 'Bearer ${success.access}');
      emit(LoginSuccess());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool passwordInvisibility = true;
  void changePasswordVisibility() {
    passwordInvisibility = !passwordInvisibility;
    suffix = passwordInvisibility
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(LoginPasswordVisibility());
  }
}
