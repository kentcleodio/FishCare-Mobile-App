import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/symptom.dart';
import '../models/disease.dart';
import '../models/treatment.dart';
import '../services/firestore.dart';
import '../services/model.dart';
import '../themes/colors.dart';
import '../components/mycustomwidgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ModelService modelService = ModelService();
  final FirestoreService firestoreService = FirestoreService();
  late List<Symptom>? symptomList_;
  late List<Disease>? diseaseList_;
  late List<Treatment>? treatmentList_;
  File? selectedImg;
  List predictions = [];
  List<String> labels = [];
  bool isLoading = false;
  bool isLoading1 = false;

  @override
  void initState() {
    super.initState();
    modelService.loadModel();
    fetchData();
    symptomList_ = null;
    diseaseList_ = null;
    treatmentList_ = null;
  }

  Future<void> fetchData() async {
    symptomList_ = await firestoreService.getSymptoms();
    diseaseList_ = await firestoreService.getDiseases();
    treatmentList_ = await firestoreService.getTreatments();
    setState(() {});
  }

  //Pick image from camera or gallery
  pickImage(ImageSource source_) async {
    setState(() {
      isLoading = true;
    });
    var img = await ImagePicker().pickImage(source: source_);
    if (img != null) {
      var resizedImg = await modelService.resizeImage(File(img.path), 224, 224);
      setState(() {
        selectedImg = resizedImg;
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
    return;
  }

  @override
  void dispose() {
    super.dispose();
    modelService.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'FishCare'),
      drawer: MyDrawer(
        symptomList_: symptomList_,
        diseaseList_: diseaseList_,
        treatmentList_: treatmentList_,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (selectedImg != null)
                ? ImageHeader(
                    selectedImg: selectedImg!,
                    onTap_: () {
                      setState(() {
                        selectedImg = null;
                      });
                    },
                  )
                : (isLoading)
                    ? const Column(
                        children: [
                          SizedBox(height: 100),
                          CircularProgressIndicator(),
                          SizedBox(height: 115),
                        ],
                      )
                    : const Column(
                        children: [
                          SizedBox(height: 100),
                          Text('Please select an image.'),
                          SizedBox(height: 115),
                        ],
                      ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PickImageButton(
                  onTaP_: () => pickImage(ImageSource.camera),
                  icon: Icons.camera_alt_rounded,
                  label: 'Take Photo',
                ),
                PickImageButton(
                  onTaP_: () => pickImage(ImageSource.gallery),
                  icon: Icons.photo_library_outlined,
                  label: 'Upload Photo',
                ),
              ],
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                if (selectedImg != null) {
                  setState(() {
                    isLoading1 = true;
                  });
                  //run model on selected image
                  var result = await modelService.runModel(selectedImg!);

                  //put predictions to label
                  setState(() {
                    predictions = result;
                    labels = predictions
                        .map((pred) => modelService.label(pred['label']) ?? '')
                        .toList();

                    print(result);
                  });

                  //View result base on predicted labels
                  modelService.resultPage(
                    labels,
                    context,
                    symptomList_,
                    diseaseList_,
                    treatmentList_,
                    selectedImg!,
                  );

                  setState(() {
                    selectedImg = null;
                    isLoading1 = false;
                  });
                }
              },
              child: (isLoading1)
                  ? const CircularProgressIndicator(
                      color: backgroundColor,
                    )
                  : const Text('Analyze'),
            )
          ],
        ),
      ),
    );
  }
}
