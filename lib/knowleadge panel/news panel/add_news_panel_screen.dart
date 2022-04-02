import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  late Uint8List image1;
  late Uint8List image2;
  late Uint8List image3;
  bool image1set = false;
  bool image2set = false;
  bool image3set = false;
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
                          selectImage(imageNo: 1);
                        },
                        child: Text('Select Image 1'),
                      ),
                    ),
                    Expanded(
                      child: (!image1set)
                          ? Center(
                              child: Text('Select an Image 1'),
                            )
                          : Center(
                              child: Image.memory(image1),
                            ),
                    ),
                    Expanded(
                      child: firebaseUIButton5(
                        context,
                        "Add",
                        () {
                          uploadImage(imageNo: 1);
                        },
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
                          selectImage(imageNo: 2);
                        },
                        child: Text('Select Image 2'),
                      ),
                    ),
                    Expanded(
                      child: (!image2set)
                          ? Center(
                              child: Text('Select an Image 2'),
                            )
                          : Center(
                              child: Image.memory(image2),
                            ),
                    ),
                    Expanded(
                      child: firebaseUIButton5(
                        context,
                        "Add",
                        () {
                          uploadImage(imageNo: 2);
                        },
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
                          selectImage(imageNo: 3);
                        },
                        child: Text('Select Image 3'),
                      ),
                    ),
                    Expanded(
                      child: (!image3set)
                          ? Center(
                              child: Text('Select an Image 3'),
                            )
                          : Center(
                              child: Image.memory(image3),
                            ),
                    ),
                    Expanded(
                      child: firebaseUIButton5(
                        context,
                        "Add",
                        () {
                          uploadImage(imageNo: 3);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ))),
    );
  }

  Future selectImage({required int imageNo}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if(imageNo == 1){
      if (result != null) {
        image1 = result.files.first.bytes!;
        setState(() {
          image1set = true;
        });
      }
    }else if (imageNo == 2){
      if (result != null) {
        image2 = result.files.first.bytes!;
        setState(() {
          image2set = true;
        });
      }
    }else{
      if (result != null) {
        image3 = result.files.first.bytes!;
        setState(() {
          image3set = true;
        });
      }
    }
  }

  Future<void> uploadImage({required int imageNo}) async{

    Timestamp time = Timestamp.now();
    String filename = '$time';

    if(imageNo == 1){
      try{
        final ref = await FirebaseStorage.instance.ref('newspanel/$filename').putData(image1);
        final url = await ref.ref.getDownloadURL();
        print(url);
        return FirebaseFirestore.instance.collection("newspanel").doc('image1').set({
          'imgUrl':url,
        }).then((value) => print("Image Added")).catchError((error) => print("Failed to add image: $error"));
      } on FirebaseException catch (e) {
        print('image upload error');
      }
    }else if (imageNo == 2){
      try{
        final ref = await FirebaseStorage.instance.ref('newspanel/$filename').putData(image2);
        final url = await ref.ref.getDownloadURL();
        print(url);
        return FirebaseFirestore.instance.collection("newspanel").doc('image2').set({
          'imgUrl':url,
        }).then((value) => print("Image Added")).catchError((error) => print("Failed to add image: $error"));
      } on FirebaseException catch (e) {
        print('image upload error');
      }
    }else{
      try{
        final ref = await FirebaseStorage.instance.ref('newspanel/$filename').putData(image3);
        final url = await ref.ref.getDownloadURL();
        print(url);
        return FirebaseFirestore.instance.collection("newspanel").doc('image3').set({
          'imgUrl':url,
        }).then((value) => print("Image Added")).catchError((error) => print("Failed to add image: $error"));
      } on FirebaseException catch (e) {
        print('image upload error');
      }
    }



  }

}
