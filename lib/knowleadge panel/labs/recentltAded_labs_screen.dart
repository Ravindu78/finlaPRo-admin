import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sgm_admin/New%20Advertisments/advertiesment_details_screen.dart';
import 'package:sgm_admin/knowleadge panel/labs/lab_Details_screen.dart';
import 'package:sgm_admin/knowleadge%20panel/labs/addlabdetails_screen.dart';
import 'package:sgm_admin/knowleadge%20panel/labs/lab_Details_screen.dart';

class Labs extends StatefulWidget {
  const Labs({Key? key}) : super(key: key);

  @override
  State<Labs> createState() => _LabsState();
}

class _LabsState extends State<Labs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Lab()),
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
            child: Text("Published Labs")),
        actions: [
          new IconButton(onPressed:(){}, icon: Icon(Icons.search)
          ),

        ],
      ),
      body: Container(
        child: Center(

          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Labs').snapshots(),
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
                          MaterialPageRoute(builder: (context) => LabDetails(data['labName'], data['address'], data['number'], data['services'],data['imgUrl'])),
                        );
                      },
                      child: ListTile(
                        title: Text(data['labName']),
                        subtitle: Text(data['address']),
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
