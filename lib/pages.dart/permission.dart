// import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/settings.dart';
import 'package:flutter_application_1/pages.dart/choice.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ContactUs.dart';
import 'aboutUs.dart';

class Permission1 extends StatefulWidget {
  Permission1();

  @override
  State<Permission1> createState() => _Permission1State();
}

class _Permission1State extends State<Permission1> {
  Location location = Location();

  void clearChildId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('childId');
  }

  bool _serviceEnabled = false;

  dynamic child;

  PermissionStatus? _permissionGranted;

  @override
  void initState() {
    super.initState();
    checkLocationServicesInDevice();
    getChildData();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
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
              children: [
                Text(
                  'your information',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
            ),
          ],
        ),
        drawer: isLargeScreen ? null : _drawer(),
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello to your profile My child',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                Text(
                  child?['name'] ?? '',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                Text(
                  'OF cource this is your email:',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                Text(
                  child?['email'] ?? '',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                Text(
                  'And your birthday is on :',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                Text(
                  child?['birthday'] ?? '',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                Text(
                  'OF cource you are a',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5),
                Text(
                  child?['gender'] ?? '',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
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
                          clearChildId();
                          return Choice_1();
                        }
                        throw Exception('Unknown item: $item');
                      }));
                    },
                    title: Text(item),
                  ))
              .toList(),
        ),
      );

  final List<String> _menuItems = <String>[
    'About',
    'Contact',
    'Settings',
    'Sign Out',
  ];

  Future<void> checkLocationServicesInDevice() async {
    Location location = Location();

    _serviceEnabled = await location.serviceEnabled();

    // test GPS
    if (!_serviceEnabled) {
      // if not enabled, turn it on
      _serviceEnabled = await location.requestService();
      if (_serviceEnabled == true) {
        _permissionGranted = await location.hasPermission();
        // check for permission
        if (_permissionGranted != PermissionStatus.granted) {
          _permissionGranted = await location.requestPermission();

          if (_permissionGranted == PermissionStatus.granted) {
            sendLocation();
          } else {
            print("Location permission denied");
            SystemNavigator.pop();
          }
        } else {
          sendLocation();
        }
      } else {
        SystemNavigator.pop();
      }
    } else {
      _permissionGranted = await location.hasPermission();

      if (_permissionGranted != PermissionStatus.granted) {
        _permissionGranted = await location.requestPermission();

        if (_permissionGranted == PermissionStatus.granted) {
          sendLocation();

          print("Location permission denied");
          SystemNavigator.pop();
        }
      } else {
        sendLocation();
      }
    }
  }

  Future<void> sendLocation() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? childId = prefs.getString('childId');

    Location location = Location();

    location.changeSettings(
        accuracy: LocationAccuracy.high, distanceFilter: 0.1, interval: 2500);

    location.onLocationChanged.listen((LocationData currentLocation) {
      print('::::::::::::::::::::');
      print(
          'lat = ${currentLocation.latitude} long = ${currentLocation.longitude}');

      firestore.collection('children').doc(childId).update({
        'position': GeoPoint(
          currentLocation.latitude!,
          currentLocation.longitude!,
        ),
      }).catchError((err) {});
    }, onError: (err) {
      print(err);
    });
  }

  Future<void> getChildData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var childId = prefs.getString('childId');
    try {
      await firestore.collection('children').doc(childId).get().then((value) {
        if (mounted) {
          setState(() {
            child = value.data();
          });
        }
        var name = child?["name"];
        var gender = child?["gender"];
        var email = child?["email"];
        var birthday = child?["birthday"];
        if (child != null) {
          print(name);
          print(gender);
          print(email);
          print(birthday);
        } else {
          print("Data is null");
        }
      });
    } catch (err) {}
  }
}




/*
  Future<void> sendLocation(Location location) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var childId = prefs.getString('childId');
    location.onLocationChanged.listen((LocationData currentLocation) async {
      print('::::::::::::::::::::');
      print(
          'lat = ${currentLocation.latitude} long = ${currentLocation.longitude}');
      await firestore.collection('children').doc(childId).update({
        'position': GeoPoint(
          currentLocation.latitude!,
          currentLocation.longitude!,
        )
      });
    });
  }*/
