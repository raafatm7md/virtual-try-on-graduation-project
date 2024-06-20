import 'package:TryOn/core/utilits/functions/toast_message.dart';
import 'package:TryOn/features/product/data/models/product.dart';
import 'package:TryOn/features/product/data/repositories/products_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  static ProductsCubit get(context) => BlocProvider.of(context);

  List<Product>? menProducts;
  List<Product>? womenProducts;
  List<Product>? kidsProducts;

  Future<void> getAllProducts() async {
    var menResponse = await ProductsRepo.getMenProducts();
    var womenResponse = await ProductsRepo.getMenProducts();
    var kidsResponse = await ProductsRepo.getMenProducts();

    menResponse.fold((failure) {
      emit(state);
      showToast(msg: failure.errMessage, bg: Colors.red);
    }, (menList) {
      menProducts = menList;
      emit(state);
    });

    womenResponse.fold((failure) {
      emit(state);
      showToast(msg: failure.errMessage, bg: Colors.red);
    }, (womenList) {
      womenProducts = womenList;
      emit(state);
    });

    kidsResponse.fold((failure) {
      emit(state);
      showToast(msg: failure.errMessage, bg: Colors.red);
    }, (kidsList) {
      kidsProducts = kidsList;
      emit(state);
    });
  }
}
