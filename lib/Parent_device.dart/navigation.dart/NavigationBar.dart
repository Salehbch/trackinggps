import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/children_page.dart';
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/PlaceList.dart';
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/places_page.dart';
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/settings.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int index = 0;

  final Screens = [
    PlacesPage('places_page'),
    PlaceListPage("Add places"),
    ChildrenPage('title'),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    //  WillPopScope(
    //     onWillPop: () async {

    //       return false;
    //     },
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Colors.indigo,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: const Duration(seconds: 2),
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(
                icon: Icon(
                  Icons.location_pin,
                  size: 30,
                ),
                selectedIcon: Icon(Icons.location_pin),
                label: "maps"),
            NavigationDestination(
                icon: Icon(
                  Icons.map,
                  size: 30,
                ),
                selectedIcon: Icon(Icons.map),
                label: "places"),
            NavigationDestination(
                icon: Icon(
                  Icons.people,
                  size: 30,
                ),
                selectedIcon: Icon(Icons.people),
                label: "children"),
            NavigationDestination(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                selectedIcon: Icon(Icons.person),
                label: "profil"),
          ],
        ),
      ),
    );
  }
}
