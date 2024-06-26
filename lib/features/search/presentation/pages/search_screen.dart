import 'package:TryOn/core/constants/constants.dart';
import 'package:TryOn/features/search/presentation/manager/search_cubit.dart';
import 'package:TryOn/features/search/presentation/widgets/search_result.dart';
import 'package:TryOn/features/search/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(top: 25.h, end: 20.w),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: backIcon,
                    ),
                    Expanded(
                      child: SearchTextField(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: 20.h, start: 20.w, end: 20.w),
                  child: const SearchResultWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
