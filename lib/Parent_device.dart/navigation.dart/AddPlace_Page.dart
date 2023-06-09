import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:collection/collection.dart';

class Place {
  final String name;
  final String type;

  Place(this.name, this.type);
}

class MapsPage extends StatefulWidget {
  const MapsPage(this.title);

  final String title;

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  Completer<GoogleMapController>? _controller;
  Set<Marker> markers = {};
  Set<Circle> circles = {};
  LatLng? selectedLocation;
  double circleRadius = 200.0;
  LatLng initialLocation = const LatLng(23.762912, 90.427816);
  List<String> typeOptions = ['Safe', 'Dangerous'];

  @override
  void initState() {
    super.initState();
    _controller = Completer<GoogleMapController>();
  }

  void _addMarker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String type = typeOptions[0];
        return AlertDialog(
          title: Text('Add Place'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {},
              ),
              DropdownButtonFormField<String>(
                value: type,
                decoration: InputDecoration(labelText: 'Type'),
                items: typeOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    type = newValue!;
                  });
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (selectedLocation != null) {
                  Navigator.of(context).pop();
                  final markerId = MarkerId(DateTime.now().toString());
                  final marker = Marker(
                    markerId: markerId,
                    position: selectedLocation!,
                    infoWindow:
                        InfoWindow(title: '${circleRadius.round()} meters'),
                  );

                  setState(() {
                    markers.clear();
                    circles.clear();
                    markers.add(marker);
                    circles.add(
                      Circle(
                        circleId: CircleId(markerId.value),
                        center: selectedLocation!,
                        radius: circleRadius,
                        strokeWidth: 2,
                        fillColor: Colors.blue.shade100,
                      ),
                    );
                  });
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _onMapTap(LatLng location) {
    setState(() {
      selectedLocation = location;
    });
    _addMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: initialLocation,
                  zoom: 15.6746,
                ),
                onMapCreated: (controller) {
                  if (!_controller!.isCompleted) {
                    _controller!.complete(controller);
                  }
                },
                onTap: (location) {
                  _onMapTap(location);
                },
                markers: markers,
                circles: circles,
              ),
            ),
            Slider(
              value: circleRadius,
              min: 100.0,
              max: 1500.0,
              onChanged: (value) {
                setState(() {
                  circleRadius = value;
                  if (selectedLocation != null) {
                    _updateCircle(selectedLocation!);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateCircle(LatLng location) async {
    final controller = await _controller!.future;
    controller.animateCamera(CameraUpdate.newLatLng(location));
    final selectedMarker = markers.firstWhereOrNull(
      (marker) => marker.position == selectedLocation,
    );
    if (selectedMarker != null) {
      final updatedCircle = Circle(
        circleId: CircleId(selectedMarker.markerId.value),
        center: location,
        radius: circleRadius,
        strokeWidth: 2,
        fillColor: Color(0xFF006491).withOpacity(0.2),
      );
      setState(() {
        circles.clear();
        circles.add(updatedCircle);
      });
    }
  }
}
