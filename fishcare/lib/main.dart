import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:FishCare/firebase_options.dart';
import 'src/pages/splash.dart';
import 'src/themes/apptheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FishCare App',
      theme: AppTheme.theme,
      home: const Splash(),
    );
  }
}
