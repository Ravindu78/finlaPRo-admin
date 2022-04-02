import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sgm_admin/reusable/reuse.dart';
import 'package:sgm_admin/utils/color_utils.dart';

import '../../../utils/color_utils.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  File? file;
  late String imagePath;
  late Uint8List fileBytes;
  String fileName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: const Text(
          "Add new Lab",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                /////======================BUTTON 1===================
                SizedBox(
                  height: 60,
                ),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          selectImage();
                        },
                        child: Text('Select Image 1'),
                      ),
                    ),
                    Expanded(
                      child: (fileName == '')
                          ? Center(
                              child: Text('Select an Image 1'),
                            )
                          : Center(
                              child: Text(fileName),
                            ),
                    ),
                    Expanded(
                      child: firebaseUIButton5(
                        context,
                        "Add",
                        () {},
                      ),
                    ),
                  ],
                ),

                /////======================BUTTON 2===================
                SizedBox(
                  height: 60,
                ),

                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          selectImage();
                        },
                        child: Text('Select Image 2'),
                      ),
                    ),
                    Expanded(
                      child: (fileName == '')
                          ? Center(
                              child: Text('Select an Image 2'),
                            )
                          : Center(
                              child: Text(fileName),
                            ),
                    ),
                    Expanded(
                      child: firebaseUIButton5(
                        context,
                        "Add",
                        () {},
                      ),
                    ),
                  ],
                ),

                /////======================BUTTON 3===================
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          selectImage();
                        },
                        child: Text('Select Image 3'),
                      ),
                    ),
                    Expanded(
                      child: (fileName == '')
                          ? Center(
                              child: Text('Select an Image 3'),
                            )
                          : Center(
                              child: Text(fileName),
                            ),
                    ),
                    Expanded(
                      child: firebaseUIButton5(
                        context,
                        "Add",
                        () {},
                      ),
                    ),
                  ],
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
