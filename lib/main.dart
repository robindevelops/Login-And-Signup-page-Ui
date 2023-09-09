// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Signuppage.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/Screens/homepage.dart';
import 'package:flutter_application_1/Screens/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/loginpage': (context) => loginpage(),
        '/homepage': (context) => homepage(),
        '/signuppage': (context) => Signuppage(),
      },
      debugShowCheckedModeBanner: false,
      home: Signuppage(),
    );
  }
}
