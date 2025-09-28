part of 'export_cubit.dart';

@Injectable()
class ExportState {
  final bool isLoading;
  final String? filePath;
  final String? error;

  ExportState({this.isLoading = false, this.filePath, this.error});
}
