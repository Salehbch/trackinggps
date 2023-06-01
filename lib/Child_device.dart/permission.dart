// import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/settings.dart';
import 'package:flutter_application_1/pages.dart/choice.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages.dart/ContactUs.dart';
import '../pages.dart/aboutUs.dart';

class Permission1 extends StatefulWidget {
  Permission1();

  @override
  State<Permission1> createState() => _Permission1State();
}

class _Permission1State extends State<Permission1> {
  final _controllerId = TextEditingController();
  late String x;
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
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 800;

    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Hello to your profile My child',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Name:',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    width: 200,
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      child?['name'] ?? '',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepOrange, width: 3.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'OF cource this is your email:',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Email:',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    width: 250,
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      child?['email'] ?? '',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepOrange, width: 3.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'And your birthday is on :',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Birthday:',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    width: 200,
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      child?['birthday'] ?? '',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepOrange, width: 3.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'OF cource you are a',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Gender:',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    width: 90,
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      child?['gender'] ?? '',
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepOrange, width: 3.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.redAccent),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                          side: const BorderSide(color: Colors.black, width: 1),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('write your Id for sign out: '),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: _controllerId,
                                  decoration: InputDecoration(
                                    labelText: 'The unique Id',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 50),
                                Container(
                                  height: 50,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.red,
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      x = (await signOutChild())!;
                                      print('x===========');

                                      if (_controllerId.text == x) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Choice_1(),
                                          ),
                                        );
                                        clearChildId();
                                      } else if (_controllerId.text.isEmpty) {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Text(
                                                    'please write your unique Id'),
                                              );
                                            });
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Text(
                                                    'please correct the Id you have a mistake in your Id'),
                                              );
                                            });
                                      }
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.transparent),
                                      elevation:
                                          MaterialStateProperty.all<double>(0),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                      ),
                                    ),
                                    child: Text('Sign Out'),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
        accuracy: LocationAccuracy.high, distanceFilter: 0.1, interval: 3000);

    location.onLocationChanged.listen((LocationData currentLocation) {
      firestore.collection('children').doc(childId).update({
        'position': GeoPoint(
          currentLocation.latitude!,
          currentLocation.longitude!,
        ),
      }).catchError((err) {});
    }, onError: (err) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(err.message.toString()),
            );
          });
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
          print(child);
        }
      });
    } catch (err) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(err.toString()),
            );
          });
    }
  }

  Future<String?> signOutChild() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var childId = prefs.getString('childId');

    print('child=============$childId');
    return childId;
  }
}
