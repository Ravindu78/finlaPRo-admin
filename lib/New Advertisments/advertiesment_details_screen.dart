import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdvertisementDetailsScreen extends StatefulWidget {
  String docid;
  String imgurl;
  String price;
  String descrip;
  String varient;
  String color;
  String shape;
  String weight;
  String phoneNo;
  String email;

  AdvertisementDetailsScreen(
    this.docid,
    this.imgurl,
    this.price,
    this.descrip,
    this.varient,
    this.color,
    this.shape,
    this.weight,
    this.phoneNo,
    this.email,
  );

  @override
  State<AdvertisementDetailsScreen> createState() =>
      _AdvertisementDetailsScreenState();
}

class _AdvertisementDetailsScreenState
    extends State<AdvertisementDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.deepPurple,
        title: InkWell(
            onTap: () {
              //  Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));
            },
            child: Text("Advertisement Details")),
        actions: [
          new IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 200.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.network(widget.imgurl),
              ),
              footer: Container(
                color: Colors.white54,
                child: ListTile(
                  leading: Text(
                    " ${widget.varient}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${widget.price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      )),
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
                child: MaterialButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('Advertisment')
                          .doc(widget.docid)
                          .update({'publish': 'true'})
                          .then((value) => print("User Updated"))
                          .whenComplete(() => Navigator.pop(context))
                          .catchError((error) =>
                              print("Failed to update user: $error"));
                    },
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text("Publish")),
              ),
              Expanded(
                child: MaterialButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('Advertisment')
                          .doc(widget.docid)
                          .delete()
                          .then((value) => print("Advertisment Deleted"))
                          .catchError((error) =>
                              print("Failed to delete Advertisment: $error"));
                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text("Remove")),
              ),
            ],
          ),

          ListTile(
            title: Text("Description"),
            subtitle: Text("${widget.descrip}"),
          ),

          Divider(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Varient",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("${widget.varient}"),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Color",
                  style: TextStyle(color: Colors.grey),
                ),
              ),

              //=======remember to creat the product brand====

              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("${widget.color}"),
              )
            ],
          ),

          //=======remember to creat the product condition===

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Cutting Shape",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("${widget.shape}"),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Weight",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("${widget.weight}"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
