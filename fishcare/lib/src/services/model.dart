import 'dart:io';
import '../components/mydialog.dart';
import '../models/disease.dart';
import '../models/symptom.dart';
import '../models/treatment.dart';
import '../pages/detectedsymptompage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image/image.dart' as img;

class ModelService {
  //Resize image
  Future<File> resizeImage(File imageFile, int width, int height) async {
    final originalImage = img.decodeImage(imageFile.readAsBytesSync());
    if (originalImage == null) {
      throw Exception("Unable to decode image.");
    }

    // Resize to 224x224
    final resizedImage =
        img.copyResize(originalImage, width: width, height: height);

    // Save the resized image to a temporary file
    final resizedFile = File('${imageFile.path}_resized.png');
    resizedFile.writeAsBytesSync(img.encodePng(resizedImage));

    return resizedFile;
  }

  // Load the model
  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/model/mobilenetv2.tflite",
      labels: "assets/model/labels.txt",
    );
  }

  //Run the model
  Future<List> runModel(File selectedImg) async {
    final result = await Tflite.runModelOnImage(
        path: selectedImg.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 3,
        threshold: 0.5,
        asynch: true);
    return result!;
  }

  // Close the model
  Future<void> close() async {
    await Tflite.close();
  }

  //Change label based on prediction
  String? label(prediction) {
    switch (prediction) {
      case 'abdomen':
        return 'Abdominal Distension';
      case 'eyes':
        return 'Exophthalmia (Pop-Eye)';
      case 'skin':
        return 'Skin Erosion';
      case 'healthy':
        return 'Healthy';
      default:
        return 'Not Valid';
    }
  }

  //Choose result page based on label
  resultPage(
    List<String> labels,
    BuildContext context,
    List<Symptom>? symptomList_,
    List<Disease>? diseaseList_,
    List<Treatment>? treatmentList_,
    File selectedImg_,
  ) {
    if (labels.contains('Abdominal Distension') ||
        labels.contains('Exophthalmia (Pop-Eye)') ||
        labels.contains('Skin Erosion')) {
      //return symptoms page
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetectedSymptomPage(
                    labels: labels,
                    symptomList: symptomList_,
                    diseaseList: diseaseList_,
                    treatmentList: treatmentList_,
                    selectedImg: selectedImg_,
                  )));
    } else if (labels.every((label) => label == 'Healthy')) {
      const bool isHealthy = true;
      //Return healthy dialog
      showDialog(
          context: context,
          builder: (context) => MyDialog(
                isHealthy: isHealthy,
                label: labels,
                selectedImg: selectedImg_,
              ));
    } else {
      const bool isHealthy = false;
      //Return not valid dialog
      showDialog(
          context: context,
          builder: (context) => MyDialog(
                isHealthy: isHealthy,
                label: labels,
                selectedImg: selectedImg_,
              ));
    }
  }
}
