import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/helpers/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../di/injection.dart';
import '../../../../widgets/Images/common_cached_image_widget.dart';
import '../../../../widgets/common_file_image_widget.dart';
import '../../../../widgets/common_waiting_dialog_widget.dart';
import '../../../../widgets/dialogs/custom_snack_bar.dart';
import '../bloc/upload_media_cubit.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key, this.pickPhoto});

  final Function(XFile)? pickPhoto;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UploadMediaCubit>(
      create: (_) => getIt<UploadMediaCubit>(),
      // ..setCachedImage(path: SharedText.currentUser.image),
      child: BlocConsumer<UploadMediaCubit, UploadMediaStates>(
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
          final cubit = context.read<UploadMediaCubit>();

          return GestureDetector(
            onTap: () {
              cubit.pickImage(context);
            },
            child: cubit.imageXFile == null
                ? CircleAvatar(
                    radius: 24.sp,
                    child: CommonCachedImageWidget(
                      imageUrl: cubit.cacheImage,
                      width: 100,
                      height: 100,
                      radius: 40,
                    ),
                  )
                : CircleAvatar(
                    radius: 24.sp,
                    child: CommonFileImageWidget(
                      imagePath: cubit.imageXFile!.path,
                      height: 100,
                      width: 100,
                      radius: 1000,
                      fit: BoxFit.fill,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
