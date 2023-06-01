import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> insertDataplace(
    String name, String type, GeoPoint center) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var uid = FirebaseAuth.instance.currentUser?.uid;

  DocumentReference<Map<String, dynamic>> value =
      await firestore.collection('places').add({
    'name': name,
    'type': type,
    'center': center,
    'parentId': uid,
  });

  return value.id;
}
