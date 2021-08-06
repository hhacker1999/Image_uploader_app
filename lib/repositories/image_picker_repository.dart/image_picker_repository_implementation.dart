import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:image_uploader_app/repositories/image_picker_repository.dart/image_picker_repository.dart';

class ImagePickerRepositoryImplementation implements ImagePickerRepository {
  final ImagePicker _imagePicker;

  const ImagePickerRepositoryImplementation(this._imagePicker);
  @override
  Future<File?> pickImage() async {
    final file = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      return File(file.path);
    } else
      return null;
  }
}
