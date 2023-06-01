import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages.dart/ContactUs.dart';
import 'package:flutter_application_1/pages.dart/aboutUs.dart';

import 'package:flutter_application_1/pages.dart/firstchild.dart';

import '../Parent_device.dart/navigation.dart/settings.dart';

// ignore: camel_case_types
class profilPage extends StatefulWidget {
  const profilPage({Key? key}) : super(key: key);

  @override
  State<profilPage> createState() => _profilPageState();
}

// ignore: camel_case_types
class _profilPageState extends State<profilPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 800;

    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          elevation: 0,
          titleSpacing: 0,
          leading: isLargeScreen
              ? null
              : IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(child: _ProfileIcon()),
            )
          ],
        ),
        drawer: isLargeScreen ? null : _drawer(),
        body: const Center(),
      ),
    );
  }

  Widget _drawer() => Drawer(
        child: ListView(
          children: _menuItems
              .map((item) => ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        if (item == 'About') {
                          return AboutUsPage();
                        } else if (item == 'Contact') {
                          return ContactUsPage();
                        } else if (item == 'Settings') {
                          return SettingsPage();
                        } else if (item == 'Sign Out') {
                          FirebaseAuth.instance.signOut();
                        }
                        throw Exception('Unknown item: $item');
                      }));
                    },
                    title: Text(item),
                  ))
              .toList(),
        ),
      );

  // ignore: unused_element
  Widget _navBarItems() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _menuItems
            .map(
              (item) => InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    if (item == 'About') {
                      return firstchild(
                        uid: '',
                        childId: '',
                      );
                    } else if (item == 'Settings') {
                      return SettingsPage();
                    }
                    throw Exception('Unknown item: $item');
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 16),
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
            .toList(),
      );

  final List<String> _menuItems = <String>[
    'About',
    'Contact',
    'Settings',
    'Sign Out',
  ];
}

class _ProfileIcon extends StatefulWidget {
  const _ProfileIcon({Key? key}) : super(key: key);

  @override
  State<_ProfileIcon> createState() => _ProfileIconState();
}

class _ProfileIconState extends State<_ProfileIcon> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Perform logout action here
      },
      child: const Icon(Icons.logout),
    );
  }
}
