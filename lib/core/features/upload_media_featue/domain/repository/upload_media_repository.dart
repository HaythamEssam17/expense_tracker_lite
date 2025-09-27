import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../network/error_handling/custom_error.dart';

abstract class IUploadMediaRepository {
  Future<Either<CustomError, String?>> uploadMedia({required XFile file});
}
