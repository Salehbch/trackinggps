/*

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/animation/FadeAnimation.dart';
import 'package:flutter_application_1/Parent_device.dart/login.dart';
import 'package:flutter_application_1/Parent_device.dart/signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyStatefulWidget(),
  ));
}

class DefaultFirebaseOptions {
  static var currentPlatform;
}

class Parent_start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget();

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 246, 253, 204),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Welcome",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.2,
                      Text(
                        "Automatic identity verification which enables you to verify your identity",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[700], fontSize: 17),
                      )),
                ],
              ),
              FadeAnimation(
                  1.4,
                  Container(
                    height: MediaQuery.of(context).size.height / 2.1,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('img/illustration.png'))),
                  )),
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1.5,
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.6,
                      Container(
                        padding: EdgeInsets.only(top: 0, left: 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                            )),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                          },
                          color: Color.fromARGB(234, 9, 1, 36),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/

/*

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _serviceEnabled = false;

  PermissionStatus _permissionGranted;

  LocationData _location;

  @override
  void initState() {
    checkLocationServicesInDevice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }

  Future<void> checkLocationServicesInDevice() async {
    Location location = Location();

    _serviceEnabled = await location.serviceEnabled();

    if (_serviceEnabled) {
      _permissionGranted = await location.hasPermission();

      if (_permissionGranted == PermissionStatus.granted) {
        location.onLocationChanged.listen((LocationData currentLocation) {
          print(currentLocation.latitude.toString() +
              " " +
              currentLocation.longitude.toString());
        });
      } else {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted == PermissionStatus.granted) {
          print("user allowed ");
        } else {
          SystemNavigator.pop();
        }
      }
    } else {
      _serviceEnabled = await location.requestService();
      if (_serviceEnabled) {
        _permissionGranted = await location.hasPermission();

        if (_permissionGranted == PermissionStatus.granted) {
          print("user allowed before ");
        } else {
          _permissionGranted = await location.requestPermission();
          if (_permissionGranted == PermissionStatus.granted) {
            print("user allowed");
          } else {
            SystemNavigator.pop();
          }
        }
        SystemNavigator.pop();
      }
    }
  }
}



*/

/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

import 'Parent_device.dart/login.dart';
import 'Parent_device.dart/signup.dart';
import 'animation/FadeAnimation.dart';
*/ /*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

bool _serviceEnabled = false;

PermissionStatus _permissionGranted;

LocationData _location;

@override
void initState() {
  checkLocationServicesInDevice();
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromARGB(230, 246, 253, 204),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                FadeAnimation(
                    1,
                    Text(
                      "Welcome",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    )),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    1.2,
                    Text(
                      "Automatic identity verification which enables you to verify your identity",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[700], fontSize: 17),
                    )),
              ],
            ),
            FadeAnimation(
                1.4,
                Container(
                  height: MediaQuery.of(context).size.height / 2.1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('img/illustration.png'))),
                )),
            Column(
              children: <Widget>[
                FadeAnimation(
                    1.5,
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    1.6,
                    Container(
                      padding: EdgeInsets.only(top: 0, left: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()));
                        },
                        color: Color.fromARGB(234, 9, 1, 36),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Future<void> checkLocationServicesInDevice() async {
  Location location = Location();

  _serviceEnabled = await location.serviceEnabled();

  if (_serviceEnabled) {
    _permissionGranted = await location.hasPermission();

    if (_permissionGranted == PermissionStatus.granted) {
      location.onLocationChanged.listen((LocationData currentLocation) {
        print(currentLocation.latitude.toString() +
            " " +
            currentLocation.longitude.toString());
      });
    } else {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted == PermissionStatus.granted) {
        print("user allowed ");
      } else {
        SystemNavigator.pop();
      }
    }
  } else {
    _serviceEnabled = await location.requestService();
    if (_serviceEnabled) {
      _permissionGranted = await location.hasPermission();

      if (_permissionGranted == PermissionStatus.granted) {
        print("user allowed before ");
      } else {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted == PermissionStatus.granted) {
          print("user allowed");
        } else {
          SystemNavigator.pop();
        }
      }
      SystemNavigator.pop();
    }
  }
}
*/
/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  const MapsPage(this.title);

  final String title;

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final Completer<GoogleMapController> _controller = Completer();

  List<Marker> markers = [
    const Marker(
        markerId: MarkerId("first place"),
        infoWindow: InfoWindow(title: 'this place is so nice'),
        position: LatLng(41.0175302, 29.1413539)),
    const Marker(
        markerId: MarkerId("second place"),
        infoWindow: InfoWindow(title: 'this place is for dogs'),
        position: LatLng(45.650002, 0.160000)),
    const Marker(
        markerId: MarkerId("third place"),
        infoWindow: InfoWindow(title: 'this place is for cats'),
        position: LatLng(50.726398, 1.614700)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          target: LatLng(39.1667, 35.6667),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers.toSet(),
      ),
    );
  }
}
*/


//hadou am mn signup......................................................................




/*
  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerpassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          name: _controllerName.text,
          email: _controllerEmail.text,
          password: _controllerpassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }
*/

/*async {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                                email: "email", password: "password");
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    },*/





                     /*  informationpoint.set({
                        'Name': 'kamel',
                        'email': 'kamel@gmail.com',
                        'password': 'kamel12345',
                        'point': 'point1'
                      });*/
                      /*FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _email, password: _password)
                          .then((signedInUser) {})
                          .catchError((e) {
                        print(e);
                      }); */




                      /***.............................................................................
                       * 
                       * 
                       * 
/*import 'package:flutter/material.dart';

class SimpleDropDown extends StatefulWidget {
  const SimpleDropDown({Key? key}) : super(key: key);

  @override
  State<SimpleDropDown> createState() => _SimpleDropDownState();
}

class _SimpleDropDownState extends State<SimpleDropDown> {
  String? _selectedFruit;
  final List<String> _fruits = [
    '🍎 Apple',
    '🍋 Mango',
    '🍌 Banana',
    '🍉 Watermelon',
    '🍇 Grapes',
    '🍓 Strawberry',
    '🍒 Cherries',
    '🍑 Peach',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _title("Simple Dropdown"),
                _dropDown(),
                _title("Outlined Dropdown"),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: _dropDown(underline: Container())),
                _title("Custom Dropdown"),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: _dropDown(
                      underline: Container(),
                      style: const TextStyle(color: Colors.white),
                      dropdownColor: Colors.red,
                      iconEnabledColor: Colors.white,
                      hintStyle: const TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _title(String val) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        val,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _dropDown({
    Widget? underline,
    Widget? icon,
    TextStyle? style,
    TextStyle? hintStyle,
    Color? dropdownColor,
    Color? iconEnabledColor,
  }) =>
      DropdownButton<String>(
          value: _selectedFruit,
          underline: underline,
          icon: icon,
          dropdownColor: dropdownColor,
          style: style,
          iconEnabledColor: iconEnabledColor,
          onChanged: (String? newValue) {
            setState(() {
              _selectedFruit = newValue;
            });
          },
          hint: Text("Select a fruit", style: hintStyle),
          items: _fruits
              .map((fruit) =>
                  DropdownMenuItem<String>(value: fruit, child: Text(fruit)))
              .toList());
}*/*/





/*********************************************************************** *
 * 
 * 
 * 
 * 
 * /*

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/NavigationBar.dart';
import 'package:flutter_application_1/animation/FadeAnimation.dart';
import '../services.dart/auth.dart';

class LinkPage extends StatefulWidget {
  LinkPage({Key key}) : super(key: key);

  @override
  State<LinkPage> createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 252, 203),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 245, 252, 203),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 200,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Add child ",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                      1.2,
                      Text(
                        "Create an accounte for your child",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  FadeAnimation(1.2, makeInput(label: "Name")),
                  FadeAnimation(
                      1.3, makeInput1(label: "Email", obscureText: true)),
                  FadeAnimation(
                      1.4, makeInput1(label: "password", obscureText: true)),
                  Container(
                      child: Row(children: <Widget>[
                    FadeAnimation(
                        1.4, makeInput3(label: "age", obscureText: true)),
                    FadeAnimation(
                        1.4, makeInput4(label: "gender", obscureText: true)),
                  ]))
                ],
              ),
              Column(
                children: [
                  MaterialButton(
                    minWidth: double.maxFinite,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NavigationPage()));
                    },
                    color: Color.fromARGB(255, 174, 164, 200),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(60)),
                    child: Text(
                      "Create",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 25),
                    ),
                  ),
                  MaterialButton(
                    minWidth: double.minPositive,
                    height: 45,
                    color: Color.fromARGB(255, 250, 120, 120),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(50)),
                    onPressed: () {},
                    child: Text(
                      "log out",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
              FadeAnimation(
                  1.6,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account?"),
                      Text(
                        " Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color.fromARGB(255, 62, 60, 60))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 66, 64, 64))),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget makeInput2({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color.fromARGB(255, 62, 60, 60))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 66, 64, 64))),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget makeInput3({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          cursorWidth: 20,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color.fromARGB(255, 62, 60, 60))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 66, 64, 64))),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget makeInput4({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          cursorWidth: 20,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color.fromARGB(255, 62, 60, 60))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 66, 64, 64))),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget makeInput1({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color.fromARGB(255, 62, 60, 60))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 66, 64, 64))),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

/*void insertData(
    String name, String email, String password, int age, String gender) {
  DatabaseReference databaseRef = FirebaseDatabase.instance.reference();
  databaseRef.child('child/').push().set({
    'name': name,
    'email': email,
    'password': password,
    'age': age,
    'gender': gender,
  });*/









DropdownButtonFormField<String>(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 17, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
              ),
              value: _selectedGender,
              hint: Text('Select Gender'),
              onChanged: (String value) {
                setState(() {
                  _selectedGender = value;
                });
              },
              items: [
                DropdownMenuItem<String>(
                  value: 'Boy',
                  child: Text('Boy'),
                ),
                DropdownMenuItem<String>(
                  value: 'Girl',
                  child: Text('Girl'),
                ),
              ],
            ),



            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Birthday',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      _selectedDate == null
                          ? 'Select Birthday'
                          : DateFormat('dd/MM/yyyy').format(_selectedDate),
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String email = _emailController.text;
                String name = _nameController.text;
                String gender = _selectedGender;
                String birthday = _selectedDate == null
                    ? 'Not Selected'
                    : DateFormat('dd/MM/yyyy').format(_selectedDate);

                // Do something with the data (e.g., save it to a database)
                print('Email: $email');
                print('Name: $name');
                print('Gender: $gender');
                print('Birthday: $birthday');
              },
              child: Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                getImage();
              },
              child: Text('Upload Photo'),
            ),
            SizedBox(height: 16.0),
            if (_image != null)
              Image.file(
                _image,
                height: 100.0,
                width: 100.0,
              )
            else
              Container(),
















