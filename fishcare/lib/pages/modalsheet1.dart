import 'package:flutter/material.dart';

class AnalyzeModal1 extends StatelessWidget {
  const AnalyzeModal1({super.key});

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
             const SizedBox(height: 70), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/image/check.png', width: 150, height: 150,),
              ],
            ),
            const SizedBox(height: 10), 
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Healthy',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 50), // Add some space
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
