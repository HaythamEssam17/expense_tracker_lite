import 'package:expense_tracker_lite/core/constants/icon_paths.dart';
import 'package:expense_tracker_lite/core/features/bottom_nav_feature/presentation/bloc/bottom_nav_cubit.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/num_extensions.dart';
import 'package:expense_tracker_lite/core/routers/app_route.dart';
import 'package:expense_tracker_lite/core/widgets/Images/common_asset_svg_image_widget.dart';
import 'package:expense_tracker_lite/di/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../routers/route_names.dart';

class BottomNavHomePage extends StatelessWidget {
  const BottomNavHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavCubit>(
      create: (_) => getIt<BottomNavCubit>(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          final cubit = context.read<BottomNavCubit>();

          return Scaffold(
            body: PageView(
              controller: cubit.pageController,
              onPageChanged: cubit.onPageChanged,
              children: cubit.pages,
            ),
            bottomNavigationBar: IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 8),
                      blurRadius: 10,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                padding: EdgeInsets.only(
                  left: 12.sp,
                  right: 12.sp,
                  top: 12.sp,
                  bottom: (MediaQuery.of(context).padding.bottom).sp,
                ),
                child: Row(
                  children: [
                    _buildBottomNavigationBarItem(
                      context,
                      0,
                      IconPath.homeFillIcon,
                      IconPath.homeEmptyIcon,
                      state == 0,
                    ),
                    _buildBottomNavigationBarItem(
                      context,
                      1,
                      IconPath.chartFillIcon,
                      IconPath.chartEmptyIcon,
                      state == 1,
                    ),
                    Expanded(
                      child: FloatingActionButton.small(
                        onPressed: () {
                          router.pushNamed(RouteNames.addExpenseHomePage);
                        },
                        elevation: 0,
                        backgroundColor: context.appColors.primaryColor,
                        shape: const CircleBorder(),
                        child: Center(
                          child: Icon(
                            CupertinoIcons.add,
                            color: context.appColors.bgWhite,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    _buildBottomNavigationBarItem(
                      context,
                      3,
                      IconPath.walletFillIcon,
                      IconPath.walletEmptyIcon,
                      state == 3,
                    ),
                    _buildBottomNavigationBarItem(
                      context,
                      4,
                      IconPath.userFillIcon,
                      IconPath.userEmptyIcon,
                      state == 4,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNavigationBarItem(
    BuildContext context,
    int index,
    String fillIcon,
    String emptyIcon,
    bool isSelected,
  ) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          context.read<BottomNavCubit>().changePage(index);
        },
        style: TextButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        child: CommonAssetSvgImageWidget(
          imageString: isSelected ? fillIcon : emptyIcon,
          height: 24,
          width: 24,
          imageColor: isSelected
              ? context.appColors.primaryColor
              : context.appColors.surfacesGray6,
        ),
      ),
    );
  }
}
