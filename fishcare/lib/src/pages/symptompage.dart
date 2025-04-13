import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import '../components/mycustomwidgets.dart';
import '../models/disease.dart';
import '../models/symptom.dart';
import '../models/treatment.dart';
import '../themes/colors.dart';
import '../themes/sizes.dart';
import 'diseasepage.dart';

class SymptomPage extends StatefulWidget {
  final Symptom symptom;
  final List<Disease>? diseaseList;
  final List<Treatment>? treatmentList;
  const SymptomPage({
    super.key,
    required this.symptom,
    required this.diseaseList,
    required this.treatmentList,
  });

  @override
  State<SymptomPage> createState() => _SymptomPageState();
}

class _SymptomPageState extends State<SymptomPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Symptom Details'),
      floatingActionButton: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyBackButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SymptomImageContainer(
              child_: Column(
                children: [
                  ImageContainer(
                    child_: Image.network(
                      widget.symptom.image,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  columnSpacer,
                  Text(
                    widget.symptom.name,
                    style: titleTxtStyle,
                    textAlign: TextAlign.center,
                  ),
                  columnSpacer,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  DescriptionHeader(
                    onPressed_: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    description: widget.symptom.description,
                    isExpanded_: isExpanded,
                  ),
                  Column(
                    children: [
                      divider,
                      const Text(
                        'Possible Disease',
                        style: secTitleTxtStyle,
                      ),
                      (widget.diseaseList != null)
                          ? Column(
                              children: widget.symptom.possibleDisease
                                  .map<Widget>((posDisease) {
                                Disease disease =
                                    widget.diseaseList!.firstWhere(
                                  (diseases) => diseases.name == posDisease,
                                  orElse: () => defaultDisease,
                                );
                                return MyListTile(
                                  onTap_: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DiseasePage(disease: disease),
                                    ),
                                  ),
                                  title: disease.name,
                                  trailingIcon: const Icon(
                                    CupertinoIcons.chevron_right,
                                    size: 20,
                                  ),
                                  color_: secondaryDangerColor,
                                );
                              }).toList(),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ],
                  ),
                  Column(
                    children: [
                      divider,
                      const Text(
                        'Cause',
                        style: secTitleTxtStyle,
                      ),
                      Column(
                        children: widget.symptom.cause
                            .map<Widget>(
                              (symptom) => MyListTile(
                                title: symptom,
                                color_: accentColor,
                                leadingIcon: const Icon(CupertinoIcons.capsule),
                              ),
                            )
                            .toList(),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      divider,
                      const Text(
                        'Treatment',
                        style: secTitleTxtStyle,
                      ),
                      (widget.treatmentList != null)
                          ? Column(
                              children: widget.symptom.treatment
                                  .mapIndexed((index, treatment_) {
                                Treatment treatment =
                                    widget.treatmentList!.firstWhere(
                                  (treatments) => treatments.name == treatment_,
                                  orElse: () => defaultTreatment,
                                );
                                return MyListTile(
                                  leadingIcon: Text(
                                    '${index + 1}',
                                    style: secTitleTxtStyle,
                                  ),
                                  title: treatment.name,
                                  subtitle: treatment.description,
                                  subtitletTxtStyle: const TextStyle(),
                                  color_: secondaryColor,
                                );
                              }).toList(),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60)
          ],
        ),
      ),
    );
  }
}
