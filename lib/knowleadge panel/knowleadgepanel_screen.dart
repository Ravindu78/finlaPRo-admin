import 'package:flutter/material.dart';
import 'package:sgm_admin/knowleadge%20panel/labs/addlabdetails_screen.dart';
import 'package:sgm_admin/knowleadge%20panel/labs/recentltAded_labs_screen.dart';

class KnowleadgePanel extends StatefulWidget {
  const KnowleadgePanel({Key? key}) : super(key: key);

  @override
  State<KnowleadgePanel> createState() => _KnowleadgePanelState();
}

class _KnowleadgePanelState extends State<KnowleadgePanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: ListView(
          children: [
            Card(
              child: ListTile(
                onTap: (){},
                title: Text('NEWS PANEL'),
                subtitle: Text(
                    'Latest News'
                ),

              ),
            ),
            Card(
              child: ListTile(
                onTap: (){
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const Labs(),
                    ),
                  );
                },
                title: Text('LABORATORIES'),
                subtitle: Text(
                    'Gem Lab Services'
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: (){},
                title: Text('COURSES'),
                subtitle: Text(
                    'Courses and Deplomas'
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

