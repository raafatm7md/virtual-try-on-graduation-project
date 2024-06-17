import 'package:TryOn/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Color(0x44000000),
            blurRadius: 6,
            offset: Offset(0, 1),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      padding: EdgeInsetsDirectional.only(
          start: 15.w, end: 15.w, top: 5.h, bottom: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Raafat Mohamed',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/paymentMethod'),
                child: const Text(
                  'Change',
                  style: TextStyle(color: AppColors.secondaryColor),
                ),
              ),
            ],
          ),
          const Text('3 Newbridge Court'),
          const Text('Chino Hills, CA 91709, United States'),
        ],
      ),
    );
  }
}
