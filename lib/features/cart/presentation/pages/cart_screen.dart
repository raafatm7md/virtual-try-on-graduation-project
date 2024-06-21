import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/core/widgets/custom_loading.dart';
import 'package:TryOn/features/cart/presentation/manager/cart_cubit.dart';
import 'package:TryOn/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cart = CartCubit.get(context);
        return Column(
          children: [
            Expanded(
              child: cart.cartProducts == null
                  ? const CustomLoadingIndicator()
                  : cart.cartProducts!.isEmpty
                      ? const Center(
                          child: Text('No items in cart'),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) =>
                              CartItem(product: cart.cartProducts![index]),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 15.h),
                          itemCount: cart.cartProducts!.length),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total amount:',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.grey),
                ),
                Text(
                  '${cart.totalPrice} \$',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            AppButton(
              text: 'Check Out',
              onPressed: () => Navigator.pushNamed(context, '/checkout',
                  arguments: cart.totalPrice),
            ),
            SizedBox(height: 10.h)
          ],
        );
      },
    );
  }
}
