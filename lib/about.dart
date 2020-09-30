import 'package:cbtest/launch.dart';
import 'package:flutter/material.dart';
import 'package:cbtest/navAnimate.dart';

class AboutInfo extends StatefulWidget {
  @override
  _AboutInfoState createState() => _AboutInfoState();
}

bool shapeShowed = false;

class _AboutInfoState extends State<AboutInfo> with TickerProviderStateMixin {
  AnimationController controller, controller1;
  Animation animation, animation1;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    controller1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 901),
    );

    // animation = Tween(begin: Offset(1, -1.50), end: Offset(0, 0))
    //     .chain(CurveTween(curve: Curves.decelerate))
    //     .animate(controller);
    animation1 = CurvedAnimation(parent: controller1, curve: Curves.decelerate);
    controller.forward();
    controller1.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: screenHeight / 2.7,
              left: screenWidth / 2.45,
            ),
            child: Hero(
              tag: "about_info",
              child: Image.asset(
                'assets/images/title3.png',
                height: MediaQuery.of(context).size.height / 9.5,
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.7),
            child: FadeTransition(
              opacity: animation1,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight / 2.10),
                    child: ClipPath(
                      clipper: ClippingClass(),
                      child: Container(
                        color: Color.fromRGBO(38, 38, 39, 1.0),
                        height: 600,
                      ),
                    ),
                  ),
                  FadeTransition(
                    opacity: animation1,
                    child: Container(
                      padding: EdgeInsets.only(
                        top: screenHeight / 2.7,
                        left: screenWidth / 2.46,
                      ),
                      child: Image.asset(
                        'assets/images/title2.png',
                        height: MediaQuery.of(context).size.height / 9.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: screenWidth / 1.219,
              top: screenWidth / 10.2,
            ),
            child: IconButton(
                color: Colors.white,
                icon: Container(
                  height: screenHeight / 10.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.home,
                    color: Colors.teal,
                  ),
                ),
                iconSize: screenHeight / 25.3,
                onPressed: () {
                  Navigator.pop(context, FadeRoute(page: TestScreen()));
                  // Navigator.of(context).pop();
                }),
          ),
          Container(
            margin: EdgeInsets.only(
              top: screenHeight / 1.8,
              left: screenHeight / 25.8,
              right: screenHeight / 25.8,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: screenHeight / 35),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height / 2.3);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 1.3, size.height);
    path.quadraticBezierTo(size.width - (size.width / 6), size.height,
        size.width, size.height - 9);
    path.quadraticBezierTo(size.width - (size.width / 6), size.height,
        size.width, size.height - 12.0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
