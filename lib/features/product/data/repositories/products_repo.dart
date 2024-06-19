import 'package:TryOn/core/errors/failure.dart';
import 'package:TryOn/core/utilits/functions/api_service.dart';
import 'package:TryOn/features/product/data/models/product.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProductsRepo {
  static Future<Either<Failure, Product>> getMenProducts(
      {required String username, required String password}) async {
    try {
      var response = await ApiService.get(endPoint: '/products?gender=M');
      Product menProducts = Product.fromJson(response.data);
      return right(menProducts);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }

  static Future<Either<Failure, Product>> getWomenProducts(
      {required String username, required String password}) async {
    try {
      var response = await ApiService.get(endPoint: '/products?gender=F');
      Product womenProducts = Product.fromJson(response.data);
      return right(womenProducts);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }

  static Future<Either<Failure, Product>> getKidsProducts(
      {required String username, required String password}) async {
    try {
      var response = await ApiService.get(endPoint: '/products?gender=K');
      Product kidsProducts = Product.fromJson(response.data);
      return right(kidsProducts);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
