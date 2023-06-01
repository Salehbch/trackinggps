import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages.dart/permission.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Child_home extends StatefulWidget {
  const Child_home({Key? key}) : super(key: key);

  @override
  State<Child_home> createState() => _Child_homeState();
}

class _Child_homeState extends State<Child_home> {
  final _controllerId = TextEditingController();

  late String x;

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
            color: Colors.indigo,
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
                      Text(
                        "In This page \nyou should write \nyour Child's unique ID.",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Start Track your child",
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 53, 51, 50),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 300,
                        child: makeInput(
                          label: "The unique ID",
                          TextEditingController: _controllerId,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        border: const Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: () async {
                          x = await signInChild(_controllerId.text);
                          print('x===========$x');
                          if (_controllerId.text == x) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Permission1(),
                              ),
                            );
                          } else if (_controllerId.text.isEmpty) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content:
                                        Text('please write your unique Id'),
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
                        minWidth: double.infinity,
                        height: 70,
                        color: Colors.indigo,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "Start",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 23,
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

  Widget makeInput({
    required label,
    obscureText = false,
    TextEditingController? TextEditingController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(221, 0, 0, 0),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: _controllerId,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 57, 56, 56)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 43, 42, 42)),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

Future<String> signInChild(String id) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  DocumentSnapshot<Map<String, dynamic>> res =
      await firestore.collection('children').doc(id).get();
  if (res.exists) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('childId', res.id);
    return res.id;
  }

  return "";
}
