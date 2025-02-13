import 'dart:async';

import 'package:blooddonation/view/homescreen.dart';
import 'package:blooddonation/view/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'WELCOME',
          style: GoogleFonts.lato(
              color: Colors.deepOrange,
              fontSize: 34,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void checkLogin() async {
    await Future.delayed(Duration(seconds: 3));

    final session = Supabase.instance.client.auth.currentSession;
    if (session != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()),
      );
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ));
    }
  }
}
