import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



import 'addCourse_screen.dart';
import 'coursesDetails_screens.dart';
import 'dart:io';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Course()),
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      appBar:AppBar(
        elevation: 0.2,
        backgroundColor: Colors.deepPurple,
        title: InkWell(
            onTap: (){
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));
            },
            child: Text("Published Courses")),
        actions: [
          new IconButton(onPressed:(){}, icon: Icon(Icons.search)
          ),

        ],
      ),
      body: Container(
        child: Center(

          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Courses').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  return Card(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CourseDetails(data['CourseName'], data['Institute'], data['number'], data['Details'],data['imgUrl'])),
                        );
                      },
                      child: ListTile(
                        title: Text(data['CourseName']),
                        subtitle: Text(data['Institute']),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
