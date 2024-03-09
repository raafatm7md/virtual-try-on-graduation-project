import 'package:TryOn/core/constants/colors.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarCreative(
        items: const [
          TabItem(
            icon: Icons.home,
            title: 'Home',
          ),
          TabItem(
            icon: Icons.shopping_cart_outlined,
            title: 'Cart',
          ),
          TabItem(
            icon: Icons.camera_alt_rounded,
            title: 'TryOn',
          ),
          TabItem(
            icon: Icons.favorite_border,
            title: 'Wishlist',
          ),
          TabItem(
            icon: Icons.person_outlined,
            title: 'profile',
          ),
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        color: AppColors.grey,
        colorSelected: Colors.black,
        highlightStyle:
            const HighlightStyle(background: AppColors.secondaryColor),
      ),
    );
  }
}
