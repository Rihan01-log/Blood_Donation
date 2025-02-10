import 'dart:developer';

import 'package:blooddonation/model/usermodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Userservice {
  final bloodDonationData = Supabase.instance.client.from('blood_donation');

  Future<List<Usermodel>> getFromDatabase() async {
    try {
      final data = await bloodDonationData.select('*');
      log(data.toString());
      return data.map((data) => Usermodel.fromBase(data)).toList();
    } catch (e) {
      throw Exception('error in getting:$e');
    }
  }

  Future<void> addtoBase(Usermodel data) async {
    try {
      await bloodDonationData.insert([data.toBase()]);
      log('added in service');
    } catch (e) {
      log('error in adding :$e');
    }
  }
}
