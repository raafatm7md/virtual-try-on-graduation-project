import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/constants/icons.dart';
import 'package:TryOn/features/layout/presentation/manager/app_cubit.dart';
import 'package:TryOn/features/layout/presentation/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state is StartTryOn) Navigator.pushNamed(context, '/tryOn');
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search_outlined))
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: CustomBottomBar(
              items: [
                TabItem<Widget>(
                  icon: cubit.currentIndex == 0
                      ? CustomIcons.homeActive
                      : CustomIcons.home,
                  title: 'Home',
                ),
                TabItem<Widget>(
                  icon: cubit.currentIndex == 1
                      ? CustomIcons.cartActive
                      : CustomIcons.cart,
                  title: 'Cart',
                ),
                TabItem(
                  icon: CustomIcons.camera,
                  title: 'TryOn',
                ),
                TabItem<Widget>(
                  icon: cubit.currentIndex == 3
                      ? CustomIcons.heartActive
                      : CustomIcons.heart,
                  title: 'Wishlist',
                ),
                TabItem<Widget>(
                  icon: cubit.currentIndex == 4
                      ? CustomIcons.personActive
                      : CustomIcons.person,
                  title: 'Profile',
                ),
              ],
              indexSelected: cubit.currentIndex,
              onTap: (index) => cubit.changeIndex(index),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              color: AppColors.grey,
              colorSelected: Colors.black,
              highlightStyle: const HighlightStyle(
                  background: AppColors.secondaryColor, sizeLarge: true),
              titleStyle: TextStyle(fontSize: 12.sp),
            ),
          );
        },
      ),
    );
  }
}
