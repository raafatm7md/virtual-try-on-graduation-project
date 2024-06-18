import 'package:TryOn/core/errors/failure.dart';
import 'package:TryOn/core/utilits/functions/api_service.dart';
import 'package:TryOn/features/auth/data/models/loginSuccess.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginRepo {
  static Future<Either<Failure, LoginSuccess>> login(
      {required String username, required String password}) async {
    try {
      var response = await ApiService.post(
        url: '/login',
        data: {'username': username, 'password': password},
      );
      LoginSuccess loginResponse = LoginSuccess.fromJson(response.data);
      return right(loginResponse);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
