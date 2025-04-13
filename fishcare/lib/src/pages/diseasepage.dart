import 'package:FishCare/src/themes/colors.dart';
import 'package:FishCare/src/themes/sizes.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../components/mycustomwidgets.dart';
import '../models/disease.dart';

class DiseasePage extends StatefulWidget {
  final Disease disease;
  const DiseasePage({super.key, required this.disease});

  @override
  State<DiseasePage> createState() => _DiseasepageState();
}

class _DiseasepageState extends State<DiseasePage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: ' '),
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
              child_: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  widget.disease.name,
                  style: titleTxtStyle,
                  textAlign: TextAlign.center,
                ),
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
                    description: widget.disease.description,
                    isExpanded_: isExpanded,
                  ),
                  divider,
                  const Text(
                    'Symptoms',
                    style: secTitleTxtStyle,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.disease.symptom
                        .mapIndexed(
                          (index, symptomName) => MyListTile(
                            leadingIcon: Text(
                              '${index + 1}',
                              style: buttonTxtStyle,
                            ),
                            title: symptomName,
                            color_: secondaryDangerColor,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
