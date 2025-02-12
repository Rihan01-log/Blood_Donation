import 'package:blooddonation/controller/userprovider.dart';
import 'package:blooddonation/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Updatepage extends StatefulWidget {
  int? id;
  String? name;
  String? age;
  String? bloodGroup;
  String? place;
  String? image;
  String? phoneNumber;
  Updatepage(
      {super.key,
      required this.name,
      required this.age,
      required this.bloodGroup,
      required this.place,
      required this.id,
      this.image,
      required this.phoneNumber});

  @override
  State<Updatepage> createState() => _UpdatepageState();
}

class _UpdatepageState extends State<Updatepage> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.name);
    age = TextEditingController(text: widget.age);
    place = TextEditingController(text: widget.place);
    phoneNumber = TextEditingController(text: widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              controller: place,
              decoration: InputDecoration(labelText: 'Place'),
            ),
            Gap(10),
            TextField(
              controller: phoneNumber,
              decoration: InputDecoration(labelText: 'Phone number'),
            ),
            Gap(10),
            Consumer<Userprovider>(
              builder: (context, value, child) => ElevatedButton(
                  onPressed: () {
                    value.updateData(
                        Usermodel(
                            name: name.text,
                            age: age.text,
                            phoneNumber: phoneNumber.text,
                            place: place.text,
                            bloodGroup: value.newvalue),
                        widget.id!);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Data updated')));
                    Navigator.pop(context);
                  },
                  child: Text('Save')),
            )
          ],
        ),
      ),
    );
  }
}