*/

/******************************************************************** */
/*
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/NavigationBar.dart';
import 'package:flutter/material.dart';

class LinkPage extends StatefulWidget {
  @override
  _LinkPageState createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _birthdayController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _genderController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _genderController,
              decoration: InputDecoration(
                labelText: 'Gender',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _birthdayController,
              decoration: InputDecoration(
                labelText: 'Birthday',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NavigationPage()),
                );

                String email = _emailController.text;
                String name = _nameController.text;
                String gender = _genderController.text;
                String birthday = _birthdayController.text;

                // Do something with the data (e.g., save it to a database)
                print('Email: $email');
                print('Name: $name');
                print('Gender: $gender');
                print('Birthday: $birthday');
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
*/*/









/* from parmission
  Widget _drawer() => Drawer(
        child: ListView(
          children: _menuItems
              .map((item) => ListTile(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    title: Text(item),
                  ))
              .toList(),
        ),
      );



  Widget _navBarItems() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _menuItems
            .map(
              (item) => InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LinkPage()));
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
}

final List<String> _menuItems = <String>[
  'About',
  'Contact',
  'Settings',
  'Sign Out',
];*/




/*****children page
 * 
 * 
 * 



























 /*

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:flutter_application_1/services.dart/children.dart';
import 'package:flutter/services.dart';

class ChildrenPage extends StatefulWidget {
  const ChildrenPage(this.title);

  final String title;

  @override
  State<ChildrenPage> createState() => _ChildrenPageState();
}

class _ChildrenPageState extends State<ChildrenPage> {
  String name = "";
  String age = "";
  String gender = "";
  String email = "";
  String password = "";

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Child'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Name", hintText: "Add Name"),
                    onChanged: (val) => setState(() => name = val),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Email", hintText: "Add Email"),
                    onChanged: (val) => setState(() => email = val),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Gender", hintText: "Choose Gender"),
                    onChanged: (val) => setState(() => gender = val),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Age", hintText: "Add date nais"),
                    onChanged: (val) => setState(() => age = val),
                  ),
                  SizedBox(height: 30),
                  Consumer<Children>(
                    builder: (ctx, value, _) => MaterialButton(
                        color: Colors.orangeAccent,
                        textColor: Colors.black,
                        child: Text("Add Child"),
                        onPressed: () {
                          var doublePrice;
                          setState(() {
                            doublePrice = double.tryParse(gender) ?? 0.0;
                          });

                          if (name == "" ||
                              age == "" ||
                              email == "" ||
                              gender == "") {
                            value
                                .add(
                              id: DateTime.now().toString(),
                              name: name,
                              email: email,
                              age: age,
                              gender: gender,
                            )
                                .catchError((_) {
                              return showDialog<Null>(
                                context: context,
                                builder: (innerContext) => AlertDialog(
                                  title: Text("An error occurred!"),
                                  content: Text('Something went wrong.'),
                                  actions: [
                                    MaterialButton(
                                        child: Text("Okay"),
                                        onPressed: () =>
                                            Navigator.of(innerContext).pop())
                                  ],
                                ),
                              );
                            }).then((_) {
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.pop(context);
                            });
                          }
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}







*/
 */











/*/*
  Future<void> _signOut(BuildContext context, AuthBase auth) async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> confirmSignOut(BuildContext context, AuthBase auth) async {
    final didRequestSignOut = await showAlertDialog(context,
        title: 'Logout',
        content: 'Are you sure you want to log out?',
        defaultActionText: 'Logout',
        cancelActionText: 'Cancel');
    if (didRequestSignOut == true) {
      await _signOut(context, auth);
      Navigator.of(context).pop();
    }
  }
*/*/











/*/*import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class profilPage extends StatefulWidget {
  const profilPage(this.title);

  final String title;

  @override
  State<profilPage> createState() => _profilPageState();
}

class _profilPageState extends State<profilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 252, 203),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 245, 252, 203),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 200,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(),
              ]),
        ),
      ),
    );
  }
}








*/

/*






import 'package:flutter/material.dart';






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
              onPressed: () => confirmSignOut(context, auth),
              icon: Icon(Icons.logout))
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 8, bottom: 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                buildItems(context),
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.contact_support_sharp),
                    onPressed: () {},
                  ),
                  trailing: Text(
                    'Developed by Jordy-Hershel',
                    style: TextStyle(color: Colors.redAccent, fontSize: 12),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed,
      child: Container(
        height: 55,
        margin: EdgeInsets.symmetric(
          horizontal: 10,
        ).copyWith(
          bottom: 20,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 25,
            ),
            SizedBox(width: 15),
            Text(
              text ?? '',
              style: TextStyles.body,
            ),
            Spacer(),
            if (hasNavigation)
              Icon(
                LineAwesomeIcons.alternate_arrow_circle_right,
                size: 25,
              ),
          ],
        ),
      ),
    );
  }
}







  Widget buildItems(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          ProfileListItem(
            icon: LineAwesomeIcons.history,
            onPressed: () {},
            text: 'Update profile',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.language,
            onPressed: () {
              
            },
            text: 'Change language',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.moon,
            onPressed: () {},
            text: 'Dark mode',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.user_shield,
            onPressed: () {
             
            },
            text: 'Contact us',
          ),
        ],
      ),
    );
  }


*/*/





/*
/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class profilPage extends StatefulWidget {
  const profilPage(this.title);

  final String title;

  @override
  State<profilPage> createState() => _profilPageState();
}

class _profilPageState extends State<profilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 252, 203),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 245, 252, 203),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 200,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(),
              ]),
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage1 extends StatefulWidget {
  const SettingsPage1() : super();

  @override
  State<SettingsPage1> createState() => _SettingsPage1State();
}

class _SettingsPage1State extends State<SettingsPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      backgroundColor: const Color(0xfff6f6f6),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: [
              _SingleSection(
                title: "General",
                children: [
                  const _CustomListTile(
                      title: "About Phone",
                      icon: CupertinoIcons.device_phone_portrait),
                    
                  _CustomListTile(
                      title: "Dark Mode",
                      icon: CupertinoIcons.moon,
                      trailing:
                          CupertinoSwitch(value: false, onChanged: (value) {})),
                  const _CustomListTile(
                      title: "System Apps Updater",
                      icon: CupertinoIcons.cloud_download),
                  const _CustomListTile(
                      title: "Security Status",
                      icon: CupertinoIcons.lock_shield),
                ],
              ),
              _SingleSection(
                title: "Network",
                children: [
                  const _CustomListTile(
                      title: "SIM Cards and Networks",
                      icon: Icons.sd_card_outlined),
                  _CustomListTile(
                    title: "Wi-Fi",
                    icon: CupertinoIcons.wifi,
                    trailing: CupertinoSwitch(value: true, onChanged: (val) {}),
                  ),
                  _CustomListTile(
                    title: "Bluetooth",
                    icon: CupertinoIcons.bluetooth,
                    trailing:
                        CupertinoSwitch(value: false, onChanged: (val) {}),
                  ),
                  const _CustomListTile(
                    title: "VPN",
                    icon: CupertinoIcons.desktopcomputer,
                  )
                ],
              ),
              const _SingleSection(
                title: "Privacy and Security",
                children: [
                  _CustomListTile(
                      title: "Multiple Users", icon: CupertinoIcons.person_2),
                  _CustomListTile(
                      title: "Lock Screen", icon: CupertinoIcons.lock),
                  _CustomListTile(
                      title: "Display", icon: CupertinoIcons.brightness),
                  _CustomListTile(
                      title: "Sound and Vibration",
                      icon: CupertinoIcons.speaker_2),
                  _CustomListTile(
                      title: "Themes", icon: CupertinoIcons.paintbrush)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget trailing;
  const _CustomListTile({Key key, this.title, this.icon, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing ?? const Icon(CupertinoIcons.forward, size: 18),
      onTap: () {},
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SingleSection({
    Key key,
    this.title,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title.toUpperCase(),
            style:
                Theme.of(context).textTheme.headline3?.copyWith(fontSize: 16),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}


*/

/*
class SettingsPage1 extends StatefulWidget {
  const SettingsPage1() : super();

  @override
  State<SettingsPage1> createState() => _SettingsPage1State();
}

class _SettingsPage1State extends State<SettingsPage1> {

*/
*/
















