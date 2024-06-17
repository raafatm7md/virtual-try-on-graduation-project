import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemCounter extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  const CartItemCounter(
      {super.key,
      required this.height,
      required this.width,
      this.borderRadius = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Container(
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(borderRadius),
                        bottomStart: Radius.circular(borderRadius)),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: const Icon(Icons.remove)),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                '1',
                style: TextStyle(fontSize: 18.sp),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Container(
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(borderRadius),
                        bottomEnd: Radius.circular(borderRadius)),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: const Icon(Icons.add)),
            ),
          ),
        ],
      ),
    );
  }
}
