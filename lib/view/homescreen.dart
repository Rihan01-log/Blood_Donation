import 'package:blooddonation/controller/userprovider.dart';
import 'package:blooddonation/model/usermodel.dart';
import 'package:blooddonation/view/addscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<Userprovider>(context, listen: false).getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Addscreen(),
              ));
        },
      ),
      body: Consumer<Userprovider>(
          builder: (context, value, child) => ListView.builder(
              itemCount: value.donor.length,
              itemBuilder: (context, index) {
                final data = value.donor[index];
                return ListTile(
                  title: Text(data.name!),
                  subtitle: Text(data.age!),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                    ],
                  ),
                );
              })),
    );
  }
}
