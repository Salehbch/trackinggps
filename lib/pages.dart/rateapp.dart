import 'package:flutter/material.dart';

class RateThisAppPage extends StatefulWidget {
  @override
  _RateThisAppPageState createState() => _RateThisAppPageState();
}

class _RateThisAppPageState extends State<RateThisAppPage> {
  // Rating variable
  int _rating = 0;

  // Launch app store URL

  // Display rating dialog
  void _showRatingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rate This App'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('How would you rate this app?'),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.star,
                      color: _rating >= 1 ? Colors.amber : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = 1;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.star,
                      color: _rating >= 2 ? Colors.amber : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = 2;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.star,
                      color: _rating >= 3 ? Colors.amber : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = 3;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.star,
                      color: _rating >= 4 ? Colors.amber : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = 4;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Rate This App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enjoying the app? Rate us!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 50),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  _showRatingDialog();
                },
                child: Text('Rate Now'),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Later'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
