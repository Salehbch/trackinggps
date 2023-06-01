import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages.dart/ContactUs.dart';
import 'package:flutter_application_1/pages.dart/aboutUs.dart';

import 'package:shared_preferences/shared_preferences.dart';

class profilPage extends StatefulWidget {
  const profilPage({Key? key}) : super(key: key);

  @override
  State<profilPage> createState() => _profilPageState();
}

class _profilPageState extends State<profilPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, dynamic>? snapshot;

  @override
  void initState() {
    super.initState();
    getparentData().then((data) {
      setState(() {
        snapshot = data;
      });
    }).catchError((error) {
      print('Error retrieving data: $error');
    });
  }

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
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  'Hello to your profile My parent',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 30),
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
                        '${snapshot?['name']}',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w400),
                      ),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.deepOrange, width: 3.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  'OF cource this is your email:',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 30),
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
                        '${snapshot?['email']}',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w400),
                      ),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.deepOrange, width: 3.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                Center(
                  child: Container(
                    height: 80,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                      'Are you sure you want to disconnect:\n '),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            border: const Border(
                                              bottom: BorderSide(
                                                  color: Colors.black),
                                              top: BorderSide(
                                                  color: Colors.black),
                                              left: BorderSide(
                                                  color: Colors.black),
                                              right: BorderSide(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          child: MaterialButton(
                                            minWidth: double.infinity,
                                            height: 60,
                                            color: Colors.red,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            onPressed: () async {
                                              await FirebaseAuth.instance
                                                  .signOut();
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs.remove('uid');
                                              Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      '/choice');
                                            },
                                            child: Text(
                                              'Yes',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            border: const Border(
                                              bottom: BorderSide(
                                                  color: Colors.black),
                                              top: BorderSide(
                                                  color: Colors.black),
                                              left: BorderSide(
                                                  color: Colors.black),
                                              right: BorderSide(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          child: MaterialButton(
                                            minWidth: double.infinity,
                                            height: 60,
                                            color: Colors.greenAccent,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'No',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        'Sign Out',
                        style: TextStyle(fontSize: 22),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.redAccent),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 0, 0, 0)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side:
                                const BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
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
}

Future<Map<String, dynamic>?> getparentData() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var uid = prefs.getString('uid');

    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('parents').doc(uid).get();

    if (documentSnapshot.exists) {
      Map<String, dynamic>? data =
          documentSnapshot.data() as Map<String, dynamic>?;

      String? name = data!['name'];
      String? email = data['email'];

      // Do something with the data
      print('UID: $uid');
      print('Name: $name');
      print('Email: $email');

      return data;
    }
  } catch (e) {
    print('Error: $e');
  }
  return null;
}
