import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/core/constants/icons.dart';
import 'package:TryOn/core/widgets/custom_loading.dart';
import 'package:TryOn/features/cart/presentation/manager/cart_cubit.dart';
import 'package:TryOn/features/layout/presentation/manager/app_cubit.dart';
import 'package:TryOn/features/layout/presentation/widgets/custom_bottom_bar.dart';
import 'package:TryOn/features/layout/presentation/widgets/no_connection.dart';
import 'package:TryOn/features/product/presentation/manager/products_cubit.dart';
import 'package:TryOn/features/profile/presentation/manager/profile_cubit.dart';
import 'package:TryOn/features/tryon/presentation/manager/camera_kit_cubit.dart';
import 'package:TryOn/features/wishlist/presentation/manager/wishlist_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  void initState() {
    super.initState();
    ProfileCubit.get(context).getUserData();
    CartCubit.get(context).getCart();
    WishlistCubit.get(context).getWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => ProductsCubit()..getAllProducts()),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state is StartTryOn) CameraKitCubit.get(context).openCameraKit();
        },
        builder: (context, state) {
          RefreshController refreshController =
              RefreshController(initialRefresh: false);
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
              actions: [
                IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/search'),
                  icon: Icon(
                    Icons.search_outlined,
                    size: 28.sp,
                  ),
                )
              ],
            ),
            body: StreamBuilder(
              stream: Connectivity().onConnectivityChanged,
              builder: (BuildContext context,
                  AsyncSnapshot<List<ConnectivityResult>> snapshot) {
                if (snapshot.hasData) {
                  List<ConnectivityResult>? result = snapshot.data;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: result!.contains(ConnectivityResult.none)
                        ? const NoConnectionWidget()
                        : SmartRefresher(
                            controller: refreshController,
                            header: const MaterialClassicHeader(),
                            onRefresh: () async {
                              ProductsCubit.get(context).getAllProducts();
                              ProfileCubit.get(context).getUserData();
                              WishlistCubit.get(context).getWishlist();
                              CartCubit.get(context).getCart();
                              await Future.delayed(
                                  const Duration(milliseconds: 1000));
                              refreshController.refreshCompleted();
                            },
                            child: cubit.screens[cubit.currentIndex]),
                  );
                } else {
                  return const CustomLoadingIndicator();
                }
              },
            ),
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
