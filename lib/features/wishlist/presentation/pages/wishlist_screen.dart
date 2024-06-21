import 'package:TryOn/features/wishlist/presentation/manager/wishlist_cubit.dart';
import 'package:TryOn/features/wishlist/presentation/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        var wishlist = WishlistCubit.get(context).wishlist;
        return wishlist != null && wishlist.isNotEmpty
            ? ListView.separated(
                itemBuilder: (context, index) =>
                    WishlistItem(product: wishlist[index]),
                separatorBuilder: (context, index) => SizedBox(height: 15.h),
                itemCount: wishlist.length)
            : const Center(
                child: Text('No products in wishlist!'),
              );
      },
    );
  }
}
