import 'package:TryOn/core/errors/failure.dart';
import 'package:TryOn/core/utilits/functions/api_service.dart';
import 'package:TryOn/features/auth/data/models/loginSuccess.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SignUpRepo {
  static Future<Either<Failure, LoginSuccess>> signup({
    required String username,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirm,
    String? profileImage,
  }) async {
    try {
      var response = await ApiService.post(
        url: '/signup',
        data: FormData.fromMap({
          'username': username,
          'email': email,
          'phone_number': phone,
          'password': password,
          'password_confirm': passwordConfirm,
          'image': profileImage != null
              ? await MultipartFile.fromFile(
                  profileImage,
                  filename: profileImage.split('/').last,
                )
              : null,
        }),
      );
      LoginSuccess loginResponse = LoginSuccess.fromJson(response.data);
      return right(loginResponse);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
