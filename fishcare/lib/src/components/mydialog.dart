import 'dart:io';
import 'package:FishCare/src/components/mycustomwidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/firestore.dart';

class MyDialog extends StatefulWidget {
  final bool isHealthy;
  final List<String> label;
  final File selectedImg;
  const MyDialog({
    super.key,
    required this.isHealthy,
    required this.label,
    required this.selectedImg,
  });

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  bool _isLoading = false;

  Future<void> addData() async {
    FirestoreService firestoreService = FirestoreService();
    await firestoreService.addLog(widget.label, widget.selectedImg);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            (widget.isHealthy)
                ? 'assets/image/check.png'
                : 'assets/image/wrong.png',
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 10),
          Text(
            (widget.isHealthy) ? 'Healthy' : 'Not Valid Data',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Close the result dialog
            const MyBackButton(),
            const SizedBox(
              width: 10,
            ),
            //Add result to the database
            if (widget.isHealthy)
              ElevatedButton.icon(
                onPressed: () async {
                  if (_isLoading) return;

                  setState(() {
                    _isLoading = true;
                  });
                  //Add to log function
                  addData();
                  Navigator.pop(context);

                  setState(() {
                    _isLoading = false;
                  });
                },
                icon: const Icon(CupertinoIcons.add),
                label: _isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text('Add'),
              ),
          ],
        ),
      ],
    );
  }
}
