

import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

class AddCourse {
  String courseName;
  String mobile;
  String details;
  String institute;
  String filePath;
  String imgUrl;
  Uint8List fileBytes;


  AddCourse({required this.courseName,required this.mobile,required this.details,required this.institute,required this.filePath,required this.imgUrl,required this.fileBytes});

  CollectionReference Courses = FirebaseFirestore.instance.collection('Courses');




  Future<void> addCourse(String url) {
    // Call the user's CollectionReference to add a new user
    return Courses
        .doc(courseName)
        .set({
      'CourseName': courseName,
      'number': mobile,
      'Details':details,
      'Institute':institute,
      'imgUrl':url,
    })
        .then((value) => print("course Added"))
        .catchError((error) => print("Failed to add course: $error"));
  }

  Future<void> uploadImage() async{
    Timestamp time = Timestamp.now();
    String filename = '$mobile-$time';
    //File file = File(filePath);
    try{
      final ref = await FirebaseStorage.instance.ref('uploads/$filename').putData(fileBytes);
      //final ref = await storage.FirebaseStorage.instance.ref('courses/$filename').putFile(file);
      final url = await ref.ref.getDownloadURL();
      print(url);
      addCourse(url);
    } on FirebaseException catch (e) {
      print('image upload error');
    }
  }




}