import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/core/constants/images.dart';
import 'package:TryOn/core/widgets/app_button.dart';
import 'package:TryOn/features/checkout/presentation/widgets/address_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

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
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping address',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
            ),
            SizedBox(height: 10.h),
            const AddressCard(),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payment',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/paymentMethod'),
                  child: const Text(
                    'Change',
                    style: TextStyle(color: AppColors.secondaryColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0x55000000),
                          blurRadius: 10,
                          offset: Offset(0, 1)),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Image.asset(
                    AppImageAsset.mastercard,
                    height: 50.h,
                  ),
                ),
                SizedBox(width: 20.w),
                Text(
                  '**** **** **** 4567',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(AppImageAsset.cash),
                ),
                Text(
                  'Cash:',
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
                ),
                const Spacer(),
                const Icon(Icons.check),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order:',
                  style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp),
                ),
                Text(
                  '150 \$',
                  style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery:',
                  style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp),
                ),
                Text(
                  '15 \$',
                  style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Summary:',
                  style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp),
                ),
                Text(
                  '165 \$',
                  style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp),
                ),
              ],
            ),
            SizedBox(height: 80.h),
            AppButton(
              text: 'SUBMIT ORDER',
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/checkoutSuccess'),
            )
          ],
        ),
      ),
    );
  }
}
