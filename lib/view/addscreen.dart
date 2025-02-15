import 'package:blooddonation/controller/imageprovider.dart';
import 'package:blooddonation/controller/userprovider.dart';
import 'package:blooddonation/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({super.key});

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  @override
  Widget build(BuildContext context) {
    final img = Provider.of<Imageprovider>(context);
    TextEditingController name = TextEditingController();
    TextEditingController age = TextEditingController();
    TextEditingController place = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Donors'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    img.pickImages();
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: img.imagePath != null
                        ? NetworkImage(img.imagePath!)
                        : null,
                    child: img.imagePath == null
                        ? Icon(
                            Icons.person,
                            color: Colors.grey,
                          )
                        : null,
                  ),
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
                Consumer<Userprovider>(
                  builder: (context, drop, child) => DropdownButton(
                    hint: Text('Select blood your group'),
                    value: drop.newvalue,
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
                Consumer2<Userprovider, Imageprovider>(
                  builder: (context, value, image, child) => ElevatedButton(
                    onPressed: () {
                      value.adddonor(Usermodel(
                          image: image.imagePath,
                          name: name.text,
                          age: age.text,
                          phoneNumber: phoneNumber.text,
                          place: place.text,
                          bloodGroup: value.newvalue));
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Donor Added')));
                      Navigator.pop(context);
                    },
                    child: Text('Submit'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
