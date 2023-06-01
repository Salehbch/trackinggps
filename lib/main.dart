import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/pages.dart/permission.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Parent_device.dart/navigation.dart/NavigationBar.dart';
import 'pages.dart/choice.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OnboardingPage1(),
    initialRoute: '/main',
    routes: {
      '/main': (context) => OnboardingPage1(),
      '/childHome': (context) => Permission1(),
      '/parentHome': (context) => NavigationPage(),
      '/choice': (context) => Choice_1(),
    },
  ));
}

class OnboardingPage1 extends StatefulWidget {
  const OnboardingPage1({Key? key}) : super(key: key);

  @override
  State<OnboardingPage1> createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends State<OnboardingPage1> {
  void getIsVisited() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String isChild = prefs.getString('childId') ?? '';
    String isParent = prefs.getString('uid') ?? '';
    bool isVisited = prefs.getBool('isVisited') ?? false;

    if (isChild.isNotEmpty) {
      Navigator.of(context).pushReplacementNamed('/childHome');
    } else if (isParent.isNotEmpty) {
      Navigator.of(context).pushReplacementNamed('/parentHome');
    } else if (isVisited) Navigator.of(context).pushReplacementNamed('/choice');
  }

  @override
  void initState() {
    super.initState();
    getIsVisited();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPagePresenter(pages: [
        OnboardingPageModel(
          title: 'Fast, Fluid and Secure',
          description: 'Enjoy the best of the world in the palm of your hands.',
          image:
              'https://th.bing.com/th/id/R.50c82695633840aca6536699d80d34b8?rik=0lolcCxLcd%2bPCw&riu=http%3a%2f%2fgetdrawings.com%2ffree-icon-bw%2flocation-icon-png-transparent-2.png&ehk=BFMUSsl5FgB%2f9aW7sKu8zJzADD%2blD6EUkrp95SB7UsM%3d&risl=&pid=ImgRaw&r=0.png',
          bgColor: Colors.indigo,
        ),
        OnboardingPageModel(
          title: 'See your children location.',
          description: 'Track your children anytime anywhere.',
          image:
              'https://th.bing.com/th/id/R.e8852ed0f829d867628f689df5aa6753?rik=xnDn4V%2b67Ut4Kw&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_465777.png&ehk=c1MlDPlb4fO58vWR2dNd2Gk9ZmzxaE%2b5H9qi1aBNsyw%3d&risl=&pid=ImgRaw&r=0.png',
          bgColor: const Color(0xff1eb090),
        ),
        OnboardingPageModel(
          title: 'Please Click on Skip.',
          description: 'With Us your children is safe.',
          image: ''
              'https://th.bing.com/th/id/R.1ab85ad8c40965c68c71e9aa326def07?rik=xoQ3B4I0PienHw&riu=http%3a%2f%2ficon-library.com%2fimages%2fchild-icon-png%2fchild-icon-png-0.jpg&ehk=5wu%2fWHkb%2fV1Tt6HgL2gRu%2bK5YAt408NFW8hKHX%2fwtsc%3d&risl=&pid=ImgRaw&r=0.png',
          bgColor: const Color(0xfffeae4f),
        ),
      ]),
    );
  }
}

class OnboardingPagePresenter extends StatefulWidget {
  final List<OnboardingPageModel>? pages;
  final VoidCallback? onSkip;
  final VoidCallback? onFinish;

  const OnboardingPagePresenter(
      {Key? key, this.pages, this.onSkip, this.onFinish})
      : super(key: key);

  @override
  State<OnboardingPagePresenter> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPagePresenter> {
  int _currentPage = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: widget.pages![_currentPage].bgColor,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.pages!.length,
                  onPageChanged: (idx) {
                    setState(() {
                      _currentPage = idx;
                    });
                  },
                  itemBuilder: (context, idx) {
                    final item = widget.pages![idx];
                    return Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Image.network(
                              item.image!,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(item.title!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: item.textColor,
                                        )),
                              ),
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 280),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 8.0),
                                child: Text(item.description!,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: item.textColor,
                                        )),
                              )
                            ]))
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.pages!
                    .map((item) => AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: _currentPage == widget.pages!.indexOf(item)
                              ? 30
                              : 8,
                          height: 8,
                          margin: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                        ))
                    .toList(),
              ),
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            visualDensity: VisualDensity.comfortable,
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          prefs.setBool('isVisited', true);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Choice_1()));
                        },
                        child: const Text("Skip")),
                    TextButton(
                      style: TextButton.styleFrom(
                          visualDensity: VisualDensity.comfortable,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        if (_currentPage == widget.pages!.length - 1) {
                          widget.onFinish?.call();
                        } else {
                          _pageController.animateToPage(_currentPage + 1,
                              curve: Curves.easeInOutCubic,
                              duration: const Duration(milliseconds: 20));
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            _currentPage == widget.pages!.length - 1
                                ? "Finish"
                                : "Next",
                          ),
                          const SizedBox(width: 8),
                          Icon(_currentPage == widget.pages!.length - 1
                              ? Icons.done
                              : Icons.arrow_forward),
                        ],
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

class OnboardingPageModel {
  final String? title;
  final String? description;
  final String? image;
  final Color bgColor;
  final Color textColor;

  OnboardingPageModel(
      {this.title,
      this.description,
      this.image,
      this.bgColor = Colors.blue,
      this.textColor = Colors.white});
}
