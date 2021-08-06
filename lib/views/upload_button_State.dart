abstract class UploaderWidgetState {
  const UploaderWidgetState();
}

class UploaderStateInitial extends UploaderWidgetState {}

class UploaderStateUploading extends UploaderWidgetState {}

class UploaderStateUploaded extends UploaderWidgetState {}

class UploadStateError extends UploaderWidgetState {
  final String message;
  const UploadStateError({
    required this.message,
  });
}
