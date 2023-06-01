import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/setget.dart/getChildData.dart';
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/Addchild_Page.dart';

class ChildrenPage1 extends StatelessWidget {
  const ChildrenPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ChildrenPage('Delete and Add Child'),
    );
  }
}

class ChildrenPage extends StatefulWidget {
  const ChildrenPage(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  State<ChildrenPage> createState() => _ChildrenPageState();
}

class _ChildrenPageState extends State<ChildrenPage> {
  CollectionReference childrenRef =
      FirebaseFirestore.instance.collection('children');
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  List<QueryDocumentSnapshot> children = [];

  List<QueryDocumentSnapshot> filteredChildren = [];
  //
  // children.where((doc) => true).toList();
// Map<String, dynamic> childData = doc.data()! as Map<String, dynamic>;
  void getChildren() async {
    children = await getChildData();
    //
    children.map((doc) => doc.data() as Map<String, dynamic>).toList();
    filteredChildren = children.where((doc) {
      return true;
    }).toList();

    print(filteredChildren);
  }

  @override
  void initState() {
    getChildren();
    _searchQuery = '';
    super.initState();
  }

  Widget listItem({required QueryDocumentSnapshot childSnapshot}) {
    Map<String, dynamic> childData =
        childSnapshot.data()! as Map<String, dynamic>;
    childData['childId'] = childSnapshot.id;

    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.blueAccent,
      child: ListTile(
        onLongPress: () {
          Clipboard.setData(ClipboardData(text: childSnapshot.id));
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(
                      'you have copied the ID\n:${childSnapshot.id} \n of your child :${childData['name']}'),
                );
              });
        },
        title: Text(
          childData['name'],
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              childData['email'],
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              childData['birthday'],
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const SizedBox(height: 5),
            Text(
              childSnapshot.id,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ],
        ),
        trailing: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(' You are sure to delete this child??:\n'),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              deleteChild(childSnapshot.id);
                              Navigator.of(context).pop();
                            },
                            child: Text('Yes'),
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('No'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Icon(
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
          hintText: 'Search child',
        ),
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
            filteredChildren = children;

            // Apply search filter
            if (_searchQuery.isNotEmpty) {
              filteredChildren = children.where((doc) {
                Map<String, dynamic> childData =
                    doc.data()! as Map<String, dynamic>;
                return childData['name']
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase());
              }).toList();
            }
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
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          buildSearchBar(),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: ListView.builder(
                itemCount: filteredChildren.length,
                itemBuilder: (BuildContext context, int index) {
                  QueryDocumentSnapshot childSnapshot = filteredChildren[index];
                  return listItem(childSnapshot: childSnapshot);
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
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// child: StreamBuilder<QuerySnapshot>(
//   stream: childrenRef.snapshots(),
//   builder: (BuildContext context,
//       AsyncSnapshot<QuerySnapshot> snapshot) {
//     if (snapshot.hasError) {
//       return Text('Error: ${snapshot.error}');
//     }

//     List<QueryDocumentSnapshot> filteredChildren = children;

//     // Apply search filter
//     if (_searchQuery.isNotEmpty) {
//       filteredChildren = children.where((doc) {
//         Map<String, dynamic> childData =
//             doc.data()! as Map<String, dynamic>;
//         return childData['name']
//             .toLowerCase()
//             .contains(_searchQuery.toLowerCase());
//       }).toList();
//     } else {
//       filteredChildren = children.where((doc) => true).toList();
//     }

//     return ListView.builder(
//       itemCount: filteredChildren.length,
//       itemBuilder: (BuildContext context, int index) {
//         QueryDocumentSnapshot childSnapshot =
//             filteredChildren[index];
//         return listItem(childSnapshot: childSnapshot);
//       },
//     );
//   },
// ),
