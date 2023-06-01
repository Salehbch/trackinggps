import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

Future<String> insertDataChild(String name, String email, String password,
    String? gender, DateTime? date) async {
  String birthday =
      date == null ? 'Not Selected' : DateFormat('dd/MM/yyyy').format(date);

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var uid = FirebaseAuth.instance.currentUser?.uid;

  DocumentReference<Map<String, dynamic>> value =
      await firestore.collection('children').add({
    'name': name,
    'email': email,
    'password': password,
    'gender': gender,
    'birthday': birthday,
    'parentId': uid,
    'position': GeoPoint(0, 0),
  });

  return value.id;
}
