import 'package:FishCare/src/components/mycustomwidgets.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: 'About'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About FishCare Mobile App",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "The FishCare mobile app, developed by a dedicated team from Davao Del Norte State College, is a revolutionary tool designed to detect and manage tilapia skin diseases in aquaculture settings. By harnessing the power of image processing and machine learning algorithms, FishCare aims to provide timely interventions and treatment strategies for fish farmers, ultimately leading to healthier fish stocks and higher yields.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              "Key Features:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "• Disease Detection: Utilizing cutting-edge technologies such as Firebase, Flutter, TensorFlow, and Dart, FishCare can accurately identify common tilapia diseases like Flavobacteriosis, motile aeromonas septicemia, and streptococcosis.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 5),
            Text(
              "• Recommendations: Based on the identified disease, the app provides valuable recommendations on disease prevention and remedies to help fish farmers effectively manage their stock.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 5),
            Text(
              "• Data Visualizations: FishCare offers insightful data visualizations of statistical results, empowering users with a deeper understanding of their aquaculture operations.",
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 10),
            Text(
              "With a comprehensive system analysis, architecture, and design in place, FishCare is not just an app - it's a complete solution for enhancing the health and productivity of tilapia farms. Join us in revolutionizing aquaculture practices and ensuring a sustainable future for fish farming with FishCare.",
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
