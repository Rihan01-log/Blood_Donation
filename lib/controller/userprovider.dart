

import 'dart:developer';

import 'package:blooddonation/model/usermodel.dart';
import 'package:blooddonation/service/userservice.dart';
import 'package:flutter/foundation.dart';

class Userprovider extends ChangeNotifier {
  Userservice user=Userservice();
  List<Usermodel>donor=[];

  Future<void>adddonor(Usermodel data)async{
    try {
      await user.addtoBase(data);
      donor.add(data);
      getdata();
      notifyListeners();
    } catch (e) {
      log('data not getted in provider:$e');
    }
  }

  Future<void>getdata()async{
    try{
    donor=await user.getFromDatabase();
    notifyListeners();
    }catch(e){
    log('data not getting:$e');   
   }
  }
}