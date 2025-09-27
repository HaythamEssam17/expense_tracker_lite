import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../network/error_handling/custom_error.dart';
import '../../../../services/hive/hive_service.dart';
import '../../domain/repository/upload_media_repository.dart';
import '../datasource/upload_file_data_source.dart';

@Injectable(as: IUploadMediaRepository)
class UploadMediaRepositoryImpl implements IUploadMediaRepository {
  final UploadMediaDataSource uploadMediaDataSource;
  final HiveServiceProvider hiveServiceProvider = HiveServiceProvider.i;

  UploadMediaRepositoryImpl(this.uploadMediaDataSource);

  @override
  Future<Either<CustomError, String?>> uploadMedia({
    required XFile file,
  }) async {
    return await uploadMediaDataSource
        .uploadMedia(file: file)
        .then(
          (value) => value.fold((l) => left(l), (r) async {
            if (r == null) {
              return left(CustomError(errorMassage: r));
            } else {
              // await hiveServiceProvider.updateUserImage(r);

              return right(r);
            }
          }),
        );
  }
}
