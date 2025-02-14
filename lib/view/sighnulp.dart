import 'dart:developer';

import 'package:blooddonation/view/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Sighnup extends StatelessWidget {
  const Sighnup({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 300,
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Email'),
                    ),
                    Gap(10),
                    TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Password'),
                    ),
                    Gap(10),
                    OutlinedButton(
                      onPressed: () async {
                        try {
                          final data =
                              await Supabase.instance.client.auth.signUp(
                            email: email.text,
                            password: password.text,
                          );

                          if (data.session != null) {
                            log('User registered successfully');
                        
                            Navigator.pushReplacement(
                                // ignore: use_build_context_synchronously
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Homescreen(),
                                ));
                          } else {
                            log('Registration successful, but no session created.');
                          }
                        } catch (e) {
                          log('Error: $e');
                        }
                      },
                      style:
                          OutlinedButton.styleFrom(minimumSize: Size(180, 40)),
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
