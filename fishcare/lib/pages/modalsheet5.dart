import 'package:flutter/material.dart';

class AnalyzeModal5 extends StatelessWidget {
  const AnalyzeModal5({super.key});

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
            Row(
              children: [
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ), 
                    onPressed: (){
                      Navigator.pop(context); // Close the modal sheet
                          Navigator.pushNamed(context, '/homepage');
                    }
                ),
              ],
            ),
            const SizedBox(height: 60), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/image/wrong.png', width: 150, height: 150,),
              ],
            ),
            const SizedBox(height: 10), 
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not Valid Data',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
