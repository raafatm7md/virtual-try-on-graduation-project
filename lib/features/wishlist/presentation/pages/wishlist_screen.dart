import 'package:TryOn/features/wishlist/presentation/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => const WishlistItem(),
        separatorBuilder: (context, index) => SizedBox(height: 15.h),
        itemCount: 10);
  }
}
