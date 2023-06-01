import 'package:flutter/material.dart';
import 'package:flutter_application_1/Child_device.dart/setIdchild.dart';
import 'package:flutter_application_1/Parent_device.dart/parent_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Choice extends StatelessWidget {
  const Choice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Choice_1(),
    );
  }
}

class Choice_1 extends StatefulWidget {
  const Choice_1({Key? key}) : super(key: key);

  @override
  State<Choice_1> createState() => _Choice_1State();
}

class _Choice_1State extends State<Choice_1> {
  void testDevice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String isChild = prefs.getString('childId') ?? '';

    if (isChild.isNotEmpty) {
      Navigator.of(context).pushReplacementNamed('/childHome');
    } else {
      String isParent = prefs.getString('uid') ?? '';
      if (isParent.isNotEmpty) {
        print('aa');
        Navigator.of(context).pushReplacementNamed('/parentHome');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    testDevice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Column(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Here you should choose the device"
                    " if this device  "
                    "is for parent  \n or child",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 32, 30, 30),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height / 2.9,
                    width: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('img/parent.png'),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2.9,
                    width: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('img/child.png'),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: FractionalOffset.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 140,
                      height: 60,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Parent_start1(),
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        "Parent",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 0, left: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: const Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: MaterialButton(
                        minWidth: 140,
                        height: 60,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Child_home(),
                            ),
                          );
                        },
                        color: Colors.indigo,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "Child",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
