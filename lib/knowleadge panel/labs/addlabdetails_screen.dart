

import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sgm_admin/reusable/reuse.dart';
import 'package:sgm_admin/knowleadge%20panel/labs/addlab.dart';
import 'package:sgm_admin/screens/home_screen.dart';
import 'package:sgm_admin/utils/color_utils.dart';
import 'package:flutter/material.dart';

import '../../utils/color_utils.dart';
import 'addlab.dart';

class Lab extends StatefulWidget {
  const Lab({Key? key}) : super(key: key);

  @override
  _LabState createState() => _LabState();
}

class _LabState extends State<Lab> {
  TextEditingController _labNameTextController = TextEditingController();
  TextEditingController _numberTextController = TextEditingController();
  TextEditingController _servicesTextController = TextEditingController();
  TextEditingController _addressTextController = TextEditingController();
  TextEditingController _imgUrlController = TextEditingController();
  File? file;
  late String imagePath;
  late Uint8List fileBytes;
  String fileName='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Add new Lab",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Lab Name", Icons.person_outline, false,
                        _labNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Contact", Icons.person_outline, false,
                        _numberTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Description of services provide", Icons.lock_outlined, true,
                        _servicesTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Address", Icons.phone, false,
                        _addressTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: (){
                              selectImage();
                            },
                            child: Text('Select Image'),
                          ),
                        ),
                        Expanded(
                          child: (fileName=='')? Center(child: Text('Select an Image'),) : Center(child: Text(fileName),
                        ),
                        ),
                      ],
                    ),

                    firebaseUIButton(context, "Add", () {



                      AddLab(labName: _labNameTextController.text,mobile: _numberTextController.text,services:_servicesTextController.text,address:_addressTextController.text, filePath: "", imgUrl: _imgUrlController.text, fileBytes: fileBytes).uploadImage();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));

                    },
                    ),
                  ],
                ),
              ))),
    );
  }
  Future selectImage() async {

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      fileBytes = result.files.first.bytes!;
      setState(() {
        fileName = result.files.first.name;
      });

    }

    //final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    /*if(result==null) return;
    imagePath = result.files.single.path!;
    setState(() {
      file = File(imagePath);
    });*/
  }
}