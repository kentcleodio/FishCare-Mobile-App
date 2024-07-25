// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'modalsheet1.dart';
import 'modalsheet2.dart';
import 'modalsheet3.dart';
import 'modalsheet4.dart';
import 'modalsheet5.dart';

import 'dart:developer' as devtools;


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String label = '';
  double confidence = 0.0;


  Future<void> _tfLteInit() async {
    String? res = await Tflite.loadModel(
        model: "assets/model/my_model.tflite",
        labels: "assets/model/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset:
            true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate:
            false // defaults to false, set to true to use GPU delegate
        );
  }

  Future _pickImageFromCamera() async{
  var returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);

  if (returnedImage == null) return;
  
    setState((){
      _selectedImage = File(returnedImage.path);
      _imageName = _selectedImage!.path.split('/').last;
    });

        var recognitions = await Tflite.runModelOnImage(
      path: returnedImage.path,   // required
      imageMean: 0.0,   // defaults to 117.0
      imageStd: 255.0,  // defaults to 1.0
      numResults: 2,    // defaults to 5
      threshold: 0.2,   // defaults to 0.1
      asynch: true      // defaults to true
    );

     if (recognitions == null) {
      devtools.log("recognitions is Null");
      return;
    }
      devtools.log(recognitions.toString());
    setState(() {
      confidence = (recognitions[0]['confidence'] * 100);
      label = recognitions[0]['label'].toString();
    });
  
  }

  Future _pickImageFromGallery() async{
  var returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (returnedImage == null) return;

    setState((){
      _selectedImage = File(returnedImage.path);
      _imageName = _selectedImage!.path.split('/').last;
    });

    var recognitions = await Tflite.runModelOnImage(
      path: returnedImage.path,   // required
      imageMean: 0.0,   // defaults to 117.0
      imageStd: 255.0,  // defaults to 1.0
      numResults: 2,    // defaults to 5
      threshold: 0.2,   // defaults to 0.1
      asynch: true      // defaults to true
    );

     if (recognitions == null) {
      devtools.log("recognitions is Null");
      return;
    }
      devtools.log(recognitions.toString());
    setState(() {
      confidence = (recognitions[0]['confidence'] * 100);
      label = recognitions[0]['label'].toString();
    });

  }


    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Tflite.close();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tfLteInit();
  }

  void displayModal() {
    switch (label) {
      case '0 healthy':
        showModalBottomSheet(
          context: context,
          builder: (context) => FutureBuilder(
            future: Future.delayed(Duration(seconds: 2)), // simulate a delay
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return const AnalyzeModal1();
              }
            },
          ),
        );
        break;
      case '1 mas':
        showModalBottomSheet(
          context: context,
          builder: (context) => FutureBuilder(
            future: Future.delayed(Duration(seconds: 2)), // simulate a delay
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return const AnalyzeModal2();
              }
            },
          ),
        );
        break;
      case '2 str':
        showModalBottomSheet(
          context: context,
          builder: (context) => FutureBuilder(
            future: Future.delayed(Duration(seconds: 2)), // simulate a delay
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return const AnalyzeModal3();
              }
            },
          ),
        );
        break;
      case '3 tlv':
        showModalBottomSheet(
          context: context,
          builder: (context) => FutureBuilder(
            future: Future.delayed(Duration(seconds: 2)), // simulate a delay
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return const AnalyzeModal4();
              }
            },
          ),
        );
        break;
        case '4 notval':
        showModalBottomSheet(
          context: context,
          builder: (context) => FutureBuilder(
            future: Future.delayed(Duration(seconds: 2)), // simulate a delay
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return const AnalyzeModal5();
              }
            },
          ),
        );
        break;
      default:
        // Handle unexpected labels (optional)
        devtools.log("Unrecognized label: $label");
    }
  }


  
  File ? _selectedImage;
  String? _imageName;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(child: Text("FishCare")),
          backgroundColor: Colors.blue[300],
          foregroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(onPressed: () {
              Navigator.pushNamed(context, '/homepage');
            }, icon: Image.asset('assets/image/Fishlogo.png', width: 30, height: 30,))
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.blue[50],
          child: Column(
            children: [
              DrawerHeader(
                child: Image.asset('assets/image/FishCarelogo.png', width: 200, height: 200,)
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("    H O M E"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/homepage');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text("    A B O U T"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/aboutpage');
                  },
                ),
            ],
          ),
        ),
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  _selectedImage != null ?
                    Image.file(_selectedImage!, width: 200, height: 200,)
                    : Text("Please select an image"),
                    SizedBox(height: 10,),
                    if (_imageName != null)
                    SizedBox(
                      width: 200,
                      child: Text('$_imageName', textAlign: TextAlign.center,)
                      ),
                ]   
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _pickImageFromCamera(),
                          child: CircleAvatar(
                            backgroundColor: Colors.blue[200],
                            radius: 50 ,
                            child: Icon(Icons.camera_alt_rounded, size: 75, color: Colors.white,),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Take Photo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                  SizedBox(width: 80),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _pickImageFromGallery(),
                          child: CircleAvatar(
                            backgroundColor: Colors.blue[200],
                            radius: 50 ,
                            child: Icon(Icons.photo_library_outlined, size: 75, color: Colors.white,),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text('Upload Photo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ],
                    ),
                ],
              ),
              SizedBox(height: 70,),
              ElevatedButton(
                onPressed: () {
                  displayModal();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[300], // background color
                  foregroundColor: Colors.white, 
                  ),
                child: Text('Analyze', style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        ),
      );
  }
}