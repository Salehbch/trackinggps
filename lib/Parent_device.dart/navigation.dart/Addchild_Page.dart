import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/setget.dart/inserChildData.dart';
import 'package:intl/intl.dart';

class AddChild_Page extends StatefulWidget {
  const AddChild_Page({Key? key}) : super(key: key);

  @override
  _AddChild_PageState createState() => _AddChild_PageState();
}

class _AddChild_PageState extends State<AddChild_Page> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _controllerpassword = TextEditingController();

  var _isObsucred = true;
  String? _selectedGender;
  DateTime? _selectedDate;
  late String childId;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime initialDate = currentDate.subtract(Duration(days: 6 * 365));
    final DateTime lastDate = currentDate.subtract(Duration(days: 16 * 365));

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: lastDate,
      lastDate: initialDate,
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 200,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Add child",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Add child in this page ",
                style: TextStyle(
                    fontSize: 15, color: Color.fromARGB(255, 32, 29, 29)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0))),
                  border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0))),
                  border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _controllerpassword,
                obscureText: _isObsucred,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    padding: const EdgeInsetsDirectional.only(end: 1.0),
                    icon: _isObsucred
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObsucred = !_isObsucred;
                      });
                    },
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 57, 56, 56))),
                  border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 43, 42, 42))),
                ),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 0, 0, 0))),
                  border: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                ),
                value: _selectedGender,
                hint: const Text('Select Gender'),
                onChanged: (String? value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: 'Boy',
                    child: Text('Boy'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Girl',
                    child: Text('Girl'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Birthday',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0))),
                    border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        _selectedDate == null
                            ? 'Select Birthday'
                            : DateFormat('dd/MM/yyyy').format(_selectedDate!),
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Column(
                children: [
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.indigo),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 0, 0, 0)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                            side:
                                const BorderSide(color: Colors.black, width: 1),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        String id = '';
                        if (_emailController.text.isNotEmpty &&
                            _nameController.text.isNotEmpty &&
                            _controllerpassword.text.isNotEmpty &&
                            _selectedGender != null &&
                            _selectedDate != null) {
                          id = await insertDataChild(
                              _nameController.text,
                              _emailController.text,
                              _controllerpassword.text,
                              _selectedGender,
                              _selectedDate);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                        'You created the new child his Id is:\n $id'),
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        Clipboard.setData(
                                            ClipboardData(text: id));
                                      },
                                      child: Text('copy'),
                                    ),
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Close'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(
                                      'please fill up the information first'),
                                );
                              });
                        }

                        if (id.isEmpty) return;
                      },
                      child: const Text(
                        'Add',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
