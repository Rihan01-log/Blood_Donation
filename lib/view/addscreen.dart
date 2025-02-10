import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Addscreen extends StatelessWidget {
  const Addscreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              decoration: InputDecoration(labelText: 'Name'),
            ),
            Gap(10),
            TextField(
              decoration: InputDecoration(labelText: 'Age'),
            ),
            Gap(10),
            TextField(
              decoration: InputDecoration(labelText: 'Phone number'),
            ),
            Gap(10),
            TextField(
              decoration: InputDecoration(labelText: 'Place'),
            ),
            Gap(10),
            ElevatedButton(
              onPressed: () {},
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
