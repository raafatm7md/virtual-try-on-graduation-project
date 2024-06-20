import 'package:TryOn/core/widgets/custom_loading.dart';
import 'package:TryOn/features/home/presentation/widgets/products_grid.dart';
import 'package:TryOn/features/product/presentation/manager/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KidsProducts extends StatelessWidget {
  const KidsProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        var kidsList = ProductsCubit.get(context).kidsProducts;
        return kidsList != null
            ? ProductsGrid(products: kidsList)
            : const CustomLoadingIndicator();
      },
    );
  }
}
