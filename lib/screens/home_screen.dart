import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:sgm_admin/knowleadge%20panel/labs/addlab.dart';
import 'package:sgm_admin/knowleadge%20panel/labs/addlabdetails_screen.dart';
import 'package:sgm_admin/New%20Advertisments/advertiesment_details_screen.dart';
import 'package:sgm_admin/New%20Advertisments/advertisment_screen.dart';
import 'package:sgm_admin/knowleadge%20panel/knowleadgepanel_screen.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController page = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Admin Dashboard-Smart Gem Mart"),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: page,
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.deepPurple[100],
              selectedColor: Colors.deepPurple,
              selectedTitleTextStyle: TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              // backgroundColor: Colors.amber
              // openSideMenuWidth: 200
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                ),
                Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'mohada',
                style: TextStyle(fontSize: 15),
              ),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'New Advertisments',
                onTap: () {
                  page.jumpToPage(0);
                },
                icon: Icon(Icons.image),
                // badgeContent: Text(
                //   '3',
                //   style: TextStyle(color: Colors.white),
                // ),
              ),
              SideMenuItem(
                priority: 1,
                title: 'Knowleadge Panel',
                onTap: () {
                  page.jumpToPage(1);
                },
                icon: Icon(Icons.book),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Files',
                onTap: () {
                  page.jumpToPage(2);
                },
                icon: Icon(Icons.file_copy_rounded),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Download',
                onTap: () {
                  page.jumpToPage(3);
                },
                icon: Icon(Icons.download),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Settings',
                onTap: () {
                  page.jumpToPage(4);
                },
                icon: Icon(Icons.settings),
              ),
              SideMenuItem(
                priority: 6,
                title: 'Exit',
                onTap: () async {},
                icon: Icon(Icons.exit_to_app),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                Container(
                  color: Colors.white,
                  child: Advertisment()
                ),
                Container(
                  color: Colors.white,
                  child: KnowleadgePanel()
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Page\n   3',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Page\n   4',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Page\n   5',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}