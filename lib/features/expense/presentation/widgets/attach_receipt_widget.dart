import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/features/upload_media_featue/presentation/bloc/upload_media_cubit.dart';
import '../../../../core/helpers/fonts.dart';
import '../../../../core/helpers/shared.dart';
import '../../../../core/widgets/common_title_text.dart';
import '../../../../core/widgets/common_waiting_dialog_widget.dart';
import '../../../../core/widgets/dialogs/custom_snack_bar.dart';
import '../../../../core/widgets/form_input_widgets/name_form_widget.dart';
import '../bloc/add_expense_logic/add_expense_cubit.dart';

class AttachReceiptWidget extends StatelessWidget {
  const AttachReceiptWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadMediaCubit, UploadMediaStates>(
      listener: (context, state) {
        if (state is UploadMediaLoading) {
          showWaitingDialog(context);
        } else if (state is UploadMediaError) {
          Navigator.pop(context);
          showSnackBar(
            context: context,
            title: state.error,
            color: context.textColors.error,
          );
        } else if (state is UploadMediaSuccess) {
          Navigator.pop(context);
          showSnackBar(
            context: context,
            title: 'Your image updated successfully',
            color: context.appColors.green600,
          );
        }
      },

      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              'Attach Receipt',
              fontSize: 18,
              fontFamily: Fonts.cairoSemiBold,
            ),
            getSpaceHeight(8),
            InkWell(
              onTap: () => context.read<UploadMediaCubit>().pickImage(context),
              child: AbsorbPointer(
                child: NameFormWidget(
                  nameController: context
                      .read<AddExpenseCubit>()
                      .addExpenseForm
                      .receiptController,
                  hintKey: 'Upload image',
                  checkValidation: false,
                  suffixIcon: const Icon(
                    CupertinoIcons.camera_viewfinder,
                    size: 24,
                  ),
                  nameOnChanged: (value) => value,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
