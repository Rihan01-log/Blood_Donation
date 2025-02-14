import 'package:blooddonation/controller/imageprovider.dart';
import 'package:blooddonation/controller/userprovider.dart';
import 'package:blooddonation/view/addscreen.dart';
import 'package:blooddonation/view/login.dart';
import 'package:blooddonation/view/updatepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
      appBar: AppBar(
        title: Text("Donors"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Supabase.instance.client.auth.signOut();
                Navigator.pushReplacement(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Log out successfully')));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Addscreen(),
              ));
        },
        child: Icon(Icons.add),
      ),
      body: Consumer2<Userprovider, Imageprovider>(
          builder: (context, value, img, child) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: value.donor.length,
                    itemBuilder: (context, index) {
                      final data = value.donor[index];
                      final id = data.id;
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(data.image ?? 'unknown'),
                          ),
                          title: Text(data.name!),
                          subtitle: Text(data.bloodGroup ?? 'unknown'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Updatepage(
                                              image: data.image,
                                              id: id,
                                              name: data.name,
                                              age: data.age,
                                              bloodGroup: data.bloodGroup,
                                              place: data.place,
                                              phoneNumber: data.phoneNumber),
                                        ));
                                  },
                                  icon: Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    value.deletingData(data.id!);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text('Donor data deleted')));
                                  },
                                  icon: Icon(Icons.delete))
                            ],
                          ),
                        ),
                      );
                    }),
              )),
    );
  }
}


