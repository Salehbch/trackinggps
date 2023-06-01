import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages.dart/firstchild.dart';
import 'package:flutter_application_1/pages.dart/login.dart';
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
  final _controlleremail = TextEditingController();
  final _controllerpassword = TextEditingController();
  var _isObscured = true;

  @override
  void dispose() {
    _controlleremail.dispose();
    _controllerpassword.dispose();
    super.dispose();
  }

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
                    controller: _controlleremail,
                  ),
                  makeInput(
                    label: "Name",
                    controller: _controllerName,
                  ),
                  makeInput(
                    label: "Password",
                    controller: _controllerpassword,
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
                    onPressed: () async {
                      if (_controllerName.text.isNotEmpty &&
                          _controlleremail.text.isNotEmpty &&
                          _controllerpassword.text.isNotEmpty) {
                        await signUp(uid);
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
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      "Already have an account? Login",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black),
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
        email: _controlleremail.text.trim(),
        password: _controllerpassword.text.trim(),
      );
      uid = res.user!.uid;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('uid', uid);
      if (res.user != null) {
        createParent(
          _controllerName.text,
          _controlleremail.text.trim(),
          _controllerpassword.text.trim(),
          res.user!.uid,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => firstchild(
                    childId: '',
                    uid: 'uid',
                  )),
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
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
