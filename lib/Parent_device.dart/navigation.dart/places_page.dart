import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/setget.dart/getChildData.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

//hada li fih ta3 les cartes

class PlacesPage extends StatefulWidget {
  const PlacesPage(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  late GoogleMapController _controller;

  List<Marker> allmarkers = [];

  late PageController _pageController;
  late int prevPage = 0;

  var children;

  void getChildren() async {
    children = await getChildData();
  }

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
          if (ChildrenModelList[index].position.latitude != 0 &&
              ChildrenModelList[index].position.longitude != 0) {
            moveCamera();
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('This child is not connected in his device\n '),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                height: 125.0,
                width: 275.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
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
                    color: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 24.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ChildrenModelList[index].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ChildrenModelList[index].email,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 170.0,
                            child: Text(
                              ChildrenModelList[index].gender,
                              style: const TextStyle(
                                color: Colors.white,
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
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              target: LatLng(35.1667, 7.6667),
              zoom: 1,
            ),
            markers: Set.from(allmarkers),
            onMapCreated: (GoogleMapController controller) {
              _controller =
                  controller; // Assign the controller to the _controller field.
            },
          ),
          Positioned(
            bottom: 20.0,
            child: SizedBox(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: _pageController,
                itemCount: ChildrenModelList.length,
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
          target: ChildrenModelList[_pageController.page!.toInt()].position,
          zoom: 14.0,
          bearing: 45.0,
          tilt: 45.0,
        ),
      ),
    );
  }

  Future<void> _loadChildren() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var parentId = prefs.getString('uid');

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('children')
        .where('parentId', isEqualTo: parentId)
        .get();

    if (mounted)
      setState(() {
        allmarkers.clear();
        ChildrenModelList.clear();

        snapshot.docs.forEach((DocumentSnapshot document) async {
          var data = document.data() as Map<String, dynamic>?;

          print(data);

          if (data != null) {
            var childId = document.id;
            var childName = data['name'] ?? '';
            var childEmail = data['email'] ?? '';
            var childGender = data['gender'] ?? '';
            GeoPoint position = data['position'] ?? const GeoPoint(0, 0);

            if (position.latitude.isFinite && position.longitude.isFinite) {
              var latitude = position.latitude;
              var longitude = position.longitude;
              var element = ChildrenModel(
                name: childName,
                email: childEmail,
                gender: childGender,
                position: LatLng(latitude, longitude),
              );

              allmarkers.add(
                Marker(
                  markerId: MarkerId(childId),
                  draggable: false,
                  infoWindow: InfoWindow(
                    title: childName,
                    snippet: childEmail,
                  ),
                  position: element.position,
                ),
              );

              ChildrenModelList.add(element);
            }
            // }
          }
        });
      });
  }
}

class ChildrenModel {
  final String name;
  final String email;
  final String gender;
  final LatLng position;

  ChildrenModel({
    required this.name,
    required this.email,
    required this.gender,
    required this.position,
  });

  factory ChildrenModel.fromSnapshot(DocumentSnapshot document) {
    var data = document.data() as Map<String, dynamic>?;

    if (data != null) {
      return ChildrenModel(
        name: data['name'] ?? '',
        email: data['email'] ?? '',
        gender: data['gender'] ?? '',
        position: LatLng(data['Latitude'] ?? 0.0, data['Longitude'] ?? 0.0),
      );
    } else {
      return ChildrenModel(
        name: '',
        email: '',
        gender: '',
        position: const LatLng(0.0, 0.0),
      );
    }
  }
}

// ignore: non_constant_identifier_names
List<ChildrenModel> ChildrenModelList = [];
