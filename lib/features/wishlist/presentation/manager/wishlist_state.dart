part of 'wishlist_cubit.dart';

@immutable
sealed class WishlistState {}

final class WishlistInitial extends WishlistState {}

final class GetWishlistSuccess extends WishlistState {}

final class GetWishlistError extends WishlistState {}
