// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewScreen extends StatelessWidget {
  // final imageLoc;
  // ImageViewScreen(this.imageLoc);
  // const ImageViewScreen({ Key? key }) : super(key: key);

  static const String routeName = 'imageviewscreen';

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: Container(
        child: PhotoView(
            basePosition: Alignment.center,
            enableRotation: true,
            imageProvider: FileImage(arg as File)),
      ),
    );
  }
}
