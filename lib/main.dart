import 'package:blooddonation/controller/imageprovider.dart';
import 'package:blooddonation/controller/userprovider.dart';
import 'package:blooddonation/firebase_options.dart';
import 'package:blooddonation/view/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
      url: 'https://nejqrbznmfgympxshoos.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5lanFyYnpubWZneW1weHNob29zIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkxNjI2MjQsImV4cCI6MjA1NDczODYyNH0.d0YWUto31GV8vkpF86tJ7gYHBV7NfBrzdgn2I1Vat6U');
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => Userprovider()),
      ChangeNotifierProvider(
        create: (context) => Imageprovider(),
      )
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.pinkAccent),
      title: 'Blood Donation',
      home: Splashscreen(),
    );
  }
}
