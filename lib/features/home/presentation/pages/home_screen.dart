import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/features/home/presentation/widgets/kids_list.dart';
import 'package:TryOn/features/home/presentation/widgets/men_list.dart';
import 'package:TryOn/features/home/presentation/widgets/women_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(text: 'Men'),
                Tab(text: 'Women'),
                Tab(text: 'Kids'),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              indicatorColor: AppColors.primaryColor,
              dividerHeight: 0,
              physics: const BouncingScrollPhysics(),
              labelColor: Colors.black,
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              unselectedLabelColor: Colors.grey[850],
              unselectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 16.sp),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  MenProducts(),
                  WomenProducts(),
                  KidsProducts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
