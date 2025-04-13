import 'package:FishCare/src/components/mycustomwidgets.dart';
import 'package:FishCare/src/themes/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/disease.dart';
import '../models/symptom.dart';
import '../models/treatment.dart';
import 'symptompage.dart';

class SymptomListPage extends StatelessWidget {
  const SymptomListPage({
    super.key,
    required this.symptomList,
    required this.diseaseList,
    required this.treatmentList,
  });

  final List<Symptom>? symptomList;
  final List<Disease>? diseaseList;
  final List<Treatment>? treatmentList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Symptom List'),
      body: (symptomList != null)
          ? ListView(
              children: symptomList!.map<Widget>(
                (symptom) {
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
                },
              ).toList(),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
