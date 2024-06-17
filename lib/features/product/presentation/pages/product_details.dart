import 'dart:math';

import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/core/constants/icons.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/features/product/presentation/widgets/available_colors.dart';
import 'package:TryOn/features/product/presentation/widgets/comments_list.dart';
import 'package:TryOn/features/product/presentation/widgets/images_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: backIcon,
        ),
        title: const Text('Polo T-Shirt'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductImagesSlider(),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 20.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Polo T-Shirt',
                              style: TextStyle(
                                  fontSize: 26.sp, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'DeFacto',
                              style: TextStyle(
                                  fontSize: 16.sp, color: AppColors.grey),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '50 \$',
                        style: TextStyle(
                            fontSize: 24.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      const Expanded(
                        child: AvailableColors(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsetsDirectional.all(10.r),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              '3.5',
                              style: TextStyle(
                                  fontSize: 18.sp, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: ButtonStyle(
                            fixedSize: WidgetStatePropertyAll(
                                Size(1.sw, max(52.h, 50.w))),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 26.r,
                                width: 26.r,
                                child: CustomIcons.emoji,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                'Try it on',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      OutlinedButton(
                        style: ButtonStyle(
                            minimumSize: WidgetStatePropertyAll(
                                Size(.05.sw, max(52.h, 50.w))),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            side: const WidgetStatePropertyAll(
                                BorderSide(color: Colors.grey))),
                        onPressed: () {},
                        child: const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const CommentsList(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 15.w, vertical: 20.h),
        child: AppButton(
          text: 'Add to cart',
          onPressed: () {},
        ),
      ),
    );
  }
}
