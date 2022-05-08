
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../reusable/reuse.dart';

class PriceUpdate extends StatefulWidget {
  const PriceUpdate({Key? key}) : super(key: key);

  @override
  _PriceUpdateState createState() => _PriceUpdateState();
}

class _PriceUpdateState extends State<PriceUpdate> {
  final db = FirebaseFirestore.instance;
  TextEditingController _varientNameController = TextEditingController();
  TextEditingController _varientColorController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _weightController2 = TextEditingController();

  void updatePrice01 (double price01) {
    final data = {"price01":price01 };
    db.collection("PriceChecker").doc(_varientNameController.text).set({"time":DateTime.now()}, SetOptions(merge: true));
    db.collection("PriceChecker").doc(_varientNameController.text).collection("colors").doc(_varientColorController.text).set(data, SetOptions(merge: true));
  }

  void updatePrice02 (double price02) {
    final data = {"price02":price02 };
    db.collection("PriceChecker").doc(_varientNameController.text).set({"time":DateTime.now()}, SetOptions(merge: true));
    db.collection("PriceChecker").doc(_varientNameController.text).collection("colors").doc(_varientColorController.text).set(data, SetOptions(merge: true));
  }


  PopupMenuButton reusablePopupmenu(String value1,String value2,String value3,String value4,String value5,String value6,String value7 )
  {
    return  PopupMenuButton(
      onSelected: (value) { setState(() { _varientColorController.text = value.toString(); }); },
      icon: Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          value: value1,
          child: ListTile(

            title: Text(value1),
          ),
        ),
        PopupMenuItem(
          value: value2,
          child: ListTile(

            title: Text(value2),
          ),
        ),
        PopupMenuItem(
          value: value3,
          child: ListTile(

            title: Text(value3),
          ),
        ),
        PopupMenuItem(
          value: value4,
          child: ListTile(

            title: Text(value4),
          ),
        ),
        PopupMenuItem(
          value: value5,
          child: ListTile(

            title: Text(value5),
          ),
        ),
        PopupMenuItem(
          value: value6,
          child: ListTile(

            title: Text(value6),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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


          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          //=========ADDING ADVERTISMENT FIELDS TI FILL=========

          child: SingleChildScrollView(


              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 65, 20, 0),

                child: Form(

                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),


                      Row(
                        children: [
                          Expanded(child: reusableTextField5("Choose The Varient", Icons.checklist_outlined, false, false, _varientNameController,'Choose The Varient'),),
                          PopupMenuButton(
                            onSelected: (value) { setState(() { _varientNameController.text = value.toString();

                            }); },
                            icon: Icon(Icons.more_vert),
                            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              const PopupMenuItem(
                                value:'Blue Sapphire',
                                child: ListTile(
                                  title: Text('Blue Sapphire'),

                                ),
                              ),
                              const PopupMenuItem(
                                value:'Ruby',
                                child: ListTile(
                                  title: Text('Ruby'),
                                ),
                              ),
                              const PopupMenuItem(
                                value:'Yellow Sapphire',
                                child: ListTile(
                                  title: Text('Yellow Sapphire'),
                                ),
                              ),
                              const PopupMenuItem(
                                value:'Emerald',
                                child: ListTile(
                                  title: Text('Emerald'),
                                ),
                              ),
                              const PopupMenuItem(
                                value:'Padmaraga',
                                child: ListTile(
                                  title: Text('Padmaraga'),
                                ),
                              ),
                              const PopupMenuItem(
                                value:'Garnet',
                                child: ListTile(
                                  title: Text('Garnet'),
                                ),
                              ),
                              const PopupMenuItem(
                                value:'Cats Eye',
                                child: ListTile(
                                  title: Text('Cats Eye'),
                                ),
                              ),
                              const PopupMenuItem(
                                value:'Star Sapphire',
                                child: ListTile(
                                  title: Text('Star Sapphire'),
                                ),
                              ),
                            ],
                          ),

                        ],

                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: reusableTextField5("Choose The Color", Icons.checklist_outlined, false, false, _varientColorController, 'Choose the color'),),
                          if( _varientNameController.text=='Blue Sapphire')
                            reusablePopupmenu('Velvet','Pastal', 'Peacock','Royal','Indigo','Twilight','Other')
                          else if( _varientNameController.text=='Ruby')
                            reusablePopupmenu('Pastel','Hot Pink', 'Fuchsia','Pigeons Blood','Royal','Other','Other')
                          else if( _varientNameController.text=='Yellow Sapphire')
                              reusablePopupmenu('Fancy Vivid','Fancy Deep', 'Fancy Intense','Fancy Dark','Fancy','Fancy Light','Light')
                            else if( _varientNameController.text=='Emerald')
                                reusablePopupmenu('Very Dark','Dark', 'Medium Dark','Medium','Medium Light','Light','Other')
                              else if( _varientNameController.text=='Padmaraga')
                                  reusablePopupmenu('Light','Medium', 'Dark','....','....','....','....')
                                else if( _varientNameController.text=='Garnet')
                                    reusablePopupmenu('Rose','Topaz', 'Green','Orange','White','Amethyst','Other')
                                  else if( _varientNameController.text=='Cats Eye')
                                      reusablePopupmenu('Clear','Blue', 'Green','Orange','Red','Black','Other')
                                    else if( _varientNameController.text=='Star Sapphire')
                                        reusablePopupmenu('Blue','Ruby', 'Emerald','Yellow','Pink','Orange','Other')
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: reusableTextField6(
                              " weight(ct>10)", Icons.monitor_weight, false,true, _weightController,'Please Enter the weight',r'[+-]?([0-9]*[.])?[0-9]+','Enter valid Weight'),),
                          Expanded(child: priceCheckerUiButton(context, "Update Price", (){
                            updatePrice01(double.parse(_weightController.text));
                          })),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(child: reusableTextField6(
                              " weight(ct<10)", Icons.monitor_weight, false,true, _weightController2,'Please Enter the weight',r'[+-]?([0-9]*[.])?[0-9]+','Enter valid Weight'),),
                          Expanded(child: priceCheckerUiButton(context, "Update Price", (){
                            updatePrice02(double.parse(_weightController2.text));
                          })),
                        ],
                      ),

                    ],

                  ),


                ),

              ),

          ),

      ),

    );

  }


}