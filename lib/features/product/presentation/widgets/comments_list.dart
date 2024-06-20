import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/constants/images.dart';
import 'package:TryOn/core/widgets/rating_stars.dart';
import 'package:TryOn/features/product/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentsList extends StatelessWidget {
  final List<Comment>? comments;
  const CommentsList({
    super.key,
    this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundImage: const AssetImage(AppImageAsset.personAvatar),
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comments![index].user!,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 18.sp),
                    ),
                     RatingStars(rating: comments![index].sentiment! * 5.0),
                  ],
                )
              ],
            ),
            SizedBox(height: 5.h),
            Text(
              comments![index].text!,
              style: TextStyle(color: AppColors.grey, fontSize: 16.sp),
            ),
            SizedBox(height: 5.h),
            Text(
              '${comments![index].createdAt!.day}-${comments![index].createdAt!.month}-${comments![index].createdAt!.year} ${comments![index].createdAt!.hour}:${comments![index].createdAt!.minute}',
              style: TextStyle(fontSize: 14.sp, color: AppColors.grey),
            ),
          ],
        ),
      ),
      itemCount: comments?.length,
    );
  }
}
