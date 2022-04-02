

import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

class AddLab {
  String labName;
  String mobile;
  String services;
  String address;
  String filePath;
  String imgUrl;
  Uint8List fileBytes;


  AddLab({required this.labName,required this.mobile,required this.services,required this.address,required this.filePath,required this.imgUrl,required this.fileBytes});

  CollectionReference Labs = FirebaseFirestore.instance.collection('Labs');




  Future<void> addLab(String url) {
    // Call the user's CollectionReference to add a new user
    return Labs
        .doc(labName)
        .set({
      'labName': labName,
      'number': mobile,
      'services':services,
      'address':address,
      'imgUrl':url,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> uploadImage() async{
    Timestamp time = Timestamp.now();
    String filename = '$mobile-$time';
    //File file = File(filePath);
    try{
      final ref = await FirebaseStorage.instance.ref('uploads/$filename').putData(fileBytes);
      //final ref = await storage.FirebaseStorage.instance.ref('advertisments/$filename').putFile(file);
      final url = await ref.ref.getDownloadURL();
      print(url);
      addLab(url);
    } on FirebaseException catch (e) {
      print('image upload error');
    }
  }




}