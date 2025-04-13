import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/mycustomwidgets.dart';
import '../models/symptom.dart';
import '../models/disease.dart';
import '../models/treatment.dart';
import '../services/firestore.dart';
import '../themes/sizes.dart';
import 'symptompage.dart';

class DetectedSymptomPage extends StatelessWidget {
  final List<String> labels;
  final List<Symptom>? symptomList;
  final List<Disease>? diseaseList;
  final List<Treatment>? treatmentList;
  final File selectedImg;
  const DetectedSymptomPage({
    super.key,
    required this.labels,
    required this.symptomList,
    required this.diseaseList,
    required this.treatmentList,
    required this.selectedImg,
  });

  Future<void> addData() async {
    FirestoreService firestoreService = FirestoreService();
    await firestoreService.addLog(labels, selectedImg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Detected Symptoms'),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const MyBackButton(),
          ElevatedButton.icon(
            onPressed: () {
              //Add to log function
              addData();
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            label: const Text('Add'),
            icon: const Icon(CupertinoIcons.add),
          ),
        ],
      ),
      body: (symptomList != null)
          ? Column(
              children: [
                ImageContainer(
                  child_: Image.file(
                    selectedImg,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: labels.map<Widget>((label) {
                      Symptom? symptom = symptomList!.firstWhere(
                          (symptoms) => symptoms.name == label,
                          orElse: () => defaultSymtoms);
                      return MyListTile(
                        onTap_: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SymptomPage(
                              symptom: symptom,
                              diseaseList: diseaseList,
                              treatmentList: treatmentList,
                            ),
                          ),
                        ),
                        title: symptom.name,
                        subtitle: symptom.description,
                        img: symptom.image,
                        titletTxtStyle: listTitleTxtStyle,
                        trailingIcon: const Icon(
                          CupertinoIcons.chevron_right,
                          size: 30,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
