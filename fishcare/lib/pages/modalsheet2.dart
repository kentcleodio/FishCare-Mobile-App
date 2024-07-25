import 'package:flutter/material.dart';

class AnalyzeModal2 extends StatelessWidget {
  const AnalyzeModal2({super.key});

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
                  backgroundImage: AssetImage('assets/image/mas.jpg'),
                  radius: 80, // Adjust image radius as needed
                ),
              ],
            ),
            const SizedBox(height: 10), // Add some space
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Motile Aeromonas Septicemia (MAS)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20), // Add some space
            const Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Aeromonas infections are caused by Aeromonas hydrophila, Aeromonas sobria, and Aeromonas caviae.',
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            const Text(
              'Symptoms:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              '•Reddening of the skin and fins.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Hemorrhagic septicemia (bleeding under the skin and within organs).',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Ulcerative lesions on the body.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Fin rot and tail rot.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Swollen abdomen and dropsy (generalized swelling).',
              textAlign: TextAlign.justify,
            ),
                const SizedBox(height: 20),
            const Text(
              'Treatment:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              '•Antibiotics such as oxytetracycline and sulfamethoxazole/trimethoprim.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Improved water quality management.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Use of probiotics to enhance immune response.',
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
