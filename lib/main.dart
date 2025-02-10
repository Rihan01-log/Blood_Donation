import 'package:blooddonation/view/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://nejqrbznmfgympxshoos.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5lanFyYnpubWZneW1weHNob29zIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkxNjI2MjQsImV4cCI6MjA1NDczODYyNH0.d0YWUto31GV8vkpF86tJ7gYHBV7NfBrzdgn2I1Vat6U');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Donation',
      home: Homescreen(),
    );
  }
}
