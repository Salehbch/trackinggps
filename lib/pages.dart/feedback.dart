import 'package:flutter/material.dart';

class HelpFeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Feedback'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Frequently Asked Questions',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              FAQTile(
                question: 'How does the GPS tracking feature work?',
                answer:
                    'The GPS tracking feature uses your child\'s device GPS to accurately track their location in real-time. Make sure the device has a stable internet connection for optimal performance.',
              ),
              FAQTile(
                question: 'How can I add multiple children to the app?',
                answer:
                    'To add multiple children, go to the app settings and select the "Add Child" option. Follow the on-screen instructions to add a new child profile.',
              ),
              FAQTile(
                question: 'What if I lose connection with my child\'s device?',
                answer:
                    'If the connection is lost, the app will attempt to reconnect automatically. Once the connection is restored, you will be able to see your child\'s updated location.',
              ),
              SizedBox(height: 24.0),
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'If you have any further questions or need assistance, please feel free to contact our support team:',
              ),
              SizedBox(height: 8.0),
              Text(
                'Email: benchiekhsaleh49@gmail.com\n'
                'or you can try this :\n'
                'Email: boudabbouzines@gmail.com',
              ),
              SizedBox(height: 8.0),
              Text(
                'Phone: +213 669658466\n'
                'or you can try this :\n'
                'Phone: +213 697180420',
              ),
              SizedBox(height: 24.0),
              Text(
                'Feedback',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'We appreciate your feedback and suggestions. Please send them to us via email or contact our support team. Your feedback helps us improve our app!',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FAQTile extends StatelessWidget {
  final String question;
  final String answer;

  const FAQTile({
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(answer),
        ),
      ],
    );
  }
}
