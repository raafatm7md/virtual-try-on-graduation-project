import 'package:TryOn/core/errors/failure.dart';
import 'package:TryOn/core/utilits/functions/api_service.dart';
import 'package:TryOn/features/product/data/models/product.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CartRepo {
  static Future<Either<Failure, List<Product>>> getCart() async {
    try {
      List<Product> cartProducts = [];
      var response = await ApiService.get(endPoint: '/favorites');
      response.data.forEach((product) {
        cartProducts.add(Product.fromJson(product['product']));
      });
      return right(cartProducts);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
