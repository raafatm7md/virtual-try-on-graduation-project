import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableColors extends StatelessWidget {
  const AvailableColors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available colors',
          style: TextStyle(fontSize: 18.sp),
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 20.r,
            ),
            SizedBox(width: 5.h),
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 20.r,
            ),
            SizedBox(width: 5.h),
            CircleAvatar(
              backgroundColor: Colors.deepPurple,
              radius: 20.r,
            ),
            SizedBox(width: 5.h),
            CircleAvatar(
              backgroundColor: Colors.tealAccent,
              radius: 20.r,
            ),
          ],
        )
      ],
    );
  }
}
