import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../widgets/Images/preview_picked_image_dialog.dart';
import '../../../../widgets/take_photo_widget.dart';
import '../../domain/usecase/upload_media_usecase.dart';

part 'upload_media_states.dart';

@Injectable()
class UploadMediaCubit extends Cubit<UploadMediaStates> {
  UploadMediaCubit(this.uploadMediaUseCase) : super(UploadMediaInit());

  final UploadMediaUseCase uploadMediaUseCase;

  String? cacheImage;
  XFile? imageXFile;
  bool imgChange = false;

  set _imageFile(XFile? value) {
    imageXFile = value;
  }

  setCachedImage({String? path}) {
    cacheImage = path;
    emit(UploadMediaInit());
  }

  photoPicked(XFile xFile) {
    _imageFile = xFile;
    emit(UploadMediaInit());
  }

  void pickImage(BuildContext context) {
    takePhotoBottomSheet(
      context: context,
      getPhoto: (file) {
        previewImage(
          context: context,
          imagePath: file.path,
          uploadMedia: () {
            photoPicked(file);
            uploadMedia(context: context);
          },
        );
      },
    );
  }

  void uploadMedia({required BuildContext context}) async {
    emit(UploadMediaLoading());

    var result = await uploadMediaUseCase.uploadMedia(file: imageXFile!);

    result.fold(
      (l) => emit(UploadMediaError(l.errorMassage ?? 'Error')),
      (r) => emit(UploadMediaSuccess()),
    );
  }
}
