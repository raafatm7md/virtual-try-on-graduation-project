part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class GetProductsMenSuccess extends ProductsState {}

final class GetProductsMenError extends ProductsState {}

final class GetProductsWomenSuccess extends ProductsState {}

final class GetProductsWomenError extends ProductsState {}

final class GetProductsKidsSuccess extends ProductsState {}

final class GetProductsKidsError extends ProductsState {}
