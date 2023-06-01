import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'About GPS Child Tracking App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Our GPS Child Tracking App is designed to provide parents with a peace of mind by allowing them to track the location of their children in real-time. With our app, you can easily monitor your child\'s whereabouts and ensure their safety.',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Contact our support team for any inquiries:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 300,
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
                      String? encodeQueryParameters(
                          Map<String, String> params) {
                        return params.entries
                            .map((MapEntry<String, String> e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      final Uri emailUri = Uri(
                          scheme: 'mailto',
                          path: 'benchiekhsaleh49@gmail.com',
                          query: encodeQueryParameters(
                              <String, String>{'subject': '', 'body': ''}));

                      if (await canLaunchUrl(emailUri)) {
                        launchUrl(emailUri);
                      } else {
                        throw Exception('could not lunch $emailUri');
                      }
                    },
                    minWidth: double.infinity,
                    height: 60,
                    color: Colors.deepOrange[300],
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text('benchiekhsaleh49@gmail.com'),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 300,
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
                      String? encodeQueryParameters(
                          Map<String, String> params) {
                        return params.entries
                            .map((MapEntry<String, String> e) =>
                                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                            .join('&');
                      }

                      final Uri emailUri = Uri(
                          scheme: 'mailto',
                          path: 'boudabbouzines@gmail.com',
                          query: encodeQueryParameters(
                              <String, String>{'subject': '', 'body': ''}));

                      if (await canLaunchUrl(emailUri)) {
                        launchUrl(emailUri);
                      } else {
                        throw Exception('could not lunch $emailUri');
                      }
                    },
                    minWidth: double.infinity,
                    height: 60,
                    color: Colors.deepOrange[300],
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text('boudabbouzines@gmail.com'),
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
