import 'dart:developer';
import 'dart:io';

import 'package:blooddonation/service/imageservice.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imageprovider extends ChangeNotifier {
  Imageservice imageService = Imageservice();
  File? image;
  String? imgUrl;
  String? imagePath;
  ImagePicker pickimage = ImagePicker();
  Future<void> pickImages() async {
    final pickedFile = await pickimage.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      addImage();
    }
    notifyListeners();
  }

  Future<void> addImage() async {
    try {
      imagePath = await imageService.uploadImage(image!);
      imgUrl = imagePath;
      log('image url getted: $imgUrl');
    } catch (e) {
      log('image url not getting from supabase:$e');
    } finally {
      notifyListeners();
    }
  }
}
