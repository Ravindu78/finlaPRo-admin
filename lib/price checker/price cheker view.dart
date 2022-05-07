import 'package:flutter/material.dart';
import 'package:sgm_admin/price%20checker/categories%20view.dart';

import '../reusable/reuse.dart';

class PriceChecker extends StatefulWidget {
  const PriceChecker({Key? key}) : super(key: key);

  @override
  State<PriceChecker> createState() => _PriceCheckerState();
}

class _PriceCheckerState extends State<PriceChecker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: ListView(
          children: [
            Card(
              child: ListTile(
                onTap: (){
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const PriceUpdate(),
                    ),
                  );
                },
                title: Text('UPDATE PRICE'),
                subtitle: Text(
                    'Update Current Prices of the gems'
                ),

              ),
            ),
            Card(
              child: ListTile(
                onTap: (){
                  // Navigator.push<void>(
                  //   context,
                  //   MaterialPageRoute<void>(
                  //     builder: (BuildContext context) => const Labs(),
                  //   ),
                  // );
                },
                title: Text('TEST'),
                subtitle: Text(
                    'TEST'
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: (){
                  // Navigator.push<void>(
                  //   context,
                  //   MaterialPageRoute<void>(
                  //     builder: (BuildContext context) => const Courses(),
                  //   ),
                  // );
                },
                title: Text('TEST'),
                subtitle: Text(
                    'TEST'
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
