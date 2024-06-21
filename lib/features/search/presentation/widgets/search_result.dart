import 'package:TryOn/core/widgets/custom_loading.dart';
import 'package:TryOn/features/search/presentation/manager/search_cubit.dart';
import 'package:TryOn/features/search/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        var searchResult = SearchCubit.get(context).searchResult;
        return state is SearchLoading
            ? const CustomLoadingIndicator()
            : searchResult != null
                ? searchResult.isEmpty
                    ? const Center(child: Text('No Products found'))
                    : ListView.separated(
                        itemBuilder: (context, index) =>
                            ProductItem(product: searchResult[index]),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20.h),
                        itemCount: searchResult.length)
                : const Center(child: Text('Enter name to search'));
      },
    );
  }
}
