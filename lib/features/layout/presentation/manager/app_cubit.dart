import 'package:TryOn/features/cart/presentation/pages/cart_screen.dart';
import 'package:TryOn/features/home/presentation/pages/home_screen.dart';
import 'package:TryOn/features/profile/presentation/pages/profile_screen.dart';
import 'package:TryOn/features/tryon/presentation/pages/tryon_screen.dart';
import 'package:TryOn/features/wishlist/presentation/pages/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<String> titles = [
    'Categories',
    'Your Cart',
    'TryOn',
    'Favorites',
    'Profile'
  ];

  List<Widget> screens = [
    const HomeScreen(),
    const CartScreen(),
    const TryOnScreen(),
    const WishlistScreen(),
    const ProfileScreen(),
  ];

  void changeIndex(int index) {
    if (index == 2) {
      emit(StartTryOn());
    } else {
      currentIndex = index;
      emit(IndexChanged());
    }
  }
}
