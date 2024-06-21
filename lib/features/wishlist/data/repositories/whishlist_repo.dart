import 'package:TryOn/core/errors/failure.dart';
import 'package:TryOn/core/utilits/functions/api_service.dart';
import 'package:TryOn/features/product/data/models/product.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class WishlistRepo {
  static Future<Either<Failure, List<Product>>> getWishlist() async {
    try {
      List<Product> wishlist = [];
      var response = await ApiService.get(endPoint: '/favorites');
      response.data.forEach((product) {
        wishlist.add(Product.fromJson(product['product']));
      });
      return right(wishlist);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }

  static Future<Either<Failure, dynamic>> addToWishlist(
      {required int productId}) async {
    try {
      var response = await ApiService.post(
        url: '/favorites',
        data: {
          'product': productId,
        },
      );
      return right(response.data);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }

  static Future<Either<Failure, dynamic>> removeFromWishlist(
      {required int productId}) async {
    try {
      var response = await ApiService.delete(
        url: '/favorites/$productId',
      );
      return right(response.data);
    } on Exception catch (e) {
      if (e is DioException) return left(ServerFailure.fromDioException(e));
      return left(ServerFailure(e.toString()));
    }
  }
}
