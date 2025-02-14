import 'dart:developer';

import 'package:blooddonation/service/auth.dart';
import 'package:blooddonation/view/homescreen.dart';
import 'package:blooddonation/view/sighnulp.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override


  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 380,
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
                          final data = await Supabase.instance.client.auth
                              .signInWithPassword(
                                  password: password.text, email: email.text);
                          if (data.user != null) {
                            log('user foundd');
                            Navigator.pushReplacement(
                                // ignore: use_build_context_synchronously
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Homescreen(),
                                ));
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Login Succesfully')));
                          }
                        } catch (e) {
                          log('$e');
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Login failed')));
                        }
                      },
                      style:
                          OutlinedButton.styleFrom(minimumSize: Size(180, 40)),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        AuthServices().nativeGoogleSignIn().then((value) {
                          
                          if (value == 'google auth success') {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => Homescreen()));
                          }
                        });
                      },
                      icon: Icon(Icons.login),
                      label: Text("Sign with Google"),
                      style:
                          OutlinedButton.styleFrom(minimumSize: Size(180, 40)),
                    ),
                    Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have any account?'),
                        TextButton(
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Sighnup(),
                                  ));
                            },
                            child: Text('SignUp'))
                      ],
                    )
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
