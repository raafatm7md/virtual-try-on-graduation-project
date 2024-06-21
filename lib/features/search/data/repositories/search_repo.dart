import 'package:TryOn/core/errors/failure.dart';
import 'package:TryOn/core/utilits/functions/api_service.dart';
import 'package:TryOn/features/product/data/models/product.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepo {
  static Future<Either<Failure, List<Product>>> searchByName(
      String name) async {
    try {
      List<Product> cartProducts = [];
      var response =
          await ApiService.get(endPoint: '/products', query: {'name': name});
      response.data.forEach((product) {
        cartProducts.add(Product.fromJson(product));
      });
      return right(cartProducts);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
