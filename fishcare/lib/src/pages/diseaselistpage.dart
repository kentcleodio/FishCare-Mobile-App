import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/mycustomwidgets.dart';
import '../models/symptom.dart';
import '../models/disease.dart';
import '../models/treatment.dart';
import '../pages/diseasepage.dart';
import '../themes/sizes.dart';

class DiseaseListPage extends StatelessWidget {
  const DiseaseListPage({
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
      appBar: const MyAppBar(title: 'Disease List'),
      body: (diseaseList != null)
          ? ListView(
              children: diseaseList!
                  .map<Widget>(
                    (disease) => MyListTile(
                      onTap_: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiseasePage(disease: disease),
                        ),
                      ),
                      title: disease.name,
                      subtitle: disease.description,
                      img: null,
                      titletTxtStyle: listTitleTxtStyle,
                      trailingIcon: const Icon(
                        CupertinoIcons.chevron_right,
                        size: 30,
                      ),
                    ),
                  )
                  .toList(),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
