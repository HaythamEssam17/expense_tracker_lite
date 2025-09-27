import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../network/dio_base_execute.dart';
import '../../../../network/error_handling/custom_error.dart';

abstract class UploadMediaDataSource {
  Future<Either<CustomError, String?>> uploadMedia({required XFile file});
}

@Injectable(as: UploadMediaDataSource)
class UploadMediaDataSourceImpl implements UploadMediaDataSource {
  @override
  Future<Either<CustomError, String?>> uploadMedia({
    required XFile file,
  }) async {
    return executeAndHandleError(() async {
      return null;
    });
  }
}
