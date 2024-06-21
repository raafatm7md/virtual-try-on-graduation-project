import 'package:TryOn/core/utilits/functions/toast_message.dart';
import 'package:TryOn/features/product/data/models/product.dart';
import 'package:TryOn/features/search/data/repositories/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  List<Product>? searchResult;

  Future<void> searchByName(String name) async {
    emit(SearchLoading());
    var searchResponse = await SearchRepo.searchByName(name);
    searchResponse.fold((failure) {
      emit(SearchError());
      showToast(msg: failure.errMessage, bg: Colors.red);
    }, (wishlistProducts) {
      searchResult = wishlistProducts;
      emit(SearchSuccess());
    });
  }
}
