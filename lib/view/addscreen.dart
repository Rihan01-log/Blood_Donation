import 'package:blooddonation/controller/userprovider.dart';
import 'package:blooddonation/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Addscreen extends StatefulWidget {
  Addscreen({super.key});

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController age = TextEditingController();
    TextEditingController place = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.black,
            ),
            Gap(10),
            TextField(
              controller: name,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            Gap(10),
            TextField(
              controller: age,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            Gap(10),
            TextField(
              controller: phoneNumber,
              decoration: InputDecoration(labelText: 'Phone number'),
            ),
            Gap(10),
            TextField(
              controller: place,
              decoration: InputDecoration(labelText: 'Place'),
            ),
            Gap(10),
            ElevatedButton(
              onPressed: () {
                Provider.of<Userprovider>(context, listen: false).adddonor(
                    Usermodel(
                        name: name.text,
                        age: age.text,
                        phoneNumber: phoneNumber.text,
                        place: place.text));
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
