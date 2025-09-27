import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../network/error_handling/custom_error.dart';
import '../repository/upload_media_repository.dart';

@Injectable()
class UploadMediaUseCase {
  final IUploadMediaRepository iUploadMediaRepository;

  UploadMediaUseCase(this.iUploadMediaRepository);

  Future<Either<CustomError, String?>> uploadMedia({
    required XFile file,
  }) async {
    return iUploadMediaRepository.uploadMedia(file: file);
  }
}