/*
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/app/bloc/child_side_bloc.dart';
import 'package:flutter_application_1/app/pages/set_child_page.dart';
import 'package:flutter_application_1/common_widgets/empty_content.dart';
import 'package:flutter_application_1/models/child_model.dart';
import 'package:flutter_application_1/models/notification_model.dart';
import 'package:flutter_application_1/services/app_usage_service.dart';
import 'package:flutter_application_1/services/database.dart';
import 'package:provider/provider.dart';




class ChildPage extends StatefulWidget {
  

  const ChildPage({Key key, this.database, this.child}) : super(key: key);

  static Widget create(BuildContext context, database, ChildModel child) {
    final appUsage = Provider.of<AppUsageService>(context, listen: false);

    return BlocProvider(
      create: (_) => ChildSideBloc(),
      child: FutureBuilder(
          future: appUsage.getAppUsageService(),
          builder: (_, AsyncSnapshot snapshot) =>
              ChildPage(database: database, child: child)),
    );
  }

  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {

  ///Methods To send to Bloc => Local User
  void sendLocalToBloCNotification(BuildContext context) {
    var childSideBloc = context.read<ChildSideBloc>();
    childSideBloc.add(GetNotifications());
    Navigator.pop(context);
  }

  ///Methods To send to Bloc => Local User
  void sendLocalToBloCAppList(BuildContext context) {
    var childSideBloc = context.read<ChildSideBloc>();
    childSideBloc.add(GetAppList());
    Navigator.pop(context);
  }
/*
  @override
  void initState() {
    /// This method updates the location on the map every 35 minutes
    Timer.periodic(const Duration(minutes: 5), (timer) {
      widget.database.liveUpdateChild(widget.child, timer.tick);
    });
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    final appUsage = Provider.of<AppUsageService>(context);
    return Scaffold(
        drawer: Drawer(
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            widget.child != null
                ? Container(
              height: 250,
              color: Colors.indigo,
              child: DrawerHeader(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 6),
                        CircleAvatar(
                          backgroundImage: NetworkImage(widget.child.image),
                          radius: 45,
                        ),
                        SizedBox(height: 6),
                        Text(
                          '${widget.child.name} ',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(height: 12),
                        Text(
                          '${widget.child.email} ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(height: 6),
                        Text(
                          '${widget.child.id} ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(height: 6),
                      ],
                    ),
                  )),
            )
                : Container(),
            Divider(
              height: 0.5,
              thickness: 0.2,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification'),
              onTap: () => sendLocalToBloCNotification(context),
            ),
            Divider(
              height: 0.5,
              thickness: 0.2,
              color: Colors.grey,
            ),
            ListTile(
                leading: Icon(Icons.settings_applications),
                title: Text('App usage'),
                onTap: () => sendLocalToBloCAppList(context)),
          ]),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SetChildPage()),
                  );
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.indigo,
                ))
          ],
          backgroundColor: Colors.white,
          title: Text(
            'Child',
            style: TextStyle(color: Colors.indigo),
          ),
          iconTheme: IconThemeData(color: Colors.indigo),
          centerTitle: true,
        ),
        body: appUsage.info == null
            ? EmptyContent(
          title: 'This is the child page',
          message: 'Nothing to show at the moment',
        )
            : Container(
          child: Center(
            child: BlocConsumer<ChildSideBloc, ChildSideState>(
                    listener: (context, state) {},
              builder: (context, state) {
                if (state is ChildSideInitial) {
                  return buildInitialInput(context);
                } else if (state is ChildSideFetching) {
                  return buildLoading();
                } else if (state is ChildSideNotification) {
                  return buildNotification();
                } else if (state is ChildSideAppList) {
                  return buildAppList(appUsage);
                } else {
                  return buildInitialInput(context);
                }
              },
            ),
          ),
        ));
  }

  Widget buildInitialInput(BuildContext context) {
    return Center(
        child: Text('Child Page',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            )));
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
      ),
    );
  }

  Widget buildNotification() {
    return StreamBuilder<List<NotificationModel>>(
        stream: widget.database.notificationStream(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.indigo,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(data[index].title ?? 'No title available'),
                      trailing: Text(
                        data[index].message ?? 'No message available',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasData) {
            return ErrorWidget(snapshot.error);
          }
          return EmptyContent(
            message:
            'This side of the app will display the list of Notifications',
            title: 'Notification page',
            fontSizeMessage: 13,
            fontSizeTitle: 23,
          );
        });
  }

  Widget buildAppList(appUsage) {
    return ListView.builder(
        itemCount: appUsage.info.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(
                appUsage.info[index].appName,
                style: TextStyle(fontSize: 15),
              ),
              trailing: Text(parseResult(appUsage.info[index].usage.toString()),
                  style: TextStyle(fontSize: 14, color: Colors.indigo)));
        });
  }

  String parseResult(String value) {
    var removeColon = value.replaceAll(':', ' ');
    var result = removeColon.replaceAll('.', '');

    result = result.replaceRange(1, 1, ' day ');
    result = result.replaceRange(9, 9, ' hour ');
    result = result.replaceRange(18, null, ' minutes');

    if (result.contains('00 hour')) {
      result = result.replaceRange(0, 14, '');
      return result;
    } else if (result.contains('0 day')) {
      result = result.replaceRange(0, 5, '');
      return result;
    }
    return result;
  }
}
*/







/*

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:flutter_application_1/services.dart/children.dart';
import 'package:flutter/services.dart';

class ChildrenPage extends StatefulWidget {
  const ChildrenPage(this.title);

  final String title;

  @override
  State<ChildrenPage> createState() => _ChildrenPageState();
}

class _ChildrenPageState extends State<ChildrenPage> {
  String name = "";
  String age = "";
  String gender = "";
  String email = "";
  String password = "";

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Child'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Name", hintText: "Add Name"),
                    onChanged: (val) => setState(() => name = val),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Email", hintText: "Add Email"),
                    onChanged: (val) => setState(() => email = val),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Gender", hintText: "Choose Gender"),
                    onChanged: (val) => setState(() => gender = val),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Age", hintText: "Add date nais"),
                    onChanged: (val) => setState(() => age = val),
                  ),
                  SizedBox(height: 30),
                  Consumer<Children>(
                    builder: (ctx, value, _) => MaterialButton(
                        color: Colors.orangeAccent,
                        textColor: Colors.black,
                        child: Text("Add Child"),
                        onPressed: () {
                          var doublePrice;
                          setState(() {
                            doublePrice = double.tryParse(gender) ?? 0.0;
                          });

                          if (name == "" ||
                              age == "" ||
                              email == "" ||
                              gender == "") {
                            value
                                .add(
                              id: DateTime.now().toString(),
                              name: name,
                              email: email,
                              age: age,
                              gender: gender,
                            )
                                .catchError((_) {
                              return showDialog<Null>(
                                context: context,
                                builder: (innerContext) => AlertDialog(
                                  title: Text("An error occurred!"),
                                  content: Text('Something went wrong.'),
                                  actions: [
                                    MaterialButton(
                                        child: Text("Okay"),
                                        onPressed: () =>
                                            Navigator.of(innerContext).pop())
                                  ],
                                ),
                              );
                            }).then((_) {
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.pop(context);
                            });
                          }
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}







*/



















































/*import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class ChildrenPage extends StatefulWidget {
  const ChildrenPage(this.title);

  final String title;

  @override
  State<ChildrenPage> createState() => _ChildrenPageState();
}

class _ChildrenPageState extends State<ChildrenPage> {
  Query childrenRef =
      FirebaseDatabase.instance.ref().child('child');
  TextEditingController _searchController = TextEditingController();
  late String _searchQuery;

  @override
  void initState() {
    super.initState();
    _searchQuery = '';
  }

  Widget listItem({required Map child}) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Color.fromARGB(255, 249, 157, 157),
      child: ListTile(
        title: Text(
          child['name'],
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              child['email'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              child['birthday'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        trailing: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.delete,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'Search child',
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete and add child'),
      ),
      body: Column(
        children: [
          buildSearchBar(),
          Expanded(
            child: Container(
              height: double.infinity,
              child: FirebaseAnimatedList(
                query: childrenRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map child = snapshot.value as Map;
                  child['key'] = snapshot.key;

                  // Apply search filter
                  if (_searchQuery.isNotEmpty &&
                      !child['name']
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase())) {
                    return Container();
                  }

                  return listItem(child: child);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/















/*
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/children_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class PlacesPage extends StatefulWidget {
  const PlacesPage(this.title);

  final String title;

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  final Completer<GoogleMapController> _controller = Completer();

  List<Marker> allmarkers = [];

   late PageController _pageController;

  @override
  void initState() {
    super.initState();
    Childrenloc.forEach((element) {
      allmarkers.add(Marker(
        markerId: MarkerId(element.Name),
        draggable: false,
        infoWindow: InfoWindow(title: element.Name, snippet: element.Email),
        position: element.locationCoords,
      ));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

ChildrenlocList(index) {
  return AnimatedBuilder(
    animation: _pageController,
    builder: (BuildContext context, Widget widget) {
      double value = 1;
      if (_pageController.position.haveDimensions) {
        value = _pageController.page - index;
        value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
      }
      return Center(
        child: SizedBox(
          height: Curves.easeInOut.transform(value) * 125.0,
          width: Curves.easeInOut.transform(value) * 350.0,
          child: widget,
        ),
      );
    },
    child: InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              height: 125.0,
              width: 275.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0.0, 4.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 90.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(Childrenloc[index].gender),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Childrenloc[index].Name,
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          Childrenloc[index].Email,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          width: 170.0,
                          child: Text(
                            Childrenloc[index].gender,
                            style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}












  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: const CameraPosition(
                target: LatLng(39.1667, 35.6667),
                zoom: 14.4746,
              ),
              markers: Set.from(allmarkers),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Positioned(
            bottom: 20.0,
            child: Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: _pageController, 
                itemCount: Childrenloc.length,
                itemBuilder: (BuildContext context,int index){
                   return ChildrenlocList(index);

                } ),
              ),
            ),
          ])
        
      );
    
  }
}
*/
/*
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/children_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PlacesPage('Places'),
    );
  }
}

class PlacesPage extends StatefulWidget {
  const PlacesPage(this.title);

  final String title;

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  late GoogleMapController _controller;

  List<Marker> allmarkers = [];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    Childrenloc.forEach((element) {
      allmarkers.add(Marker(
        markerId: MarkerId(element.Name),
        draggable: false,
        infoWindow: InfoWindow(title: element.Name, snippet: element.Email),
        position: element.locationCoords,
      ));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  Widget childrenLocList(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          moveCamera();
        },
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                height: 125.0,
                width: 275.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: const Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 90.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: const Radius.circular(10.0),
                            topLeft: const Radius.circular(10.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(Childrenloc[index].gender),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Childrenloc[index].Name,
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            Childrenloc[index].Email,
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            width: 170.0,
                            child: Text(
                              Childrenloc[index].gender,
                              style: const TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: const CameraPosition(
                target: LatLng(39.1667, 35.6667),
                zoom: 14.4746,
              ),
              markers: Set.from(allmarkers),
              onMapCreated: (GoogleMapController controller) {
                _controller;
              },
            ),
          ),
          Positioned(
            bottom: 20.0,
            child: Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: _pageController,
                itemCount: Childrenloc.length,
                itemBuilder: (BuildContext context, int index) {
                  return childrenLocList(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void moveCamera() {
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Childrenloc[_pageController.page!.toInt()].locationCoords,
          zoom: 14.0,
          bearing: 45.0,
          tilt: 45.0,
        ),
      ),
    );
  }
}
*/
























