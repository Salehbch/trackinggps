import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/AddPlace_Page.dart';

class PlaceListPage1 extends StatelessWidget {
  const PlaceListPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PlaceListPage('Delete and Add place'),
    );
  }
}

class PlaceListPage extends StatefulWidget {
  const PlaceListPage(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  State<PlaceListPage> createState() => _PlaceListPageState();
}

class _PlaceListPageState extends State<PlaceListPage> {
  CollectionReference placesRef =
      FirebaseFirestore.instance.collection('places');
  final TextEditingController _searchController = TextEditingController();
  late String _searchQuery;

  @override
  void initState() {
    super.initState();
    _searchQuery = '';
  }

  Widget listItem({required DocumentSnapshot placeSnapshot}) {
    Map<String, dynamic> place = placeSnapshot.data()! as Map<String, dynamic>;
    place['key'] = placeSnapshot.id;

    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.blueAccent,
      child: ListTile(
        title: Text(
          place['name'],
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              place['type'],
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const SizedBox(height: 5),
          ],
        ),
        trailing: GestureDetector(
          onTap: () {
            deleteplace(placeSnapshot.id);
          },
          child: Icon(
            Icons.delete,
            color: Colors.white70,
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
          hintText: 'Search place',
        ),
        onChanged: (value) {
          if (mounted) {
            setState(() {
              _searchQuery = value;
            });
          }
        },
      ),
    );
  }

  void deleteplace(String placeId) {
    placesRef.doc(placeId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete and add place'),
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          buildSearchBar(),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: StreamBuilder<QuerySnapshot>(
                stream: placesRef.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: const CircularProgressIndicator());
                  }

                  List<QueryDocumentSnapshot> places = snapshot.data!.docs;

                  // Apply search filter
                  if (_searchQuery.isNotEmpty) {
                    places = places.where((doc) {
                      Map<String, dynamic> child =
                          doc.data()! as Map<String, dynamic>;
                      return child['name']
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase());
                    }).toList();
                  }

                  return ListView.builder(
                    itemCount: places.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot placeSnapshot = places[index];
                      return listItem(placeSnapshot: placeSnapshot);
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
              MaterialPageRoute(builder: (context) => const MapsPage('title')));
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
