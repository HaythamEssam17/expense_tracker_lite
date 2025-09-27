import 'package:expense_tracker_lite/core/helpers/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../helpers/fonts.dart';
import '../helpers/shared.dart';
import '../routers/app_route.dart';
import 'common_title_text.dart';

Future<void> takePhotoBottomSheet({
  required BuildContext context,
  Function(XFile)? getPhoto,
  bool multiImage = false,
}) async {
  await showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) => CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: CommonText(
            'Take Photo',

            color: context.appColors.primaryColor,
            fontSize: 20,
          ),

          onPressed: () {
            router.pop();
            pickSingleImage(getImage: getPhoto, source: ImageSource.camera);
          },
        ),
        CupertinoActionSheetAction(
          child: Text(
            'Choose Photo',
            style: TextStyle(
              color: context.appColors.primaryColor,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            router.pop();
            pickSingleImage(getImage: getPhoto, source: ImageSource.gallery);
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        isDefaultAction: true,
        onPressed: () {
          Navigator.pop(context, 'Cancel');
        },
        child: Text(
          'Cancel',
          style: TextStyle(
            color: context.appColors.primaryColor,
            fontFamily: Fonts.cairoMedium,
            fontSize: 20,
          ),
        ),
      ),
    ),
  );
  // await showModalBottomSheet(
  //   backgroundColor: Colors.transparent,
  //   barrierColor: Colors.black.withOpacity(0.4),
  //   context: context,
  //   builder: (builderCtx) => Container(
  //     width: double.infinity,
  //     padding: EdgeInsets.symmetric(horizontal: 12.sp),
  //     decoration: const BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.only(
  //         topRight: Radius.circular(AppConstants.radius14),
  //         topLeft: Radius.circular(AppConstants.radius14),
  //       ),
  //     ),
  //     child: IntrinsicHeight(
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           getSpaceHeight(12),
  //           InkWell(
  //             highlightColor: Colors.transparent,
  //             splashColor: Colors.transparent,
  //             hoverColor: Colors.transparent,
  //             focusColor: Colors.transparent,
  //             onTap: () {
  //               pickSingleImage(getImage: getPhoto, source: ImageSource.camera);
  //               router.pop();
  //             },
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 CommonAssetSvgImageWidget(
  //                   imageString: IconPath.cameraIcon,
  //                   height: 18,
  //                   width: 20,
  //                 ),
  //                 getSpaceWidth(10),
  //                 const CommonText('Camera'),
  //               ],
  //             ),
  //           ),
  //           getSpaceHeight(16),
  //           InkWell(
  //             highlightColor: Colors.transparent,
  //             splashColor: Colors.transparent,
  //             hoverColor: Colors.transparent,
  //             focusColor: Colors.transparent,
  //             onTap: () {
  //               if (multiImage) {
  //                 pickMultiImage(
  //                   getImage: getPhoto,
  //                   source: ImageSource.gallery,
  //                 );
  //               } else {
  //                 pickSingleImage(
  //                   getImage: getPhoto,
  //                   source: ImageSource.gallery,
  //                 );
  //               }
  //               router.pop();
  //             },
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 CommonAssetSvgImageWidget(
  //                   imageString: IconPath.galleryIcon,
  //                   height: 18,
  //                   width: 20,
  //                 ),
  //                 getSpaceWidth(10),
  //                 const CommonText('Gallery'),
  //               ],
  //             ),
  //           ),
  //           getSpaceHeight(16 + MediaQuery.of(context).padding.bottom),
  //         ],
  //       ),
  //     ),
  //   ),
  // );
}

void pickSingleImage({
  required Function(XFile)? getImage,
  required ImageSource source,
}) async {
  try {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile == null) {
    } else {
      getImage!(pickedFile);
    }
  } catch (e) {
    devLog('Error Fetching Image: $e');
  }
}

void pickMultiImage({
  required Function(XFile)? getImage,
  required ImageSource source,
}) async {
  try {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickMultiImage();
    if (pickedFile.isEmpty) {
    } else {
      for (var element in pickedFile) {
        getImage!(element);
      }
    }
  } catch (e) {
    devLog('Error Fetching Image: $e');
  }
}
