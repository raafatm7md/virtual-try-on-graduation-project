import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/constants/icons.dart';
import 'package:TryOn/core/widgets/product_image.dart';
import 'package:TryOn/features/cart/presentation/widgets/cart_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      ),
      height: 115.r,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 110.r,
              width: 110.r,
              child: const ProductImage(
                url:
                    'https://dfcdn.defacto.com.tr/6/X2594AZ_24SM_WT32_01_01.jpg',
              ),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'DeFacto',
                          style:
                              TextStyle(fontSize: 14.sp, color: AppColors.grey),
                        ),
                        Text(
                          'Polo T-Shirt',
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '50 \$',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SizedBox(
                          height: 24.sp,
                          width: 24.sp,
                          child: CustomIcons.trash,
                        ),
                      ),
                      CartItemCounter(
                        height: 35.h,
                        width: 130.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
