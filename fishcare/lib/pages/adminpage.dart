import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.blue[300],
        foregroundColor: Colors.white,
        actions: [
            IconButton(onPressed: () {
              Navigator.pushNamed(context, '/homepage');
            }, icon: Image.asset('assets/image/Fishlogo.png', width: 30, height: 30,))
          ],
        ),
    );
  }
}