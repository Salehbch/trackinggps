import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<QueryDocumentSnapshot>> getChildData() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  SharedPreferences prefs = await SharedPreferences.getInstance();

  var uid = prefs.getString('uid');

  List<QueryDocumentSnapshot> children = [];

  CollectionReference childrenCollection = firestore.collection('children');

  await childrenCollection
      .where('parentId', isEqualTo: uid)
      .get()
      .then((value) {
    for (var doc in value.docs) {
      children.add(doc);
    }
  });

  return children;
}
