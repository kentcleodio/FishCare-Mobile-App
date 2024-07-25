import 'package:flutter/material.dart';

class AnalyzeModal4 extends StatelessWidget {
  const AnalyzeModal4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height, // adjust the height as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Adjust the value as needed
        color: Colors.blue[50],
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/image/col.jpg'),
                  radius: 80, // Adjust image radius as needed
                ),
              ],
            ),
            const SizedBox(height: 10), // Add some space
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Tilapia Lake Virus (TiLV)',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20), // Add some space
            const Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              'TiLV is a novel RNA virus causing significant losses in tilapia farms.',
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            const Text(
              'Symptoms:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              '•Sudden high mortality rates.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Lethargy and reduced feeding.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Skin lesions and ulcers.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Abdominal swelling and scale protrusion.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Deformities in the head and eyes (exophthalmia).',
              textAlign: TextAlign.justify,
            ),
                const SizedBox(height: 20),
            const Text(
              'Treatment:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              '•No specific antiviral treatment available.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Biosecurity measures to prevent the spread.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Quarantine of infected and new stock.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Regular monitoring and early detection through diagnostic tests.',
              textAlign: TextAlign.justify,
            ),
                const SizedBox(height: 20), // Add some space
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Space buttons horizontally
              children: [
                // Cancel Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the modal sheet
                    Navigator.pushNamed(context, '/homepage');
                  },
                  child: const Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[300], // Set background color for Cancel button
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 30),
                 // Add Button
                ElevatedButton(
                  onPressed: () {
                    // Handle Add button press
                  },
                  child: const Text('Add'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[300], // Set background color for Add button
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