/*

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class LinkPage extends StatefulWidget {
  @override
  _LinkPageState createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  String _selectedGender;
  DateTime _selectedDate;
  File _image;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2005),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future getImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void insertDataChild() {
    String name = _nameController.text;
    String email = _emailController.text;
    String gender = _selectedGender;
    String birthday = _selectedDate == null
        ? 'Not Selected'
        : DateFormat('dd/MM/yyyy').format(_selectedDate);

    DatabaseReference databaseRef = FirebaseDatabase.instance.reference();
    databaseRef.child('child/Ipchild').push().set({
      'name': name,
      'email': email,
      'gender': gender,
      'birthday': birthday,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 127, 255, 227),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 127, 255, 227),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 200,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Create child",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Create your first child on this page",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 32, 29, 29),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),),),
                         SizedBox(height: 16.0),
TextField(
controller: _nameController,
decoration: InputDecoration(
labelText: 'Name',
contentPadding:
EdgeInsets.symmetric(vertical: 17, horizontal: 10),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
),
border: OutlineInputBorder(
borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
),
),
),
SizedBox(height: 16.0),
DropdownButtonFormField<String>(
decoration: InputDecoration(
contentPadding:
EdgeInsets.symmetric(vertical: 17, horizontal: 10),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
),
border: OutlineInputBorder(
borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
),
),
value: _selectedGender,
hint: Text('Select Gender'),
onChanged: (String value) {
setState(() {
_selectedGender = value;
});
},
items: [
DropdownMenuItem<String>(
value: 'Boy',
child: Text('Boy'),
),
DropdownMenuItem<String>(
value: 'Girl',
child: Text('Girl'),
),
],
),
SizedBox(height: 16.0),
InkWell(
onTap: () {
_selectDate(context);
},
child: InputDecorator(
decoration: InputDecoration(
labelText: 'Birthday',
contentPadding:
EdgeInsets.symmetric(vertical: 17, horizontal: 10),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
),
border: OutlineInputBorder(
borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
),
),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: <Widget>[
Text(
_selectedDate == null
? 'Select Birthday'
: DateFormat('dd/MM/yyyy').format(_selectedDate),
style: TextStyle(fontSize: 16.0),
),
Icon(Icons.calendar_today),
],
),
),
),
SizedBox(height: 20.0),
Row(
children: [
Container(
width: 100,
child: ElevatedButton(
style: ButtonStyle(
backgroundColor: MaterialStateProperty.all<Color>(
Color.fromARGB(255, 176, 155, 155),
),
foregroundColor: MaterialStateProperty.all<Color>(
Color.fromARGB(255, 0, 0, 0),
),
),
onPressed: () {
insertDataChild();
},
child: Text('Save'),
),
),
SizedBox(width: 60),
Container(
width: 100,
child: ElevatedButton(
style: ButtonStyle(
backgroundColor: MaterialStateProperty.all<Color>(
Color.fromARGB(255, 176, 155, 155),
),
foregroundColor: MaterialStateProperty.all<Color>(
Color.fromARGB(255, 0, 0, 0),
),
),
onPressed: () {
getImage();
},
child: Text('Add Photo'),
),
),
],
),
              SizedBox(height: 16.0),
              if (_image != null)
                Image.file(
                  _image,
                  height: 100.0,
                  width: 100.0,
                )
              else
                Container(),
            ],
          ),
        ),
      ),
    );
  }
}

*/







/*
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/children_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PlacesPage('Places'),
    );
  }
}

class PlacesPage extends StatefulWidget {
  const PlacesPage(this.title);

  final String title;

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  late GoogleMapController _controller;

  List<Marker> allmarkers = [];

  late PageController _pageController;
  late int prevPage = 0;

  @override
  void initState() {
    super.initState();
    Childrenloc.forEach((element) {
      allmarkers.add(Marker(
        markerId: MarkerId(element.Name),
        draggable: false,
        infoWindow: InfoWindow(title: element.Name, snippet: element.Email),
        position: element.locationCoords,
      ));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page!.toInt() != prevPage) {
      prevPage = _pageController.page!.toInt();
      moveCamera();
    }
  }

  Widget childrenLocList(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          // moveCamera();
        },
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                height: 125.0,
                width: 275.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: const Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 90.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: const Radius.circular(10.0),
                            topLeft: const Radius.circular(10.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(Childrenloc[index].gender),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Childrenloc[index].Name,
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            Childrenloc[index].Email,
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            width: 170.0,
                            child: Text(
                              Childrenloc[index].gender,
                              style: const TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: const CameraPosition(
                target: LatLng(39.1667, 35.6667),
                zoom: 14.4746,
              ),
              markers: Set.from(allmarkers),
              onMapCreated: (GoogleMapController controller) {
                _controller =
                    controller; // Assign the controller to the _controller field.
              },
            ),
          ),
          Positioned(
            bottom: 20.0,
            child: Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: _pageController,
                itemCount: Childrenloc.length,
                itemBuilder: (BuildContext context, int index) {
                  return childrenLocList(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void moveCamera() {
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Childrenloc[_pageController.page!.toInt()].locationCoords,
          zoom: 14.0,
          bearing: 45.0,
          tilt: 45.0,
        ),
      ),
    );
  }
}
*/

/*

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PlacesPage('Places'),
    );
  }
}

class PlacesPage extends StatefulWidget {
  const PlacesPage(this.title);

  final String title;

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  late GoogleMapController _controller;

  List<Marker> allmarkers = [];

  final List<ChildrenModel> Childrenloc = [];

  late PageController _pageController;
  late int prevPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);

    _loadChildren();
  }

  void _onScroll() {
    if (_pageController.page!.toInt() != prevPage) {
      prevPage = _pageController.page!.toInt();
      moveCamera();
    }
  }

  Widget childrenLocList(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          // moveCamera();
        },
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                height: 125.0,
                width: 275.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: const Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 90.0,
                        width: 90.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: const Radius.circular(10.0),
                            topLeft: const Radius.circular(10.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(Childrenloc[index].gender),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Childrenloc[index].Name,
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            Childrenloc[index].Email,
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            width: 170.0,
                            child: Text(
                              Childrenloc[index].gender,
                              style: const TextStyle(
                                fontSize: 11.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: const CameraPosition(
                target: LatLng(39.1667, 35.6667),
                zoom: 14.4746,
              ),
              markers: Set.from(allmarkers),
              onMapCreated: (GoogleMapController controller) {
                _controller =
                    controller; // Assign the controller to the _controller field.
              },
            ),
          ),
          Positioned(
            bottom: 20.0,
            child: Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: _pageController,
                itemCount: Childrenloc.length,
                itemBuilder: (BuildContext context, int index) {
                  return childrenLocList(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void moveCamera() {
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Childrenloc[_pageController.page!.toInt()].locationCoords,
          zoom: 14.0,
          bearing: 45.0,
          tilt: 45.0,
        ),
      ),
    );
  }

  void _loadChildren() {
    FirebaseFirestore.instance
        .collection('children')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        allmarkers.clear();
        snapshot.docs.forEach((doc) {
          var element = ChildrenModel.fromDocumentSnapshot(doc);
          allmarkers.add(
            Marker(
              markerId: MarkerId(element.Name),
              draggable: false,
              infoWindow: InfoWindow(
                title: element.Name,
                snippet: element.Email,
              ),
              position: element.locationCoords,
            ),
          );
        });
      });
    });
  }
}

class ChildrenModel {
  final String Name;
  final String Email;
  final String gender;
  final LatLng locationCoords;

  ChildrenModel({
    required this.Name,
    required this.Email,
    required this.gender,
    required this.locationCoords,
  });

  factory ChildrenModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return ChildrenModel(
      Name: data['Name'],
      Email: data['Email'],
      gender: data['Gender'],
      locationCoords: LatLng(data['Latitude'], data['Longitude']),
    );
  }
}

final List<ChildrenModel> Childrenloc = [];
*/
























/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Children {
  final String id;
  final String name;
  final String email;
  final int age;
  final String gender;

  Children({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.age,
    @required this.gender,
  });

  add({String id, String name, String email, String age, String gender}) {}
}

class Childrens with ChangeNotifier {
  List<Children> ChildrenList = [];

