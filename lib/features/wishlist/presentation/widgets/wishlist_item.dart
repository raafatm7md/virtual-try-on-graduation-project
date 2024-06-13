import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/widgets/product_image.dart';
import 'package:TryOn/core/widgets/rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistItem extends StatelessWidget {
  const WishlistItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.r,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 110.r,
            width: 110.r,
            child: const ProductImage(
              url: 'https://dfcdn.defacto.com.tr/6/X2594AZ_24SM_WT32_01_01.jpg',
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'DeFacto',
                style: TextStyle(fontSize: 14.sp, color: AppColors.grey),
              ),
              Text(
                'Polo T-Shirt',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  Text(
                    '50 \$',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const RatingStars(
                    rating: 3.5,
                  ),
                  const Text('(10)'),
                ],
              )
            ],
          )),
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.grey,
              size: 26.sp,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
