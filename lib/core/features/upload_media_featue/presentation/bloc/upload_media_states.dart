part of 'upload_media_cubit.dart';

@Injectable()
class UploadMediaStates {}

class UploadMediaInit extends UploadMediaStates {}

class UploadMediaLoading extends UploadMediaStates {}

class UploadMediaSuccess extends UploadMediaStates {}

class UploadMediaError extends UploadMediaStates {
  final String error;
  UploadMediaError(this.error);
}

class MediaPickedSuccessfully extends UploadMediaStates {}

class MediaPickedFailed extends UploadMediaStates {}
