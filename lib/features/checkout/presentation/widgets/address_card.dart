import 'package:TryOn/core/constants/colors.dart';
import 'package:TryOn/features/profile/presentation/manager/profile_cubit.dart';
import 'package:TryOn/features/profile/presentation/pages/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
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
                    ProfileCubit.get(context).user!.userName!,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        DialogRoute(
                          context: context,
                          builder: (context) => const EditProfileScreen(),
                        )),
                    child: const Text(
                      'Change',
                      style: TextStyle(color: AppColors.secondaryColor),
                    ),
                  ),
                ],
              ),
              Text(ProfileCubit.get(context).user!.address ?? ''),
              Text(ProfileCubit.get(context).user!.phoneNumber ?? ''),
            ],
          ),
        );
      },
    );
  }
}
