import 'package:TryOn/core/utilits/functions/toast_message.dart';
import 'package:TryOn/features/cart/data/repositories/cart_repo.dart';
import 'package:TryOn/features/product/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);

  List<Product>? cartProducts;
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
}
