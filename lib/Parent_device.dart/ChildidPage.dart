import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/NavigationBar.dart';

class ChildIdPage extends StatefulWidget {
  final String childId;

  const ChildIdPage({Key? key, required this.childId}) : super(key: key);

  @override
  State<ChildIdPage> createState() => _ChildIdPageState();
}

class _ChildIdPageState extends State<ChildIdPage> {
  late String childId;

  @override
  void initState() {
    super.initState();
    print('widget id == ${widget.childId}');
    childId = widget.childId;
  }

  @override
  Widget build(BuildContext context) {
    print('widget id == ${widget.childId}');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Here you have your child ID'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Text(
                "In This page \nyou should copie \nyour Child's unique ID!!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "the unique ID  :",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 270,
                    padding: EdgeInsets.all(15.0),
                    child: Text(childId),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepOrange, width: 3.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: childId));
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content:
                                    Text('you are now copied the unique Id'),
                              );
                            });
                      },
                      icon: Icon(
                        Icons.content_copy,
                        color: Colors.black,
                      )),
                ],
              ),
              SizedBox(
                width: 100,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
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
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NavigationPage()));
                    },
                    minWidth: double.infinity,
                    height: 60,
                    color: Colors.deepOrange,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      "Go home",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
