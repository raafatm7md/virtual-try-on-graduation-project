import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/widgets/product_image.dart';
import 'package:TryOn/core/widgets/rating_stars.dart';
import 'package:TryOn/features/product/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, '/productDetails', arguments: product),
      child: SizedBox(
        height: 110.r,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 110.r,
              width: 110.r,
              child: ProductImage(
                url: '${product.image}',
              ),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${product.brand}',
                    style: TextStyle(fontSize: 14.sp, color: AppColors.grey),
                  ),
                  Text(
                    '${product.name}',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        '${product.price} \$',
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      RatingStars(
                        size: 18,
                        rating: product.rating!,
                      ),
                      Text(
                        '(${product.comments?.length})',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
