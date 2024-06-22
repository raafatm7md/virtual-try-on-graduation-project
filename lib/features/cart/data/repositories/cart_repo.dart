import 'package:TryOn/core/errors/failure.dart';
import 'package:TryOn/core/utilits/functions/api_service.dart';
import 'package:TryOn/features/product/data/models/product.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CartRepo {
  static Future<Either<Failure, List<dynamic>>> getCart() async {
    try {
      List<dynamic> cartProducts = [];
      var response = await ApiService.get(endPoint: '/cartitem');
      response.data.forEach((product) {
        cartProducts
            .add([Product.fromJson(product['product']), product['quantity']]);
      });
      return right(cartProducts);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }

  static Future<Either<Failure, double>> getTotalPrice() async {
    try {
      var response = await ApiService.get(endPoint: '/carttotal');
      return right(response.data['total_price']);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }

  static Future<Either<Failure, dynamic>> addToCart(
      {required int productId}) async {
    try {
      var response = await ApiService.post(
        url: '/cartitem',
        data: {
          'product_id': productId,
        },
      );
      return right(response.data);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }

  static Future<Either<Failure, dynamic>> removeFromCart(
      {required int productId}) async {
    try {
      var response = await ApiService.delete(url: '/cartitem/delete', data: {
        'product_id': productId,
      });
      return right(response.data);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }

  static Future<Either<Failure, dynamic>> checkout() async {
    try {
      var response = await ApiService.post(
        url: '/checkout',
        data: {
          'shipping_address': 'bla bla bla',
        },
      );
      return right(response.data);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
