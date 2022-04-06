

import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:sgm_admin/knowleadge%20panel/courses/add_course.dart';
import 'package:sgm_admin/reusable/reuse.dart';

import 'package:sgm_admin/screens/home_screen.dart';
import 'package:sgm_admin/utils/color_utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/color_utils.dart';


class Course extends StatefulWidget {
  const Course({Key? key}) : super(key: key);

  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
  TextEditingController _courseNameTextController = TextEditingController();
  TextEditingController _numberTextController = TextEditingController();
  TextEditingController _detailsTextController = TextEditingController();
  TextEditingController _instituteTextController = TextEditingController();
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
          "Add new Course",
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
                    reusableTextField("Enter Course Name", Icons.person_outline, false,
                        _courseNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Contact", Icons.person_outline, false,
                        _numberTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Description of Course provide", Icons.lock_outlined, true,
                        _detailsTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Institute", Icons.phone, false,
                        _instituteTextController),
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



                      AddCourse(courseName: _courseNameTextController.text,mobile: _numberTextController.text,details:_detailsTextController.text,institute:_instituteTextController.text, filePath: "", imgUrl: _imgUrlController.text, fileBytes: fileBytes).uploadImage();
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

  }
}