  Future<void> fetchData() async {
    const gender = "";
    try {
      final http.Response res = await http.get(gender as Uri);
      final extractedData = json.decode(res.body) as Map<String, dynamic>;
      extractedData.forEach((ChildId, ChildData) {
        final prodIndex =
            ChildrenList.indexWhere((element) => element.id == ChildId);
        if (prodIndex >= 0) {
          ChildrenList[prodIndex] = Children(
            id: ChildId,
            name: ChildData['name'],
            email: ChildData['email'],
            age: ChildData['age'],
            gender: ChildData['gender'],
          );
        } else {
          ChildrenList.add(Children(
            id: ChildId,
            name: ChildData['name'],
            email: ChildData['email'],
            age: ChildData['age'],
            gender: ChildData['gender'],
          ));
        }
      });

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateData(String id) async {
    final gender = "";

    final ChildIndex = ChildrenList.indexWhere((element) => element.id == id);
    if (ChildIndex >= 0) {
      await patch(gender,
          body: json.encode({
            "name": "new name ",
            "email": "new email",
            "price": 199,
            "gender": "girl",
          }));

      ChildrenList[ChildIndex] = Children(
        id: id,
        name: "new name",
        email: "new email",
        age: 199,
        gender: "boy",
      );

      notifyListeners();
    } else {
      print("...");
    }
  }

  Future<void> add(
      {String id, String name, String email, int age, String gender}) async {
    const gender = "boy";
    try {
      http.Response res = await http.post(gender as Uri,
          body: json.encode({
            "name": name,
            "email": email,
            "age": age,
            "gender": gender,
          }));
      print(json.decode(res.body));

      ChildrenList.add(Children(
        id: json.decode(res.body)['name'],
        name: name,
        email: email,
        age: age,
        gender: gender,
      ));
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> delete(String id) async {
    String gender = "boy";

    final prodIndex = ChildrenList.indexWhere((element) => element.id == id);
    var prodItem = ChildrenList[prodIndex];
    ChildrenList.removeAt(prodIndex);
    notifyListeners();

    var res = await http.delete(url as Uri);
    if (res.statusCode >= 400) {
      ChildrenList.insert(prodIndex, prodItem);
      notifyListeners();
      print("Could not deleted item");
    } else {
      prodItem = null;
      print("Item deleted");
    }
  }

  patch(String gender, {String body}) {}
}
*/












/*import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Child {
  Query childrenRef = FirebaseDatabase.instance.ref().child('child');

  String Name;
  String Email;
  String gender;
  LatLng locationCoords;

  Child({
    required this.Name,
    required this.Email,
    required this.gender,
    required this.locationCoords,
  });
}

final List<Child> Childrenloc = [
  Child(
    Name: 'saleh',
    Email: 'saleh@gmail.com',
    gender: 'boy',
    locationCoords: LatLng(40.745803, -73.988213),
  ),
  Child(
    Name: 'saleh11',
    Email: 'saleh11@gmail.com',
    gender: 'boy',
    locationCoords: LatLng(38.2695, 38.68935),
  ),
];
*/

/*
import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Child {
  DatabaseReference childrenRef =
      FirebaseDatabase.instance.reference().child('child');

  String Name;
  String Email;
  String gender;
  LatLng locationCoords;

  Child({
    required this.Name,
    required this.Email,
    required this.gender,
    required this.locationCoords,
  });

  static Future<List<Child>> getChildren() async {
    DataSnapshot dataSnapshot = (await FirebaseDatabase.instance.reference().child('child').once()) as DataSnapshot;

    List<Child> children = [];
    Map<dynamic, dynamic> values = dataSnapshot.value;
    values.forEach((key, data) {
      children.add(Child(
        Name: data['Name'],
        Email: data['Email'],
        gender: data['gender'],
        locationCoords: LatLng(data['latitude'], data['longitude']),
      ));
    });

    return children;
  }
}
*/





/*
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class ChildrenModel {
  final String Name;
  final String Email;
  final String gender;
  final LatLng locations;

  ChildrenModel({
    required this.Name,
    required this.Email,
    required this.gender,
    required this.locations,
  });

  factory ChildrenModel.fromSnapshot(String key, Map<dynamic, dynamic> value) {
    return ChildrenModel(
      Name: value['Name'],
      Email: value['Email'],
      gender: value['Gender'],
      locations: LatLng(value['Latitude'], value['Longitude']),
    );
  }
}

List<ChildrenModel> ChildrenModelList = [];
*/






/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      
    
    );
  }
}

class notificationPage extends StatefulWidget {
  const notificationPage(this.title);


  final String title;

  @override
  State<notificationPage> createState() => _notificationPageState();
}

class _notificationPageState extends State<notificationPage> {

final Completer<GoogleMapController> _controller =  Completer();

List<Marker> markers =  [  
  const Marker(
    markerId: MarkerId("first place"),
    infoWindow:InfoWindow( title:'this place is so nice'),
    position: LatLng(41.0175302, 29.1413539)
     ),
  const Marker(
    markerId: MarkerId("second place"),
    infoWindow:InfoWindow( title:'this place is for dogs'),
    position: LatLng(45.650002, 0.160000)
     ),
     const Marker(
    markerId: MarkerId("third place"),
    infoWindow:InfoWindow( title:'this place is for cats'),
    position: LatLng(50.726398, 1.614700)
     ),
 ];



  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      

      body: GoogleMap( 
        mapType: MapType.normal,
         initialCameraPosition:  const CameraPosition(target: LatLng(39.1667, 35.6667),zoom: 14.4746,),
      
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers.toSet(),
      ),
      
      
       






      
    );
  }


}

    
*/

/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class profilPage extends StatefulWidget {
  const profilPage(this.title);

  final String title;

  @override
  State<profilPage> createState() => _profilPageState();
}

class _profilPageState extends State<profilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 252, 203),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 245, 252, 203),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 200,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(),
              ]),
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage1 extends StatefulWidget {
  const SettingsPage1() : super();

  @override
  State<SettingsPage1> createState() => _SettingsPage1State();
}

