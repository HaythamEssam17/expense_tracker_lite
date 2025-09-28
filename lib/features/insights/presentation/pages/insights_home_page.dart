import 'package:expense_tracker_lite/core/app/app_scaffold_page.dart';
import 'package:expense_tracker_lite/core/constants/icon_paths.dart';
import 'package:expense_tracker_lite/core/factories/circular_indicator_factory.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/routers/app_route.dart';
import 'package:expense_tracker_lite/core/widgets/common_title_text.dart';
import 'package:expense_tracker_lite/core/widgets/common_waiting_dialog_widget.dart';
import 'package:expense_tracker_lite/core/widgets/dialogs/custom_snack_bar.dart';
import 'package:expense_tracker_lite/features/dashboard/presentation/widgets/expense_item.dart';
import 'package:expense_tracker_lite/features/expense/presentation/bloc/expenses_logic/expenses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/features/export_files_feature/presentation/bloc/export_cubit.dart';
import '../../../../core/helpers/fonts.dart';
import '../../../../core/helpers/shared.dart';
import '../../../../core/widgets/Images/common_asset_svg_image_widget.dart';
import '../../../../core/widgets/common_empty_widget.dart';
import '../../../../core/widgets/common_error_widget.dart';
import '../../../../core/widgets/loaders/list_loader_widget.dart';

class InsightsHomePage extends StatelessWidget {
  const InsightsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      appBar: AppBar(
        backgroundColor: context.appColors.bgWhite,
        title: CommonText(
          'Expenses List',
          fontSize: 20,
          fontFamily: Fonts.cairoSemiBold,
        ),
      ),
      body: BlocConsumer<ExpensesCubit, ExpensesStates>(
        listener: (ctx, state) {},
        builder: (ctx, state) {
          final cubit = ctx.read<ExpensesCubit>();

          if (state is ExpensesErrorState) {
            return CommonError(
              errorMassage: state.error,
              withButton: true,
              onTap: () => cubit.getExpensesList(),
            );
          } else if (state is ExpensesLoadingState) {
            return ListLoaderWidget(
              itemCount: 10,
              itemHeight: getWidgetHeight(65),
              itemRadius: 16,
              padding: EdgeInsets.symmetric(
                vertical: getWidgetHeight(8),
                horizontal: getWidgetWidth(16),
              ),
            );
          } else if (state is ExpensesEmptyState) {
            return EmptyScreen(
              titleKey: 'No Expenses found',
              imageString: IconPath.emptyIcon,
              imageHeight: 125,
              imageWidth: 180,
            );
          } else {
            return RefreshIndicator(
              color: context.appColors.primaryColor,
              onRefresh: cubit.onRefresh,
              child: Column(
                children: [
                  BlocConsumer<ExportCubit, ExportState>(
                    listener: (context, state) {
                      if (state.isLoading) {
                        showWaitingDialog(context);
                      } else if (state.filePath != null) {
                        router.pop();
                        showSnackBar(
                          context: context,
                          title: 'File exported',
                          color: context.appColors.green600,
                        );
                      } else if (state.error != null) {
                        router.pop();
                        showSnackBar(
                          context: context,
                          title: 'Error: ${state.error}',
                        );
                      }
                    },
                    builder: (context, state) {
                      return Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              context.read<ExportCubit>().exportAsCsv(
                                context.read<ExpensesCubit>().expensesList,
                              );
                            },
                            icon: CommonAssetSvgImageWidget(
                              imageString: IconPath.csvIcon,
                              height: 16,
                              width: 16,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context.read<ExportCubit>().exportAsCsv(
                                context.read<ExpensesCubit>().expensesList,
                              );
                            },
                            icon: CommonAssetSvgImageWidget(
                              imageString: IconPath.pdfIcon,
                              height: 16,
                              width: 16,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      shrinkWrap: true,
                      controller: cubit.scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: cubit.expensesList.length + 1,
                      separatorBuilder: (context, index) {
                        return getSpaceHeight(8);
                      },
                      itemBuilder: (context, index) {
                        if (index >= cubit.expensesList.length &&
                            cubit.hasMoreData) {
                          return PlatformCircularIndictor.buildCircular(
                            context: context,
                          );
                        } else if (index >= cubit.expensesList.length) {
                          return const SizedBox();
                        } else {
                          return ExpenseItem(
                            expenseModel: cubit.expensesList[index],
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
