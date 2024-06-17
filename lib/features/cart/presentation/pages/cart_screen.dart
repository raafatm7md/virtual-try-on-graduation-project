import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => const CartItem(),
              separatorBuilder: (context, index) => SizedBox(height: 15.h),
              itemCount: 10),
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
              '150 \$',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        AppButton(
          text: 'Check Out',
          onPressed: () => Navigator.pushNamed(context, '/checkout'),
        ),
        SizedBox(height: 10.h)
      ],
    );
  }
}
