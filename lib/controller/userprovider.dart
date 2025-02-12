import 'dart:developer';

import 'package:blooddonation/model/usermodel.dart';
import 'package:blooddonation/service/userservice.dart';
import 'package:flutter/foundation.dart';

class Userprovider extends ChangeNotifier {
  Userservice user = Userservice();
  List<Usermodel> donor = [];
  List bloodGroup = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? newvalue;

  void serDropdown(String value) async {
    newvalue = value;
    notifyListeners();
  }

  Future<void> adddonor(Usermodel data) async {
    try {
      await user.addtoBase(data);
      donor.add(data);
      getdata();
      notifyListeners();
    } catch (e) {
      log('data not added in provider:$e');
    }
  }

  Future<void> getdata() async {
    try {
      donor = await user.getFromDatabase();
      notifyListeners();
    } catch (e) {
      log('data not getting:$e');
    }
  }

  Future<void> updateData(Usermodel data, int id) async {
    try {
      await user.upadateData(data, id);
      getdata();
      notifyListeners();
      log('updated in provider');
    } catch (e) {
      log('updated error in provider:$e');
    }
  }

  Future<void> deletingData(int id) async {
    try {
      await user.deleteFromBase(id);
      getdata();
      notifyListeners();
      log('Deleted in provider');
    } catch (e) {
      log('deleting error in provider:$e');
    }
  }
}
