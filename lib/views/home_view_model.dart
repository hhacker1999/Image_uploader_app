import 'dart:async';
import 'dart:io';

import 'package:image_uploader_app/views/upload_button_State.dart';
import 'package:rxdart/rxdart.dart';

import 'package:image_uploader_app/repositories/image_picker_repository.dart/image_picker_repository.dart';
import 'package:image_uploader_app/repositories/image_upload_repository/image_upload_repository.dart';

class HomeViewModel {
  final ImagePickerRepository _imagePickerRepository;
  final ImageUploadRepository _imageUploadRepository;
  final BehaviorSubject<UploaderWidgetState> _uploadSubject =
      BehaviorSubject<UploaderWidgetState>();
  final BehaviorSubject<File> _imageSubject = BehaviorSubject<File>();

  HomeViewModel(this._imagePickerRepository, this._imageUploadRepository);

  ValueStream<UploaderWidgetState> get uploadStream => _uploadSubject;
  ValueStream<File> get imageStream => _imageSubject;

  Future<void> pickImage() async {
    final result = await _imagePickerRepository.pickImage();
    if (result != null) {
      _imageSubject.add(result);
      _uploadSubject.add(UploaderStateInitial());
    }
  }

  Future<void> uploadImage() async {
    _uploadSubject.add(UploaderStateUploading());
    try {
      await _imageUploadRepository.uploadImage(imageStream.value);
      _uploadSubject.add(UploaderStateUploaded());
    } catch (_) {
      _uploadSubject.add(UploadStateError(
          message: 'Please check your internet connection before uploading '));
    }
  }

  void dispose() {
    _uploadSubject.close();
    _imageSubject.close();
  }
}


