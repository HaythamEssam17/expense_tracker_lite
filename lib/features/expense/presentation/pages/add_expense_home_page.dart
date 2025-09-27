import 'package:expense_tracker_lite/core/app/app_scaffold_page.dart';
import 'package:expense_tracker_lite/core/constants/app_constants.dart';
import 'package:expense_tracker_lite/core/factories/back_arrow_factory.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/num_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/fonts.dart';
import 'package:expense_tracker_lite/core/helpers/shared.dart';
import 'package:expense_tracker_lite/core/widgets/common_global_button.dart';
import 'package:expense_tracker_lite/core/widgets/common_shadow_widget.dart';
import 'package:expense_tracker_lite/core/widgets/common_title_text.dart';
import 'package:expense_tracker_lite/core/widgets/dialogs/custom_flush_bar.dart';
import 'package:expense_tracker_lite/core/widgets/form_input_widgets/name_form_widget.dart';
import 'package:expense_tracker_lite/features/dashboard/presentation/bloc/dashboard_expense_logic/dashboard_expense_cubit.dart';
import 'package:expense_tracker_lite/features/expense/presentation/bloc/expenses_logic/expenses_cubit.dart';
import 'package:expense_tracker_lite/features/expense/presentation/widgets/select_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/factories/date_picker_factory.dart';
import '../../../../core/routers/app_route.dart';
import '../../../../core/widgets/form_input_widgets/number_form_widget.dart';
import '../../../../core/widgets/text_field_utils/number_input_formatter.dart';
import '../bloc/add_expense_logic/add_expense_cubit.dart';
import '../widgets/attach_receipt_widget.dart';
import '../widgets/categories_list_widget.dart';

class AddExpenseHomePage extends StatelessWidget {
  const AddExpenseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      appBar: AppBar(
        backgroundColor: context.appColors.bgWhite,
        leading: IconButton(
          onPressed: () => router.pop(),
          icon: PlatformArrowIndictor.buildArrow(context: context),
        ),
        title: CommonText(
          'Add Expense',
          fontSize: 20,
          fontFamily: Fonts.cairoSemiBold,
        ),
      ),
      body: BlocConsumer<AddExpenseCubit, AddExpenseStates>(
        listener: (context, state) {
          if (state is AddExpenseAddedSuccess) {
            router.pop();

            context.read<DashboardExpenseCubit>().getExpensesList();
            BlocProvider.of<ExpensesCubit>(context).getExpensesList();
          } else if (state is AddExpenseAddedFailed) {
            router.pop();
            showFlushBar(
              context: context,
              title: 'Failed',
              message: state.errorMessage,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<AddExpenseCubit>();

          return Form(
            key: cubit.addExpenseForm.formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16.0.sp),
                    child: Column(
                      children: [
                        // Category
                        ...[const SelectCategoryWidget(), getSpaceHeight(16)],
                        // Amount
                        ...[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                'Amount',
                                fontSize: 18,
                                fontFamily: Fonts.cairoSemiBold,
                              ),
                              getSpaceHeight(8),
                              NumberFormWidget(
                                numberController:
                                    cubit.addExpenseForm.amountController,
                                hintKey: '\$ 50,000',
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9,]'),
                                  ),
                                  NumberInputFormatter(),
                                ],
                                numberOnChanged: (value) {
                                  cubit.setAmount(value!);
                                  return value;
                                },
                              ),
                            ],
                          ),
                          getSpaceHeight(16),
                        ],
                        // Date
                        ...[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                'Date',
                                fontSize: 18,
                                fontFamily: Fonts.cairoSemiBold,
                              ),
                              getSpaceHeight(8),
                              InkWell(
                                onTap: () async {
                                  await PlatformDatePicker.show(context, (
                                    date,
                                  ) {
                                    String formattedDate = DateFormat(
                                      'MM/dd/yyyy',
                                    ).format(date);

                                    cubit.setDate(formattedDate);
                                  });
                                },
                                child: AbsorbPointer(
                                  child: NameFormWidget(
                                    nameController:
                                        cubit.addExpenseForm.dateController,
                                    hintKey: '02/01/25',
                                    checkValidation: false,
                                    suffixIcon: const Icon(
                                      Icons.calendar_month_outlined,
                                      size: 24,
                                    ),
                                    nameOnChanged: (value) {
                                      cubit.setAttachImage(value!);
                                      return value;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          getSpaceHeight(16),
                        ],
                        // Receipt
                        ...[const AttachReceiptWidget(), getSpaceHeight(16)],

                        /// Categories Grid
                        const CategoriesListWidget(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                CommonShadowWidget(
                  widget: CommonGlobalButton(
                    buttonText: 'Save',
                    onPressedFunction: () {
                      cubit.saveExpense(isExpense: true);
                    },
                    radius: AppConstants.radius10,
                    buttonTextSize: 18,
                    isLoading: state is AddExpenseLoading,
                    buttonBackgroundColor: context.appColors.primaryColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