class _SettingsPage1State extends State<SettingsPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      backgroundColor: const Color(0xfff6f6f6),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: [
              _SingleSection(
                title: "General",
                children: [
                  const _CustomListTile(
                      title: "About Phone",
                      icon: CupertinoIcons.device_phone_portrait),
                    
                  _CustomListTile(
                      title: "Dark Mode",
                      icon: CupertinoIcons.moon,
                      trailing:
                          CupertinoSwitch(value: false, onChanged: (value) {})),
                  const _CustomListTile(
                      title: "System Apps Updater",
                      icon: CupertinoIcons.cloud_download),
                  const _CustomListTile(
                      title: "Security Status",
                      icon: CupertinoIcons.lock_shield),
                ],
              ),
              _SingleSection(
                title: "Network",
                children: [
                  const _CustomListTile(
                      title: "SIM Cards and Networks",
                      icon: Icons.sd_card_outlined),
                  _CustomListTile(
                    title: "Wi-Fi",
                    icon: CupertinoIcons.wifi,
                    trailing: CupertinoSwitch(value: true, onChanged: (val) {}),
                  ),
                  _CustomListTile(
                    title: "Bluetooth",
                    icon: CupertinoIcons.bluetooth,
                    trailing:
                        CupertinoSwitch(value: false, onChanged: (val) {}),
                  ),
                  const _CustomListTile(
                    title: "VPN",
                    icon: CupertinoIcons.desktopcomputer,
                  )
                ],
              ),
              const _SingleSection(
                title: "Privacy and Security",
                children: [
                  _CustomListTile(
                      title: "Multiple Users", icon: CupertinoIcons.person_2),
                  _CustomListTile(
                      title: "Lock Screen", icon: CupertinoIcons.lock),
                  _CustomListTile(
                      title: "Display", icon: CupertinoIcons.brightness),
                  _CustomListTile(
                      title: "Sound and Vibration",
                      icon: CupertinoIcons.speaker_2),
                  _CustomListTile(
                      title: "Themes", icon: CupertinoIcons.paintbrush)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget trailing;
  const _CustomListTile({Key key, this.title, this.icon, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing ?? const Icon(CupertinoIcons.forward, size: 18),
      onTap: () {},
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SingleSection({
    Key key,
    this.title,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title.toUpperCase(),
            style:
                Theme.of(context).textTheme.headline3?.copyWith(fontSize: 16),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}


*/

/*
class SettingsPage1 extends StatefulWidget {
  const SettingsPage1() : super();

  @override
  State<SettingsPage1> createState() => _SettingsPage1State();
}

class _SettingsPage1State extends State<SettingsPage1> {

*/















/*
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

class LinkPage extends StatefulWidget {
  @override
  _LinkPageState createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  var _emailController = TextEditingController();
  var _nameController = TextEditingController();
  var _controllerpassword = new TextEditingController();

  var _isObsucred = true;
  String? _selectedGender;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2005),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void insertDataChild(String? parentId) {
    String name = _nameController.text;
    String email = _emailController.text;
    String? gender = _selectedGender;
    String birthday = _selectedDate == null
        ? 'Not Selected'
        : DateFormat('dd/MM/yyyy').format(_selectedDate!);

    DatabaseReference databaseRef = FirebaseDatabase.instance.reference();
    DatabaseReference childRef = databaseRef.child('child');
    DatabaseReference newChildRef = childRef.push();

    newChildRef.set({
      'name': name,
      'email': email,
      'gender': gender,
      'birthday': birthday,
    });
    DatabaseReference parentRef =
        databaseRef.child('parents').child('parentId');
    parentRef.child('child').child(newChildRef.key!).set({
      'name': name,
      'email': email,
      'gender': gender,
      'birthday': birthday,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 127, 255, 227),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 127, 255, 227),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 200,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Create child",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Create your first child in this page ",
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 32, 29, 29)),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _controllerpassword,
                obscureText: _isObsucred,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    padding: const EdgeInsetsDirectional.only(end: 1.0),
                    icon: _isObsucred
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObsucred = !_isObsucred;
                      });
                    },
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 57, 56, 56))),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 43, 42, 42))),
                ),
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                ),
                value: _selectedGender,
                hint: Text('Select Gender'),
                onChanged: (String? value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                    value: 'Boy',
                    child: Text('Boy'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Girl',
                    child: Text('Girl'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Birthday',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 17, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        _selectedDate == null
                            ? 'Select Birthday'
                            : DateFormat('dd/MM/yyyy').format(_selectedDate!),
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Column(
                children: [
                  Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 176, 155, 155)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 0, 0, 0)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_emailController.text.isNotEmpty &&
                            _nameController.text.isNotEmpty &&
                            _controllerpassword.text.isNotEmpty &&
                            _selectedGender != null &&
                            _selectedDate != null) {
                          String? parentId;
                          insertDataChild(parentId);
                        }
                      },
                      child: Text('Save'),
                    ),
                  ),
                  SizedBox(width: 60),
                ],
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}


*/
/*
  void insertDataChild(String parentId) {
    String name = _nameController.text;
    String email = _emailController.text;
    String gender = _selectedGender;
    String birthday = _selectedDate == null
        ? 'Not Selected'
        : DateFormat('dd/MM/yyyy').format(_selectedDate);

    DatabaseReference databaseRef = FirebaseDatabase.instance.reference();
    DatabaseReference childRef = databaseRef.child('children');
    DatabaseReference newChildRef = childRef.push();

    // Set child's attributes
    newChildRef.set({
      'name': name,
      'email': email,
      'gender': gender,
      'birthday': birthday,
    });

    // Link child with parent
    DatabaseReference parentRef = databaseRef.child('parents').child(parentId);
    parentRef.child('children').child(newChildRef.key).set(true);
  }*/





  /*import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class profilPage extends StatefulWidget {
  const profilPage(this.title);

  final String title;

  @override
  State<profilPage> createState() => _profilPageState();
}

class _profilPageState extends State<profilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 252, 203),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 245, 252, 203),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 200,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(),
              ]),
        ),
      ),
    );
  }
}








*/

/*






import 'package:flutter/material.dart';






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
              onPressed: () => confirmSignOut(context, auth),
              icon: Icon(Icons.logout))
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 8, bottom: 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                buildItems(context),
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.contact_support_sharp),
                    onPressed: () {},
                  ),
                  trailing: Text(
                    'Developed by Jordy-Hershel',
                    style: TextStyle(color: Colors.redAccent, fontSize: 12),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed,
      child: Container(
        height: 55,
        margin: EdgeInsets.symmetric(
          horizontal: 10,
        ).copyWith(
          bottom: 20,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 25,
            ),
            SizedBox(width: 15),
            Text(
              text ?? '',
              style: TextStyles.body,
            ),
            Spacer(),
            if (hasNavigation)
              Icon(
                LineAwesomeIcons.alternate_arrow_circle_right,
                size: 25,
              ),
          ],
        ),
      ),
    );
  }
}







  Widget buildItems(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          ProfileListItem(
            icon: LineAwesomeIcons.history,
            onPressed: () {},
            text: 'Update profile',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.language,
            onPressed: () {
              
            },
            text: 'Change language',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.moon,
            onPressed: () {},
            text: 'Dark mode',
          ),
          ProfileListItem(
            icon: LineAwesomeIcons.user_shield,
            onPressed: () {
             
            },
            text: 'Contact us',
          ),
        ],
      ),
    );
  }


*/





/*
  Future<void> _signOut(BuildContext context, AuthBase auth) async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> confirmSignOut(BuildContext context, AuthBase auth) async {
    final didRequestSignOut = await showAlertDialog(context,
        title: 'Logout',
        content: 'Are you sure you want to log out?',
        defaultActionText: 'Logout',
        cancelActionText: 'Cancel');
    if (didRequestSignOut == true) {
      await _signOut(context, auth);
      Navigator.of(context).pop();
    }
  }
*/





/*



import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp();

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
       debugShowCheckedModeBanner:false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget();

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
  
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 61, 25, 22),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Color.fromARGB(255, 12, 42, 13),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Color.fromARGB(255, 36, 11, 41),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

*/





/*

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/Addchild_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChildrenPage('Delete and Add Child'),
    );
  }
}

class ChildrenPage extends StatefulWidget {
  const ChildrenPage(this.title);

  final String title;

  @override
  State<ChildrenPage> createState() => _ChildrenPageState();
}

class _ChildrenPageState extends State<ChildrenPage> {
  Query childrenRef = FirebaseDatabase.instance.ref().child('child');
  TextEditingController _searchController = TextEditingController();
  late String _searchQuery;

  @override
  void initState() {
    super.initState();
    _searchQuery = '';
  }

  Widget listItem({required Map child}) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Color.fromARGB(255, 249, 157, 157),
      child: ListTile(
        title: Text(
          child['name'],
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              child['email'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              child['birthday'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        trailing: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.delete,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'Search child',
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete and add child'),
      ),
      body: Column(
        children: [
          buildSearchBar(),
          Expanded(
            child: Container(
              height: double.infinity,
              child: FirebaseAnimatedList(
                query: childrenRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  Map child = snapshot.value as Map;
                  child['key'] = snapshot.key;

                  // Apply search filter
                  if (_searchQuery.isNotEmpty &&
                      !child['name']
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase())) {
                    return Container();
                  }

                  return listItem(child: child);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddChild_Page()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/












/*
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/children_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

class PlacesPage extends StatefulWidget {
  const PlacesPage(this.title);

  final String title;

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  final Completer<GoogleMapController> _controller = Completer();

  List<Marker> allmarkers = [];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    Childrenloc.forEach((element) {
      allmarkers.add(Marker(
        markerId: MarkerId(element.Name),
        draggable: false,
        infoWindow: InfoWindow(title: element.Name, snippet: element.Email),
        position: element.locationCoords,
      ));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }



ChildrenlocList(index){
  return AnimatedBuilder(animation: _pageController,
   builder: (BuildContext context, Widget widget ){
   double value =1;
   if(_pageController.position.haveDimensions ){
    value=_pageController.page - index;
    value=(1 - (value.abs() * 0.3) + 0.06 ).clamp(0.0, 1.0)
   }    
   return Center(
     child: SizedBox(
     height: Curves.easeInOut.transform(value) - 125.0,
     width: Curves.easeInOut.transform(value) - 350.0 ,
     child: widget,


     ),


   );

   },
   child: InkWell(

    onTap: (){},
    child: Stack(
      children: [
       Center(
        child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10.0,vertical: 20.0,
        ),
        height: 125.0,
        width: 275.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow:[BoxShadow(
            color: Colors.black54,
            offset: Offset(0.0, 4.0),
            blurRadius: 10.0,
          ),]
        ), 

        child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white
    ),
    child: Row(
   children: [
Container(
  height: 90.0,
  width: 90.0,
  decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0)
   topLeft:  Radius.circular(10.0),
  ),
  
  ),
SizedBox(width:5.0),
Colmun(
  MainAxisAlignment:MainAxisAlignment.spaceEvenly,
  CrossAxisAlignment:CrossAxisAlignment.start,
  children:[
    Text
  ]
)
),
  
   ],


    ),


        ),



        ),






       ),
      ],
    
    
    
    ),


   ),
   
   
   );
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: const CameraPosition(
                target: LatLng(39.1667, 35.6667),
                zoom: 14.4746,
              ),
              markers: Set.from(allmarkers),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Positioned(
            bottom: 20.0,
            child: Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: _pageController, 
                itemBuilder: (BuildContext context,int index){
                   return ChildrenlocList(index);

                } ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
*/





/*

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnimProps>()
      ..add(AnimProps.opacity, 0.0.tweenTo(1.0), 500.milliseconds)
      ..add(AnimProps.translateY, (-30.0).tweenTo(0.0), 500.milliseconds,  Curves.easeOut);

    return PlayAnimation<MultiTweenValues<AnimProps>>(
      delay: 500.milliseconds * delay,
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(AnimProps.opacity),
        child: Transform.translate(
          offset: Offset(0, animation.get(AnimProps.translateY)),
          child: child,
        ),
      ),
    );
  }
}

enum AnimProps { opacity, translateY }*/














































/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/NavigationBar.dart';
import 'package:flutter_application_1/animation/FadeAnimation.dart';
import 'package:flutter_application_1/services.dart/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerpassword = TextEditingController();
  final TextEditingController _controlleremail = TextEditingController();

  final navigatorKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';
  bool login = false;
  late String uid = '';

  late String errorMessage;
/*
  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _controlleremail.text, password: _controllerpassword.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
    }
  }
*/
  @override
  void dispose() {
    _controlleremail.dispose();
    _controllerpassword.dispose();
    super.dispose();
  }

  late var _isObsucred;

  @override
  void initState() {
    super.initState();
    _isObsucred = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FadeAnimation(
                          1,
                          Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.2,
                          Text(
                            "Login to your account",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(
                            1.2,
                            makeInput(
                              label: "Email",
                            ),
                          ),
                          FadeAnimation(
                            1.3,
                            makeInput1(
                              label: "Password",
                              TextEditingController: _controllerpassword,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FadeAnimation(
                      1.4,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            border: Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                              signIn(uid);
                              if (uid.isNotEmpty)
                                await {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NavigationPage(),
                                    ),
                                  ),
                                };
                            },
                            minWidth: double.infinity,
                            height: 60,
                            color: Color.fromARGB(255, 169, 180, 175),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      1.4,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            border: Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                              signInWithGoogle();
                            },
                            minWidth: double.maxFinite,
                            height: 60,
                            color: Color.fromARGB(255, 238, 215, 138),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              "google",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput(
      {required label,
      obscureText = false,
      TextEditingController? TextEditingController}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: _controlleremail,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color.fromARGB(255, 57, 56, 56))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 43, 42, 42))),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget makeInput1(
      {required label,
      obscureText = false,
      TextEditingController? TextEditingController}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          onChanged: (value) {
            setState(() {});
          },
          controller: _controllerpassword,
          obscureText: _isObsucred,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              padding: const EdgeInsetsDirectional.only(end: 1.0),
              icon: _isObsucred
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isObsucred = !_isObsucred;
                });
              },
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color.fromARGB(255, 57, 56, 56))),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 43, 42, 42))),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Future<void> signIn(uid) async {
    try {
      var res = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _controlleremail.text.trim(),
        password: _controllerpassword.text.trim(),
      );

      uid = res.user?.uid;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid', uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
*/







/*
  Future<void> sendLocation() async {
    Location location = Location();
    double latitude, longitude;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var childId = prefs.getString('childId');

    location.onLocationChanged.listen((LocationData currentLocation) {
      latitude = currentLocation.latitude!.toDouble();
      longitude = currentLocation.longitude!.toDouble();
      firestore
          .collection('children')
          .doc(childId)
          .update({'position': GeoPoint(latitude, longitude)});
      print('long = $longitude');
    });
  }

  void getChildData(child) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var childId = prefs.getString('childId');

    await firestore.collection('children').doc(childId).get().then((value) {
      child = value.data();
    });
  }

*/




/*
  Widget _drawer() => Drawer(
        child: ListView(
          children: _menuItems
              .map((item) => ListTile(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    title: Text(item),
                  ))
              .toList(),
        ),
      );



  Widget _navBarItems() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _menuItems
            .map(
              (item) => InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LinkPage()));
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
}

final List<String> _menuItems = <String>[
  'About',
  'Contact',
  'Settings',
  'Sign Out',
];*/










/*
  void insertDataChild(String? parentId) async {
    String name = _nameController.text;
    String email = _emailController.text;
    String? gender = _selectedGender;
    String birthday = _selectedDate == null
        ? 'Not Selected'
        : DateFormat('dd/MM/yyyy').format(_selectedDate!);

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    
   CollectionReference childrenCollection =
    firestore.collection('parents/$parentId/children');

    DocumentReference childDoc = childRef.doc();
    String childId = childDoc.id;

    Map<String, dynamic> childData = {
      'childId': childId,
      'parentId':
          parentId ?? '', // Provide a default empty value if parentId is null
      'name': name,
      'email': email,
      'gender': gender,
      'birthday': birthday,
    };

    await childDoc.set(childData);
  }

  void insertDataChild() async {
    String name = _nameController.text;
    String email = _emailController.text;
    String? gender = _selectedGender;
    String birthday = _selectedDate == null
        ? 'Not Selected'
        : DateFormat('dd/MM/yyyy').format(_selectedDate!);

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference parentsCollection = firestore.collection('parents');

    DocumentReference parentDoc = parentsCollection.doc();
    String parentId = parentDoc.id;

    CollectionReference childrenCollection =
        parentsCollection.doc(parentId).collection('children');

    DocumentReference childDoc = childrenCollection.doc();
    String childId = childDoc.id;

    Map<String, dynamic> childData = {
      'childId': childId,
      'parentId': parentId,
      'name': name,
      'email': email,
      'gender': gender,
      'birthday': birthday,
    };

    await childDoc.set(childData);
  }*/

/*
void insertDataChild(String parentId, String name, String email, String gender, DateTime selectedDate) async {
  String birthday = selectedDate == null
      ? 'Not Selected'
      : DateFormat('dd/MM/yyyy').format(selectedDate);

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference parentsCollection = firestore.collection('parents');
  DocumentReference parentDoc = parentsCollection.doc(parentId);

  CollectionReference childrenCollection = parentDoc.collection('children');

  DocumentReference childDoc = childrenCollection.doc();
  String childId = childDoc.id;

  Map<String, dynamic> childData = {
    'childId': childId,
    'name': name,
    'email': email,
    'gender': gender,
    'birthday': birthday,
    'parentId': parentId,
  };

  await childDoc.set(childData);
}
*/
/*

  void insertDataChild(String? parentId) async {
    String name = _nameController.text;
    String email = _emailController.text;
    String? gender = _selectedGender;
    String birthday = _selectedDate == null
        ? 'Not Selected'
        : DateFormat('dd/MM/yyyy').format(_selectedDate!);

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference parentsCollection = firestore.collection('parents');
    DocumentReference parentDoc;

    if (parentId != null) {
      parentDoc = parentsCollection.doc(parentId);
    } else {
      parentDoc = parentsCollection.doc();
      parentId = parentDoc.id;
    }

    CollectionReference childrenCollection = parentDoc.collection('children');

    DocumentReference childDoc = childrenCollection.doc();
    String childId = childDoc.id;

    Map<String, dynamic> childData = {
      'childId': childId,
      'name': name,
      'email': email,
      'gender': gender,
      'birthday': birthday,
      'parentId': parentId, // Use the parent ID as the value
    };

    await childDoc.set(childData);
  }
  */

  // void insertDataChild(String? parentId) async {
  //   String name = _nameController.text;
  //   String email = _emailController.text;
  //   String? gender = _selectedGender;
  //   String birthday = _selectedDate == null
  //       ? 'Not Selected'
  //       : DateFormat('dd/MM/yyyy').format(_selectedDate!);

  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   final String uid = widget.uid;
  //   CollectionReference parentsCollection = firestore.collection('parents');
  //   // DocumentReference parentDoc;

  //   // if (parentId != null) {
  //   //   parentDoc = parentsCollection.doc(parentId);
  //   // } else {
  //   //   parentDoc = parentsCollection.doc();
  //   //   parentId = parentDoc.id;
  //   // }

  //   CollectionReference childrenCollection = firestore.collection('children');

  //   DocumentReference childDoc = childrenCollection.doc();
  //   String childId = childDoc.id;

  //   Map<String, dynamic> childData = {
  //     'childId': childId,
  //     'name': name,
  //     'email': email,
  //     'gender': gender,
  //     'birthday': birthday,
  //     'parentId': parentId, // Use the parent ID as the value
  //   };

  //   await childDoc.set(childData);
  // }




  /*
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/Addchild_Page.dart';

class ChildrenPage extends StatefulWidget {
  @override
  State<ChildrenPage> createState() => _ChildrenPageState();
}

class _ChildrenPageState extends State<ChildrenPage> {
  CollectionReference childrenRef =
      FirebaseFirestore.instance.collection('children');
  TextEditingController _searchController = TextEditingController();
  late String _searchQuery;
  dynamic children = [];
  String? uid;
  void getChildren() async {
    children = await childrenRef.where('parentId', isEqualTo: uid);
    if (mounted) {
      setState(() {
        // Update the state only if the widget is still in the tree
        children = children;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _searchQuery = '';
    _loadUid();
  }

  void _loadUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      uid = prefs.getString('uid') ?? '';
      print("0000000000000000000000000000000000");
      print(uid);
      print("SoSo0000000000000000000000000000000000");
      childrenRef = FirebaseFirestore.instance
          .collection('parents')
          .doc(uid)
          .collection('children');
      getChildren();
    });
  }

  Widget listItem({required DocumentSnapshot childSnapshot}) {
    Map<String, dynamic> child = childSnapshot.data()! as Map<String, dynamic>;
    child['key'] = childSnapshot.id;

    return Card(
      margin: const EdgeInsets.all(10),
      color: const Color.fromARGB(255, 249, 157, 157),
      child: ListTile(
        title: Text(
          childSnapshot['name'],
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              childSnapshot['email'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 5),
            Text(
              childSnapshot['birthday'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        trailing: GestureDetector(
          onTap: () {
            deleteChild(childSnapshot.id);
          },
          child: Icon(
            Icons.delete,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'Search child',
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
      ),
    );
  }

  void deleteChild(String childId) {
    childrenRef.doc(childId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete and add child'),
      ),
      body: Column(
        children: [
          buildSearchBar(),
          Expanded(
            child: Container(
              height: double.infinity,
              child: StreamBuilder<QuerySnapshot>(
                stream: childrenRef.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  List<QueryDocumentSnapshot> children = snapshot.data!.docs;

                  // Apply search filter
                  if (_searchQuery.isNotEmpty) {
                    children = children.where((doc) {
                      Map<String, dynamic> child =
                          doc.data()! as Map<String, dynamic>;
                      return child['name']
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase());
                    }).toList();
                  }

                  return ListView.builder(
                    itemCount: children.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot childSnapshot = children[index];
                      return listItem(childSnapshot: childSnapshot);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddChild_Page()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/

/*

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/Addchild_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChildrenPage('Delete and Add Child'),
    );
  }
}

class ChildrenPage extends StatefulWidget {
  const ChildrenPage(this.title);

  final String title;

  @override
  State<ChildrenPage> createState() => _ChildrenPageState();
}

class _ChildrenPageState extends State<ChildrenPage> {
  CollectionReference childrenRef =
      FirebaseFirestore.instance.collection('children');
  TextEditingController _searchController = TextEditingController();
  late String _searchQuery;
  dynamic children = [];

  void getChildren() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var uid = prefs.getString('uid');

    children = await childrenRef.where('parentId', isEqualTo: uid);
  }

  @override
  void initState() {
    super.initState();
    _searchQuery = '';
    getChildren();
  }

  Widget listItem({required DocumentSnapshot childSnapshot}) {
    Map<String, dynamic> children =
        childSnapshot.data()! as Map<String, dynamic>;
    children['childId'] = childSnapshot.id;

    return Card(
      margin: const EdgeInsets.all(10),
      color: const Color.fromARGB(255, 249, 157, 157),
      child: ListTile(
        title: Text(
          children['name'],
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              children['email'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 5),
            Text(
              children['birthday'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        trailing: GestureDetector(
          onTap: () {
            deleteChild(childSnapshot.id);
          },
          child: Icon(
            Icons.delete,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'Search child',
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
      ),
    );
  }

  void deleteChild(String childId) {
    childrenRef.doc(childId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete and add child'),
      ),
      body: Column(
        children: [
          buildSearchBar(),
          Expanded(
            child: Container(
              height: double.infinity,
              child: StreamBuilder<QuerySnapshot>(
                stream: childrenRef.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  List<QueryDocumentSnapshot> children = snapshot.data!.docs;

                  // Apply search filter
                  if (_searchQuery.isNotEmpty) {
                    children = children.where((doc) {
                      Map<String, dynamic> children =
                          doc.data()! as Map<String, dynamic>;
                      return children['name']
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase());
                    }).toList();
                  }

                  return ListView.builder(
                    itemCount: children.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot childSnapshot = children[index];
                      return listItem(childSnapshot: childSnapshot);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddChild_Page()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/








 // void insertDataChild(String? parentId) {
  //   String name = _nameController.text;
  //   String email = _emailController.text;
  //   String? gender = _selectedGender;
  //   String birthday = _selectedDate == null
  //       ? 'Not Selected'
  //       : DateFormat('dd/MM/yyyy').format(_selectedDate!);

  //   FirebaseFirestore firestore = FirebaseFirestore.instance;

  //   CollectionReference childRef = firestore.collection('child');
  //   DocumentReference newChildRef = childRef.doc();

  //   newChildRef.set({
  //     'name': name,
  //     'email': email,
  //     'gender': gender,
  //     'birthday': birthday,
  //   });

  //   DocumentReference parentRef = firestore.collection('parents').doc(parentId);
  //   parentRef.collection('child').doc(newChildRef.id).set({
  //     'name': name,
  //     'email': email,
  //     'gender': gender,
  //     'birthday': birthday,
  //   });
  // }

  // void insertDataChild(String parentId) {
  //   String name = _nameController.text;
  //   String email = _emailController.text;
  //   String gender = _selectedGender;
  //   String birthday = _selectedDate == null
  //       ? 'Not Selected'
  //       : DateFormat('dd/MM/yyyy').format(_selectedDate);

  //   DatabaseReference databaseRef = FirebaseDatabase.instance.reference();
  //   DatabaseReference childRef = databaseRef.child('children');
  //   DatabaseReference newChildRef = childRef.push();

  //   // Set child's attributes
  //   newChildRef.set({
  //     'name': name,
  //     'email': email,
  //     'gender': gender,
  //     'birthday': birthday,
  //   });

  //   // Link child with parent
  //   DatabaseReference parentRef = databaseRef.child('parents').child(parentId);
  //   parentRef.child('children').child(newChildRef.key).set(true);
  // }





  




/*

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/settings.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ContactUs.dart';
import '../aboutUs.dart';

// ignore: must_be_immutable
class Permission1 extends StatefulWidget {
  late String childId;
  Permission1();

  @override
  State<Permission1> createState() => _Permission1State();
}

class _Permission1State extends State<Permission1> {
  Location location = Location();

  bool _serviceEnabled = false;

  PermissionStatus? _permissionGranted;

  late Map<String, dynamic> child; // Assuming data is null

  @override
  void initState() {
    checkLocationServicesInDevice();
    getChildData(child);

    super.initState;
  }

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
          backgroundColor: Colors.transparent,
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
                  'name',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
            )
          ],
        ),
        drawer: isLargeScreen ? null : _drawer(),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                child['name'],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 5),
              Text(
                child['email'],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 5),
              Text(
                child['birthday'],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 5),
              Text(
                child['gender'],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
                        } else if (item == 'Settings') {
                          return const SettingsPage();
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
                      return AboutUsPage();
                    } else if (item == 'Contact') {
                      return ContactUsPage();
                    } else if (item == 'Settings') {
                      return const SettingsPage();
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

  Future<void> checkLocationServicesInDevice() async {
    Location location = Location();

    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      location.onLocationChanged.listen((LocationData currentLocation) {
        print('::::::::::::::::::::');
        print(currentLocation.latitude.toString() +
            " " +
            currentLocation.longitude.toString());
        sendLocation(location);
      });
    }

    _permissionGranted = await location.hasPermission();

    if (_permissionGranted != PermissionStatus.granted) {
      _permissionGranted = await location.requestPermission();

      location.onLocationChanged.listen((LocationData currentLocation) {
        print('::::::::::::::::::::');
        print(currentLocation.latitude.toString() +
            " " +
            currentLocation.longitude.toString());
        sendLocation(location);
      });

      if (_permissionGranted == PermissionStatus.granted) {
        location.onLocationChanged.listen((LocationData currentLocation) {
          print('::::::::::::::::::::');
          print(currentLocation.latitude.toString() +
              " " +
              currentLocation.longitude.toString());
          sendLocation(location);
        });

        print('send location::::::::::::::::::::');
      } else {
        print("Location permission denied");
      }
    }
  }

  Future<void> sendLocation(Location location) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var childId = prefs.getString('childId');

    location.onLocationChanged.listen((LocationData currentLocation) {
      print('::::::::::::::::::::');
      currentLocation.latitude!.toDouble();

      print('::::::::::::::::::::2');
      currentLocation.longitude!.toDouble();
      print('lat = ${currentLocation.latitude!.toDouble()}');
      print('long = ${currentLocation.longitude!.toDouble()}');
      print('::::::::::::::::::::3');
      firestore.collection('children').doc(childId).update({
        'position': GeoPoint(currentLocation.latitude!.toDouble(),
            currentLocation.longitude!.toDouble())
      });

      print('::::::::::::::::::::4');
      print('lat = ${currentLocation.latitude!.toDouble()}');
      print('long = ${currentLocation.longitude!.toDouble()}');
    }, onError: (err) {
      print('error:::::::::: ${err}');
    });
  }

  void getChildData(child) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var childId = prefs.getString('childId');

    await firestore.collection('children').doc(childId).get().then((value) {
      child = value.data();
      var name = child["name"];
      var gender = child["gender"];
      var email = child["email"];
      var birthday = child["birthday"];
      if (child != null) {
        print(name);
      } else {
        print("Data is null");
      }
    });
  }
}










/**
 Future<void> sendLocation() async {
  Location location = Location();
  double latitude, longitude;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var childId = prefs.getString('childId');

  location.onLocationChanged.listen((LocationData currentLocation) {
    latitude = currentLocation.latitude!.toDouble();
    longitude = currentLocation.longitude!.toDouble();
    firestore
        .collection('children')
        .doc(childId)
        .update({'position': GeoPoint(latitude, longitude)});
    print('long = ${longitude}');
  });


}
 */
*/


























/***
 * 
 * 
 * 
 * 




hadi ta3 login nnnnnnnnnnnnnnnnnnnnnnnnnnnnn









/*
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerpassword = TextEditingController();
  final TextEditingController _controlleremail = TextEditingController();

  final navigatorKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';
  bool login = false;
  late String uid = '';

  late String errorMessage;

  @override
  void dispose() {
    _controlleremail.dispose();
    _controllerpassword.dispose();
    super.dispose();
  }

  // ignore: prefer_typing_uninitialized_variables
  late var _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const FadeAnimation(
                        1,
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                        1.2,
                        Text(
                          "Login to your account",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                          1.2,
                          makeInput(
                            label: "Email",
                          ),
                        ),
                        FadeAnimation(
                          1.3,
                          makeInput1(
                            label: "Password",
                            controller: _controllerpassword,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FadeAnimation(
                    1.4,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(color: Colors.black),
                        ),
                        child: MaterialButton(
                          onPressed: () async {
                            await signIn();
                            await Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NavigationPage(),
                              ),
                            );
                          },
                          minWidth: double.infinity,
                          height: 60,
                          color: const Color.fromARGB(255, 169, 180, 175),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1.4,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(color: Colors.black),
                        ),
                        child: MaterialButton(
                          onPressed: () async {
                            await signInWithGoogle(uid);
                          },
                          minWidth: double.maxFinite,
                          height: 60,
                          color: const Color.fromARGB(255, 238, 215, 138),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Text(
                            "Google",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeInput({required String label, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 57, 56, 56)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 43, 42, 42)),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget makeInput1(
      {required String label, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          onChanged: (value) {
            setState(() {});
          },
          controller: controller,
          obscureText: _isObscured,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              padding: const EdgeInsetsDirectional.only(end: 1.0),
              icon: _isObscured
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 57, 56, 56)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 43, 42, 42)),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Future<void> signIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _controlleremail.text.trim(),
        password: _controllerpassword.text.trim(),
      );

      String uid = userCredential.user!.uid;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid', uid);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NavigationPage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: avoid_print
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // ignore: avoid_print
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> signInWithGoogle(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: unused_local_variable
    var uid = prefs.getString('uid');
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? user = userCredential.user;
      if (user != null) {
        String uid = user.uid;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('uid', uid);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      Toast.show('Failed to sign in with Google');
    }
  }
}
*/




















 */















/*

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages.dart/firstchild.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late String uid = '';
  late String childId = '';
  final _controllerName = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  var _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.indigo,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 200,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create an account, It's free",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  makeInput(
                    label: "Email",
                    controller: _controllerEmail,
                  ),
                  makeInput(
                    label: "Name",
                    controller: _controllerName,
                  ),
                  makeInput(
                    label: "Password",
                    controller: _controllerPassword,
                    obscureText: _isObscured,
                    isObscureToggle: true,
                  ),
                ],
              ),
              Column(
                children: [
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      if (_controllerName.text.isNotEmpty &&
                          _controllerEmail.text.isNotEmpty &&
                          _controllerPassword.text.isNotEmpty) {
                        signUp(uid);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LinkPage(
                              uid: uid,
                              childId: childId,
                            ),
                          ),
                        );
                      }
                    },
                    color: Colors.indigo,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have an account?"),
                  Text(
                    " Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
    bool isObscureToggle = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: isObscureToggle
                ? IconButton(
                    padding: const EdgeInsetsDirectional.only(end: 1.0),
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 57, 56, 56),
              ),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 43, 42, 42),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Future<void> signUp(String uid) async {
    try {
      var res = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _controllerEmail.text.trim(),
        password: _controllerPassword.text.trim(),
      );
      uid = res.user!.uid;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid', uid);

      if (res.user != null) {
        createParent(
          _controllerName.text,
          _controllerEmail.text.trim(),
          _controllerPassword.text.trim(),
          res.user!.uid,
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}

Future<void> createParent(
  String name,
  String email,
  String password,
  String uid,
) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference parentsCollection = firestore.collection('parents');

  Map<String, dynamic> parentData = {
    'name': name,
    'email': email,
    'password': password,
  };

  await parentsCollection.doc(uid).set(parentData);
}
*/




















































/*

hadi ta3 lpermission lversion lakhra 




/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/settings.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ContactUs.dart';
import 'aboutUs.dart';

// ignore: must_be_immutable
class Permission1 extends StatefulWidget {
  Permission1();

  @override
  State<Permission1> createState() => _Permission1State();
}

class _Permission1State extends State<Permission1> {
  Location location = Location();

  bool _serviceEnabled = false;

  dynamic child;

  PermissionStatus? _permissionGranted;

  @override
  void initState() {
    super.initState();
    checkLocationServicesInDevice();
    child = getChildData(child);
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
          backgroundColor: Colors.transparent,
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
                  'name',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Text(
                child?['name'],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 5),
              Text(
                child?['email'],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 5),
              Text(
                child?['birthday'],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 5),
              Text(
                child?['gender'],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
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
                        } else if (item == 'Settings') {
                          return const SettingsPage();
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
                      return AboutUsPage();
                    } else if (item == 'Contact') {
                      return ContactUsPage();
                    } else if (item == 'Settings') {
                      return const SettingsPage();
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

  Future<void> checkLocationServicesInDevice() async {
    Location location = Location();

    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      location.onLocationChanged.listen((LocationData currentLocation) {
        print('::::::::::::::::::::');
        print('${currentLocation.latitude} ${currentLocation.longitude}');
        sendLocation(location);
      });
    }

    _permissionGranted = await location.hasPermission();

    if (_permissionGranted != PermissionStatus.granted) {
      _permissionGranted = await location.requestPermission();
      location.onLocationChanged.listen((LocationData currentLocation) {
        print('::::::::::::::::::::');
        print('${currentLocation.latitude} ${currentLocation.longitude}');
        sendLocation(location);
      });
    }

    if (_permissionGranted == PermissionStatus.granted) {
      //location.enableBackgroundMode(enable: true);
      location.onLocationChanged.listen((LocationData currentLocation) {
        print('::::::::::::::::::::');
        print('${currentLocation.latitude} ${currentLocation.longitude}');
        sendLocation(location);
      });
      print('send location::::::::::::::::::::');
      location.onLocationChanged.listen((LocationData currentLocation) {
        print('::::::::::::::::::::');
        print('${currentLocation.latitude} ${currentLocation.longitude}');
        sendLocation(location);
      });
      print('send location::::::::::::::::::::');
    } else {
      print("Location permission denied");
    }
  }

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
  }

  Future<dynamic> getChildData(child) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var childId = prefs.getString('childId');

    await firestore.collection('children').doc(childId).get().then((value) {
      child = value.data();
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
    return child;
  }
}
*/




















*/

