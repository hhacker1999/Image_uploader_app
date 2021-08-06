import 'package:flutter/material.dart';
import 'package:image_uploader_app/views/helper/stream_consumer.dart';
import 'package:rxdart/rxdart.dart';

import '../upload_button_State.dart';

class UploadButton extends StatelessWidget {
  final ValueStream<UploaderWidgetState> stream;
  final VoidCallback onPressed;
  const UploadButton({Key? key, required this.stream, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamConsumer<UploaderWidgetState>(
      listener: (a) {
        if (a is UploaderStateUploaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Image Uploaded Succesfully'),
            ),
          );
        } else if (a is UploadStateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(a.message),
            ),
          );
        }
      },
      stream: stream,
      builder: (_, snapshot) {
        return ElevatedButton(
          onPressed: (snapshot.data is UploaderStateInitial ||
                  snapshot.data is UploaderStateUploaded)
              ? onPressed
              : null,
          child: snapshot.data is UploaderStateUploading
              ? CircularProgressIndicator()
              : Text('Upload Image'),
        );
      },
    );
  }
}