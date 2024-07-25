import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        backgroundColor: Colors.blue[300],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/homepage');
            },
            icon: Image.asset('assets/image/Fishlogo.png', width: 30, height: 30),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to left
          children: [
            const Text(
              "About FishCare Mobile App",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10), // Add some space
            const Text(
              "The FishCare mobile app, developed by a dedicated team from Davao Del Norte State College, is a revolutionary tool designed to detect and manage tilapia skin diseases in aquaculture settings. By harnessing the power of image processing and machine learning algorithms, FishCare aims to provide timely interventions and treatment strategies for fish farmers, ultimately leading to healthier fish stocks and higher yields.",
              textAlign: TextAlign.justify, // Justify text for better readability
            ),
            const SizedBox(height: 10),
            const Text(
              "Key Features:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "• Disease Detection: Utilizing cutting-edge technologies such as Firebase, Flutter, TensorFlow, and Dart, FishCare can accurately identify common tilapia diseases like Flavobacteriosis, motile aeromonas septicemia, and streptococcosis.",
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 5),
            const Text(
              "• Recommendations: Based on the identified disease, the app provides valuable recommendations on disease prevention and remedies to help fish farmers effectively manage their stock.",
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 5),
            const Text(
              "• Data Visualizations: FishCare offers insightful data visualizations of statistical results, empowering users with a deeper understanding of their aquaculture operations.",
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            const Text(
              "With a comprehensive system analysis, architecture, and design in place, FishCare is not just an app - it's a complete solution for enhancing the health and productivity of tilapia farms. Join us in revolutionizing aquaculture practices and ensuring a sustainable future for fish farming with FishCare.",
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
