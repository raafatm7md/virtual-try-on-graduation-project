import 'package:TryOn/core/errors/failure.dart';
import 'package:TryOn/core/utilits/functions/api_service.dart';
import 'package:TryOn/features/product/data/models/product.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ProductsRepo {
  static Future<Either<Failure, List<Product>>> getMenProducts() async {
    try {
      List<Product> menProducts = [];
      var response = await ApiService.get(endPoint: '/products?gender=M');
      response.data.forEach((product) {
        menProducts.add(Product.fromJson(product));
      });
      return right(menProducts);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }

  static Future<Either<Failure, List<Product>>> getWomenProducts() async {
    try {
      List<Product> womenProducts = [];
      var response = await ApiService.get(endPoint: '/products?gender=F');
      response.data.forEach((product) {
        womenProducts.add(Product.fromJson(product));
      });
      return right(womenProducts);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }

  static Future<Either<Failure, List<Product>>> getKidsProducts() async {
    try {
      List<Product> kidsProducts = [];
      var response = await ApiService.get(endPoint: '/products?gender=K');
      response.data.forEach((product) {
        kidsProducts.add(Product.fromJson(product));
      });
      return right(kidsProducts);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
