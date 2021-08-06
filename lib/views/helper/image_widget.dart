import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rxdart/streams.dart';

class ImageWidget extends StatelessWidget {
  final ValueStream<File> fileStream;
  const ImageWidget({Key? key, required this.fileStream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<File>(
        stream: fileStream,
        builder: (_, snapshot) {
          if (snapshot.data == null) {
            return SizedBox(
              height: 400,
            );
          } else {
            return Image.file(
              snapshot.data!,
              height: 400,
              fit: BoxFit.fill,
            );
          }
        });
  }
}
