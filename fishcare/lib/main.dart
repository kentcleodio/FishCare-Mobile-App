// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:FishCare/pages/aboutpage.dart';
import 'package:FishCare/pages/homepage.dart';
import 'package:FishCare/pages/adminpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:FishCare/pages/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
      routes: {
        '/homepage' :(context) => HomePage(),
        '/adminpage' :(context) => AdminPage(),
        '/aboutpage' :(context) => AboutPage(),
      },
    );
  }
}