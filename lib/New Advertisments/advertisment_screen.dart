import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sgm_admin/New%20Advertisments/advertiesment_details_screen.dart';

class Advertisment extends StatefulWidget {
  const Advertisment({Key? key}) : super(key: key);

  @override
  State<Advertisment> createState() => _AdvertismentState();
}

class _AdvertismentState extends State<Advertisment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Advertisment').snapshots(),
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
                          MaterialPageRoute(builder: (context) => AdvertisementDetailsScreen(document.id,data['imgUrl'], data['price'], data['description'], data['varient'], data['color'], data['shape'], data['weight'], data['phone'], data['email'])),
                        );
                      },
                      child: ListTile(
                        title: Text(data['email']),
                        subtitle: Text(data['varient']),
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
