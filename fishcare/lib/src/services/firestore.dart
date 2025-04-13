import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import '../models/disease.dart';
import '../models/symptom.dart';
import '../models/treatment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference<Map<String, dynamic>> symptoms =
      FirebaseFirestore.instance.collection('Symptoms');
  final CollectionReference diseases =
      FirebaseFirestore.instance.collection('Disease');
  final CollectionReference treatments =
      FirebaseFirestore.instance.collection('Treatment');
  final CollectionReference logs = FirebaseFirestore.instance.collection('Log');

  Future<String> uploadImageAndGetUrl(File selectedImage) async {
    try {
      String fileName = DateTime.now().microsecondsSinceEpoch.toString();

      final storageRef =
          FirebaseStorage.instance.ref().child('images/log images/$fileName');

      UploadTask uploadImage = storageRef.putFile(selectedImage);

      TaskSnapshot snapshot = await uploadImage;

      String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (e) {
      debugPrint('Error uploading image: $e');
      return '';
    }
  }

//Add log to the database with predefined image URL
  Future<void> addBulkLog(
    String result,
    String symptom,
    DateTime timestamp,
    String imageUrl,
  ) async {
    try {
      await logs.add({
        'image': imageUrl,
        'symptoms': symptom,
        'result': result,
        'timestamp': Timestamp.fromDate(timestamp),
      });
      debugPrint('Log added successfully.');
    } catch (e) {
      debugPrint('Error adding log: $e');
    }
  }

  //Add result data to database
  Future<void> addLog(List<String> label, File selectedImage) async {
    // Upload image and get its URL
    String imageUrl = await uploadImageAndGetUrl(selectedImage);
    try {
      if (imageUrl.isNotEmpty) {
        await logs.add({
          'image': imageUrl,
          'symptoms': (label.every((label) => label == 'Healthy'))
              ? 'No Symptoms'
              : label,
          'result': (label.every((label) => label == 'Healthy'))
              ? 'Healthy'
              : 'Not Healthy',
          'timestamp': Timestamp.now(),
        });
        debugPrint('Log added successfully.');
      } else {
        debugPrint('Failed to upload image.');
      }
    } catch (e) {
      debugPrint('Error uploading image: $e');
      return;
    }
  }

  //Fetch symptoms data
  Future<List<Symptom>> getSymptoms() async {
    List<Symptom> symptomList = [];

    QuerySnapshot querySnapshot = await symptoms.get();

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      symptomList.add(Symptom.fromMap(data));
    }
    return symptomList;
  }

  //Fetch diseases data
  Future<List<Disease>> getDiseases() async {
    List<Disease> diseaseList = [];

    QuerySnapshot querySnapshot = await diseases.get();

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      diseaseList.add(Disease.fromMap(data));
    }
    return diseaseList;
  }

  //Fetch treatments data
  Future<List<Treatment>> getTreatments() async {
    List<Treatment> treatmentList = [];

    QuerySnapshot querySnapshot = await treatments.get();

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      treatmentList.add(Treatment.fromMap(data));
    }
    return treatmentList;
  }
}
