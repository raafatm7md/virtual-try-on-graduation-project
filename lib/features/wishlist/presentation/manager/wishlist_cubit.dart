import 'package:TryOn/core/utilits/functions/toast_message.dart';
import 'package:TryOn/features/product/data/models/product.dart';
import 'package:TryOn/features/wishlist/data/repositories/whishlist_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());
  static WishlistCubit get(context) => BlocProvider.of(context);

  List<Product>? wishlist;

  Future<void> getWishlist() async {
    var wishlistResponse = await WishlistRepo.getWishlist();
    wishlistResponse.fold((failure) {
      showToast(msg: failure.errMessage, bg: Colors.red);
    }, (wishlistProducts) {
      wishlist = wishlistProducts;
      emit(GetWishlistSuccess());
    });
  }

  Future<void> addToWishlist({required int productId}) async {
    var wishlistResponse =
        await WishlistRepo.addToWishlist(productId: productId);
    wishlistResponse.fold((failure) {
      showToast(msg: failure.errMessage, bg: Colors.red);
    }, (success) {
      showToast(msg: 'Item added to wishlist', bg: Colors.green);
      getWishlist();
    });
  }

  Future<void> removeFromWishlist({required int productId}) async {
    var wishlistResponse =
        await WishlistRepo.removeFromWishlist(productId: productId);
    wishlistResponse.fold((failure) {
      showToast(msg: failure.errMessage, bg: Colors.red);
    }, (success) {
      showToast(msg: 'Item removed from wishlist', bg: Colors.green);
      getWishlist();
    });
  }
}
