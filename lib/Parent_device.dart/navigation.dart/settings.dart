import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Parent_device.dart/navigation.dart/profilPage.dart';
import 'package:flutter_application_1/pages.dart/ContactUs.dart';

import 'package:flutter_application_1/pages.dart/feedback.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages.dart/aboutUs.dart';
import '../../pages.dart/rateapp.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDark = false;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          backgroundColor: Colors.indigo,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView(
              children: [
                _SingleSection(
                  title: "General",
                  children: [
                    _CustomListTile(
                      title: "Profile",
                      icon: Icons.person_outline_rounded,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const profilPage()));
                      },
                    ),
                    _CustomListTile(
                        title: "rate this app",
                        icon: Icons.star,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RateThisAppPage()),
                          );
                        }),
                    _CustomListTile(
                        title: "Contact Us",
                        icon: Icons.message_outlined,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactUsPage()),
                          );
                        }),
                    _CustomListTile(
                        title: "Help & Feedback",
                        icon: Icons.help_outline_rounded,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HelpFeedbackPage()),
                          );
                        }),
                    _CustomListTile(
                        title: "About",
                        icon: Icons.info_outline_rounded,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutUsPage()),
                          );
                        }),
                    _CustomListTile(
                      title: "Sign out",
                      icon: Icons.exit_to_app_rounded,
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                      'Are you sure you want to disconnect:\n '),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            border: const Border(
                                              bottom: BorderSide(
                                                  color: Colors.black),
                                              top: BorderSide(
                                                  color: Colors.black),
                                              left: BorderSide(
                                                  color: Colors.black),
                                              right: BorderSide(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          child: MaterialButton(
                                            minWidth: double.infinity,
                                            height: 60,
                                            color: Colors.red,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            onPressed: () async {
                                              await FirebaseAuth.instance
                                                  .signOut();
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs.remove('uid');
                                              Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      '/choice');
                                            },
                                            child: Text(
                                              'Yes',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            border: const Border(
                                              bottom: BorderSide(
                                                  color: Colors.black),
                                              top: BorderSide(
                                                  color: Colors.black),
                                              left: BorderSide(
                                                  color: Colors.black),
                                              right: BorderSide(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          child: MaterialButton(
                                            minWidth: double.infinity,
                                            height: 60,
                                            color: Colors.greenAccent,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'No',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Widget? trailing;
  final Function? onTap;

  const _CustomListTile({
    Key? key,
    this.title,
    this.icon,
    // ignore: unused_element
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title!),
      trailing: trailing,
      onTap: onTap as void Function()?,
    );
  }
}

class _SingleSection extends StatefulWidget {
  final String? title;
  final List<Widget>? children;
  const _SingleSection({
    Key? key,
    this.title,
    this.children,
  }) : super(key: key);

  @override
  State<_SingleSection> createState() => _SingleSectionState();
}

class _SingleSectionState extends State<_SingleSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        Column(
          children: widget.children!,
        ),
      ],
    );
  }
}
