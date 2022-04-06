import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CourseDetails extends StatefulWidget {
  String courseName;
  String institute;
  String number;
  String details;
  String imgUrl;

  CourseDetails(this.courseName,this.institute,this.number,this.details,this.imgUrl);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.deepPurple,
        title: InkWell(
            onTap: (){
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));
            },
            child: Text("Course Details")),

      ),

      body: Column(
        children: [
          Container(
            height: 200.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child:Image.network(widget.imgUrl),
              ),
              footer: Container(
                color: Colors.white54,
                child: ListTile(
                  leading:  Text(" ${widget.courseName}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: Row(
                    children:  [

                      Expanded(child: Text("${widget.institute}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),)
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),


          //===========the first buttons======//



          //===========the second buttons======//
          Row(
            children: [
              //===== the size button
              Expanded(
                child: MaterialButton(onPressed: () {
                  deleteCourse(widget.courseName);
                },
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text("Remove")
                ),
              ),
            ],
          ),

          ListTile(
            title: Text("Description"),
            subtitle: Text(
                "${widget.details}"),
          ),

          Divider(),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Varient", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("${widget.courseName}"),)
            ],
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Color", style: TextStyle(color: Colors.grey),),),

              //=======remember to creat the product brand====

              Padding(padding: EdgeInsets.all(5.0),
                child: Text("${widget.number}"),)

            ],
          ),

          //=======remember to creat the product condition===

          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Cutting Shape", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("${widget.institute}"),)

            ],
          ),
          Row(
            children: [
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Weight", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("${widget.details}"),)

            ],
          ),




        ],
      ),
    );

  }
  CollectionReference Courses = FirebaseFirestore.instance.collection('Courses');

  Future<void> deleteCourse(String CourseName) {
    return Courses
        .doc(CourseName)
        .delete()
        .then((value) => print("course Deleted"))
        .catchError((error) => print("Failed to delete Course: $error"));
  }
}
