import 'package:TryOn/core/errors/failure.dart';
import 'package:TryOn/core/utilits/functions/api_service.dart';
import 'package:TryOn/core/utilits/functions/shared_pref.dart';
import 'package:TryOn/features/profile/data/models/user_data.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProfileRepo {
  static Future<Either<Failure, UserData>> getUserData() async {
    try {
      var response = await ApiService.get(endPoint: '/user');
      UserData userData = UserData.fromJson(response.data);
      return right(userData);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }

  static Future<void> editUserData(
      {String? phoneNumber, String? address}) async {
    await ApiService.post(
      url: '/user',
      data: {
        'phone_number': phoneNumber,
        'address': address,
      },
    );
  }

  static Future<void> logout() async {
    await ApiService.post(
      url: '/logout',
      data: {'refresh_token': CacheHelper.getData('refreshToken')},
    );
  }
}
