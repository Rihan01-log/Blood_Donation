import 'dart:developer';
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class Imageservice {
  Future<String?> uploadImage(File file) async {
    final supbase = Supabase.instance.client;
    final bucketName = 'images';
    final fileName = '${DateTime.now().toIso8601String()} + .jpg';
    try {
      await supbase.storage.from(bucketName).upload(fileName, file);
      final url = supbase.storage.from(bucketName).getPublicUrl(fileName);
      return url;
    } catch (e) {
      log(' error in upload image:$e');
      return null;
    }
  }
}
