import 'package:blooddonation/controller/imageprovider.dart';
import 'package:blooddonation/controller/userprovider.dart';
import 'package:blooddonation/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
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
      required this.image,
      required this.phoneNumber});

  @override
  State<Updatepage> createState() => _UpdatepageState();
}

class _UpdatepageState extends State<Updatepage> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  String? selectedBloodGroup;

  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.name);
    age = TextEditingController(text: widget.age);
    place = TextEditingController(text: widget.place);
    phoneNumber = TextEditingController(text: widget.phoneNumber);
    selectedBloodGroup = widget.bloodGroup;
  }

  @override
  Widget build(BuildContext context) {
    final image = Provider.of<Imageprovider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Imageprovider>(
              builder: (context, value, child) => InkWell(
                onTap: () {
                  value.pickImages();
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: image.imagePath != null
                      ? NetworkImage(image.imagePath!)
                      : widget.image != null
                          ? NetworkImage(widget.image!) // Show existing image
                          : null,
                ),
              ),
            ),
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
            Consumer<Userprovider>(
              builder: (context, drop, child) => DropdownButton(
                hint: Text('Select blood your group'),
                value: selectedBloodGroup,
                isExpanded: true,
                items: drop.bloodGroup.map((item) {
                  return DropdownMenuItem<String>(
                      value: item, child: Text(item));
                }).toList(),
                onChanged: (value) {
                  drop.serDropdown(value!);
                },
              ),
            ),
            Gap(10),
            TextField(
              controller: phoneNumber,
              decoration: InputDecoration(labelText: 'Phone number'),
            ),
            Gap(10),
            Consumer2<Userprovider, Imageprovider>(
              builder: (context, value, imag, child) => ElevatedButton(
                  onPressed: () {
                    value.updateData(
                        Usermodel(
                            image: imag.imagePath,
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
