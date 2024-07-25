import 'package:flutter/material.dart';

class AnalyzeModal3 extends StatelessWidget {
  const AnalyzeModal3({super.key});

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
                  backgroundImage: AssetImage('assets/image/str.png'),
                  radius: 80, // Adjust image radius as needed
                ),
              ],
            ),
            const SizedBox(height: 10), // Add some space
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Streptococcosis',
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
              'Streptococcal infections are caused by Streptococcus spp., primarily Streptococcus iniae and Streptococcus agalactiae.',
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            const Text(
              'Symptoms:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              '•Lethargy and loss of appetite.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Erratic swimming and disorientation.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Hemorrhages on the skin, fins, and eyes.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Exophthalmia (bulging eyes) and opacity of the eyes.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Skin ulcers and fin rot.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Ascites (fluid accumulation in the abdomen).',
              textAlign: TextAlign.justify,
            ),
                const SizedBox(height: 20),
            const Text(
              'Treatment:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              '•Antibiotics such as oxytetracycline and florfenicol are commonly used.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Enhanced water quality and management practices.',
              textAlign: TextAlign.justify,
            ),
            const Text(
              '•Probiotics and vaccines have shown promise in prevention.',
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
