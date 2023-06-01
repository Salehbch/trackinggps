import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contact our support team for any inquiries:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String? encodeQueryParameters(Map<String, String> params) {
                  return params.entries
                      .map((MapEntry<String, String> e) =>
                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                      .join('&');
                }

                final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: 'benchiekhsaleh49@gmail.com',
                    query: encodeQueryParameters(<String, String>{
                      'subject': 'Give us a like',
                      'body': 'D\'ont forget to Subscribe to the channel'
                    }));

                if (await canLaunchUrl(emailUri)) {
                  launchUrl(emailUri);
                } else {
                  throw Exception('could not lunch $emailUri');
                }
              },
              child: Text('benchiekhsaleh49@gmail.com'),
            ),
          ],
        ),
      ),
    );
  }
}
