import 'package:TryOn/core/utilits/functions/toast_message.dart';
import 'package:TryOn/features/cart/data/repositories/cart_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);

  List<dynamic>? cartProducts;
  double totalPrice = 0;

  Future<void> getCart() async {
    var cartResponse = await CartRepo.getCart();
    var totalPriceRes = await CartRepo.getTotalPrice();
    cartResponse.fold((failure) {
      emit(GetCartError());
      showToast(msg: failure.errMessage, bg: Colors.red);
    }, (cart) {
      cartProducts = cart;
      emit(GetCartSuccess());
    });
    totalPriceRes.fold((failure) {
      emit(GetCartError());
      showToast(msg: failure.errMessage, bg: Colors.red);
    }, (price) {
      totalPrice = price;
      emit(GetCartSuccess());
    });
  }

  Future<void> addToCart({required int productId, int? index}) async {
    if (index != null) {
      cartProducts?[index].last++;
      emit(AddItem());
    }
    var wishlistResponse = await CartRepo.addToCart(productId: productId);
    wishlistResponse.fold((failure) {
      showToast(msg: failure.errMessage, bg: Colors.red);
    }, (success) {
      showToast(msg: 'Item added to cart', bg: Colors.green);
      getCart();
    });
  }

  Future<void> removeFromCart({required int productId}) async {
    var wishlistResponse = await CartRepo.removeFromCart(productId: productId);
    wishlistResponse.fold((failure) {
      showToast(msg: failure.errMessage, bg: Colors.red);
    }, (success) {
      if (cartProducts!.length == 1) {
        cartProducts!.clear();
        totalPrice = 0;
        emit(RemoveItem());
      }
      showToast(msg: 'Item removed from cart', bg: Colors.green);
      getCart();
    });
  }

  Future<void> checkout() async {
    emit(CheckoutLoading());
    var checkoutResponse = await CartRepo.checkout();
    checkoutResponse.fold((failure) {
      emit(CheckoutError());
      showToast(msg: failure.errMessage, bg: Colors.red);
    }, (success) {
      cartProducts!.clear();
      totalPrice = 0;
      emit(CheckoutSuccess());
    });
  }
}
