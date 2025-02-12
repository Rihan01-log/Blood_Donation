import 'dart:io';

import 'package:blooddonation/service/imageservice.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imageprovider extends ChangeNotifier {
  Imageservice imageService = Imageservice();
  List<String> images = [];
  File? image;
  final ImagePicker pickimage = ImagePicker();
  Future<void> uploadImage() async {
    final pickedFile = await pickimage.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
  }
}
