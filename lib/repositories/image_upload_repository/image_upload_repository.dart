import 'dart:io';

abstract class ImageUploadRepository {
  Future<void> uploadImage(File image);
}
