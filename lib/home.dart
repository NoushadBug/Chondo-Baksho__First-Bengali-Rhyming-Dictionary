import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({Key key}) : super(key: key);
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent) {
    print("BACK BUTTON!"); // Do some stuff.
    return true;
  }

  final int _totalPages = 2;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  ImageProvider splash1 = AssetImage("images/splash1.png");

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 8.0 : 6.0,
      width: isCurrentPage ? 20.0 : 18.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.white : Colors.grey.shade300,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // precacheImage(AssetImage("images/splash1.png"), context);
    // precacheImage(AssetImage("images/splash2.png"), context);
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(250, 167, 27, 1.0),
        height: screenHeight,
        child: Container(
          child: PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              _currentPage = page;
              setState(() {});
            },
            children: <Widget>[
              _buildPageContent(
                  image: 'assets/images/splash1.png',
                  title: 'ছন্দ বাকশে স্বাগতম',
                  body:
                      'ছন্দ বাকশো প্রথম বাংলা ছন্দ অভিধান, যার আছে সমৃদ্ধ শব্দভাণ্ডার। সহজে কোনো শব্দের সাথে ছন্দের অন্ত্যমিল মিলে এমন শব্দগুলো আপনাকে খুঁজে দিবে ছন্দ বাকশো'),
              _buildPageContent(
                  image: 'assets/images/splash2.png',
                  title: 'শব্দ খুঁজে ছন্দ পান বুঝে',
                  body:
                      'আপনার পছন্দ মতো শব্দটি লিখে সার্চ করে নিমিষেই ছন্দ-মিল শব্দ গুলো দিয়ে আপনার কর্মধারাকে করুন আরো অটল। কর্মস্পৃহা বাড়ুক আপনার সৃজনশীলতায়'),
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage != 1
          ? Container(
              color: Color.fromRGBO(250, 167, 27, 1.0),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/home',
                        arguments: 'Hello there from the first page!',
                      );
                      setState(() {});
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Text(
                      'স্কিপ',
                      style: TextStyle(
                          color: Color.fromRGBO(38, 38, 39, 1.0),
                          fontWeight: FontWeight.w600,
                          fontSize: screenHeight / 40),
                    ),
                  ),
                  Container(
                    child: Row(children: [
                      for (int i = 0; i < _totalPages; i++)
                        i == _currentPage
                            ? _buildPageIndicator(true)
                            : _buildPageIndicator(false)
                    ]),
                  ),
                  FlatButton(
                    onPressed: () {
                      _pageController.animateToPage(_currentPage + 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.linearToEaseOut);
                      setState(() {});
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Text(
                      'পরবর্তী',
                      style: TextStyle(
                          color: Color.fromRGBO(38, 38, 39, 1.0),
                          fontWeight: FontWeight.w600,
                          fontSize: screenHeight / 40),
                    ),
                  )
                ],
              ),
            )
          : Material(
              color: Color.fromRGBO(38, 38, 39, 1.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/home',
                    arguments: 'Hello there from the first page!',
                  );
                },
                child: Container(
                  height: screenHeight / 10,
                  alignment: Alignment.center,
                  child: Text(
                    'সম্পন্ন',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: screenHeight / 36,
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildPageContent({
    String image,
    String title,
    String body,
  }) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: screenHeight / 40),
            child: Image.asset(image),
            height: screenHeight / 3,
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0),
            child: Align(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenHeight / 35,
                  height: 2.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight / 100),
          Text(
            body,
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: screenHeight / 37,
                height: 1.5,
                fontWeight: FontWeight.w300),
          ),
          SizedBox(height: screenHeight / 10),
        ],
      ),
    );
  }
}
