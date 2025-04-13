import 'package:FishCare/src/services/firestore.dart';
import 'package:flutter/material.dart';

class BulkUpload extends StatefulWidget {
  const BulkUpload({super.key});

  @override
  State<BulkUpload> createState() => _BulkUploadState();
}

class _BulkUploadState extends State<BulkUpload> {
  FirestoreService firestoreService = FirestoreService();
  int repeatCount = 1; // Default upload count
  String result = 'Healthy';
  String symptom = 'No Symptoms';
  DateTime selectedDate = DateTime.now();
  bool isLoading = false; // Loading indicator flag

  Future<void> bulkUpload({
    required int repeatCount,
    required String result,
    required String symptom,
    required DateTime timestamp,
  }) async {
    // Map symptom to the corresponding image URL
    String imageUrl = getImageUrl(symptom);

    // Repeat upload 'repeatCount' times
    for (int i = 0; i < repeatCount; i++) {
      await firestoreService.addBulkLog(result, symptom, timestamp, imageUrl);
    }
    debugPrint('Bulk upload completed successfully.');
  }

  // Helper function to get image URL based on symptom
  String getImageUrl(String symptom) {
    switch (symptom) {
      case 'No Symptoms':
        return 'https://firebasestorage.googleapis.com/v0/b/fishcare-a8931.appspot.com/o/images%2Flog%20images%2F1734219684363926?alt=media&token=165d5c02-5b19-4ecd-bcd2-65fb0d4d76fb';
      case 'Abdominal Distension':
        return 'https://firebasestorage.googleapis.com/v0/b/fishcare-a8931.appspot.com/o/images%2Flog%20images%2F1734219717892775?alt=media&token=dc02d3ba-40ff-415e-b2a9-9f50ff3ec4d9';
      case 'Exophthalmia (Pop-Eye)':
        return 'https://firebasestorage.googleapis.com/v0/b/fishcare-a8931.appspot.com/o/images%2Flog%20images%2F1734219777309940?alt=media&token=b3dd5cc4-57fc-40f2-bbe1-b74cf6f5138c';
      case 'Skin Erosion':
        return 'https://firebasestorage.googleapis.com/v0/b/fishcare-a8931.appspot.com/o/images%2Flog%20images%2F1734219742184461?alt=media&token=dae92d27-0739-4ee2-be45-a87c661b325b';
      default:
        return '';
    }
  }

  // Date picker function
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Bulk upload handler with loading indicator
  void _handleBulkUpload() async {
    setState(() {
      isLoading = true; // Start loading
    });

    try {
      await bulkUpload(
        repeatCount: repeatCount,
        result: result,
        symptom: symptom,
        timestamp: selectedDate,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bulk upload completed successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error during bulk upload: $e')),
      );
    } finally {
      setState(() {
        isLoading = false; // Stop loading
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bulk Upload')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Number of uploads
            const Text('Number of Uploads:'),
            const SizedBox(height: 5),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              onChanged: (value) {
                setState(() {
                  repeatCount = int.tryParse(value) ?? 1;
                });
              },
            ),
            const SizedBox(height: 10),

            // Result Dropdown
            const Text('Select Result:'),
            DropdownButton<String>(
              value: result,
              isExpanded: true,
              onChanged: (newValue) {
                setState(() {
                  result = newValue!;
                });
              },
              items: ['Healthy', 'Not Healthy']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),

            // Symptom Dropdown
            const Text('Select Symptom:'),
            DropdownButton<String>(
              value: symptom,
              isExpanded: true,
              onChanged: (newValue) {
                setState(() {
                  symptom = newValue!;
                });
              },
              items: [
                'No Symptoms',
                'Abdominal Distension',
                'Exophthalmia (Pop-Eye)',
                'Skin Erosion'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),

            // Date Picker
            const Text('Select Timestamp:'),
            Row(
              children: [
                Text(selectedDate.toString()),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Upload Button with Loading Indicator
            Center(
              child: ElevatedButton(
                onPressed: isLoading ? null : _handleBulkUpload,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: isLoading
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text('Uploading...'),
                        ],
                      )
                    : const Text('Start Bulk Upload'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
