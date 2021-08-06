import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_uploader_app/repositories/image_picker_repository.dart/image_picker_repository.dart';
import 'package:image_uploader_app/repositories/image_picker_repository.dart/image_picker_repository_implementation.dart';
import 'package:image_uploader_app/repositories/image_upload_repository/image_upload_repository.dart';
import 'package:image_uploader_app/repositories/image_upload_repository/image_upload_repository_implementation.dart';
import 'package:image_uploader_app/views/home_view.dart';
import 'package:image_uploader_app/views/home_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ImagePicker _imagePicker;
  late ImagePickerRepository _imagePickerRepository;
  late ImageUploadRepository _imageUploadRepository;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _imagePickerRepository = ImagePickerRepositoryImplementation(_imagePicker);
    _imageUploadRepository = ImageUploadRepositoryImplementation();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Provider<HomeViewModel>(
          create: (_) =>
              HomeViewModel(_imagePickerRepository, _imageUploadRepository),
          child: HomeView()),
    );
  }
}
