part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class GetCartSuccess extends CartState {}

final class GetCartError extends CartState {}

final class CheckoutLoading extends CartState {}

final class CheckoutSuccess extends CartState {}

final class CheckoutError extends CartState {}
