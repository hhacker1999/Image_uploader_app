import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_uploader_app/app/exceptions.dart';
import 'package:image_uploader_app/repositories/image_upload_repository/image_upload_repository.dart';

class ImageUploadRepositoryImplementation implements ImageUploadRepository {
  static const _apiEndPoint = 'https://codelime.in/api/remind-app-token';
  @override
  Future<void> uploadImage(File image) async {
    try {
      final uri = Uri.parse(_apiEndPoint);
      http.MultipartRequest request = http.MultipartRequest('POST', uri)
        ..files
            .add(await http.MultipartFile.fromPath('fileToUpload', image.path));
      await request.send();
    } on SocketException {
      throw NoInternetException();
    }
  }
}
