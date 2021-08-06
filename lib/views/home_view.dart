import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_uploader_app/views/home_view_model.dart';
import 'helper/image_widget.dart';
import 'helper/upload_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (_, model, __) => Scaffold(
        appBar: AppBar(
          title: Text('Image Uploader App'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ImageWidget(fileStream: model.imageStream),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () => model.pickImage(),
                  child: Text('Pick Image from gallery')),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              UploadButton(
                  stream: model.uploadStream,
                  onPressed: () => model.uploadImage())
            ],
          ),
        ),
      ),
    );
  }
}
