import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cbtest/search_icon_icons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> with TickerProviderStateMixin {
  int flag = 0;
  bool saved = false;
  DateTime currentBackPressTime;
  final _text = TextEditingController();
  bool _validate = false;
  bool languageValidation = true;
  bool searchButtonPressed = false;
  double opacityLevel = 1.0;
  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.w500),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(color: Colors.orange, fontSize: 30.0),
  );

  @override
  void initState() {
    super.initState();
    // BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    // BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () {
        searchButtonPressed
            ? setState(() {
                searchButtonPressed = false;
                _validate = false;
                languageValidation = true;
                _text.clear();
              })
            : showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(screenHeight / 85)),
                  ),
                  backgroundColor: Color.fromRGBO(38, 38, 39, 1.0),
                  title: Text(
                    "চলে যাচ্ছেন?",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  content: Text(
                    "ব্যাপারটা দুঃখজনক",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            SystemChannels.platform
                                .invokeMethod('SystemNavigator.pop');
                          },
                          child: Text(
                            "আবার আসিবো ফিরে",
                            style: TextStyle(
                                color: Color.fromRGBO(250, 167, 25, 1.0),
                                fontSize: 20.0),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text(
                            "না, যাচ্ছি না",
                            style: TextStyle(
                                color: Color.fromRGBO(250, 167, 25, 1.0),
                                fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(38, 38, 39, 1.0),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Stack(
            children: <Widget>[
              Container(
                height: screenHeight / 1.08,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight / 3),
                    ),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 400),
                      firstChild: Container(
                          child: SizedBox(
                              child: Text(
                                languageValidation
                                    ? 'যেকোনো শব্দ লিখুন বাংলায়'
                                    : "শুধুমাত্র বাংলা শব্দ ব্যবহার করুন ",
                                style: TextStyle(fontSize: screenHeight / 30.0),
                              ),
                              height:
                                  MediaQuery.of(context).size.height / 31.0),
                          padding: EdgeInsets.only(top: screenHeight / 7.5)),
                      secondChild: Image.asset('assets/images/ico.png',
                          height: MediaQuery.of(context).size.height / 6.1),
                      crossFadeState: searchButtonPressed
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                    Container(
                      padding: new EdgeInsets.only(
                        top: screenHeight / 3.55,
                        right: screenHeight / 90.58,
                      ),
                      alignment: Alignment(1.0, 0.0),
                      child: Hero(
                        tag: "about_info",
                        child: Image.asset(
                          'assets/images/title3.png',
                          height: screenHeight / 15.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    right: screenWidth / 110.0,
                    left: screenWidth / 50.0,
                    top: screenHeight / 20.5),
                child: IconButton(
                    icon: Icon(
                      Icons.info,
                      color: Color.fromRGBO(38, 38, 39, 1.0),
                    ),
                    iconSize: screenHeight / 19.3,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/about');
                    }),
              ),
              Container(
                // color: Color.fromRGBO(38, 38, 39, 1.0),
                padding: EdgeInsets.only(
                    top: screenHeight / 55, bottom: screenHeight / 60.0),
                alignment: Alignment(1.0, 1.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: screenWidth / 5.95,
                    ),
                    Icon(
                      Icons.rate_review,
                      size: screenHeight / 25.0,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: screenWidth / 1.95,
                    ),
                    Icon(
                      Icons.collections_bookmark,
                      size: screenHeight / 25.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              !searchButtonPressed
                  ? Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                            left: screenWidth / 1.461,
                            top: screenHeight / 20.63,
                          ),
                          child: Image.asset(
                            'assets/images/bak2.png',
                            alignment: Alignment.topRight,
                            color: Colors.transparent.withOpacity(0.5),
                            height: screenHeight / 2.5,
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.only(
                            top: screenHeight / 2.2,
                          ),
                          child: Image.asset(
                            'assets/images/bak.png',
                            color: Colors.transparent.withOpacity(0.5),
                            height: screenHeight / 2.1,
                          ),
                        ),

                        // ),
                      ],
                    )
                  : Container(),
              AnimatedContainer(
                duration: Duration(milliseconds: 600),
                curve: Curves.easeInOutCubic,
                height:
                    searchButtonPressed ? screenHeight / 1.55 : screenHeight,
                alignment: searchButtonPressed
                    ? Alignment.topCenter
                    : AlignmentDirectional.bottomCenter,
                padding: searchButtonPressed
                    ? EdgeInsets.all(
                        0.0,
                      )
                    : EdgeInsets.only(
                        bottom: screenHeight / 28.13,
                      ),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn,
                  height: searchButtonPressed
                      ? screenHeight / 3.5
                      : screenHeight / 12.13,
                  width:
                      searchButtonPressed ? screenWidth : screenHeight / 12.13,
                  decoration: searchButtonPressed
                      ? BoxDecoration(
                          color: Color.fromRGBO(250, 167, 25, 1.0),
                          borderRadius: BorderRadius.only(
                              bottomRight:
                                  Radius.circular(screenHeight / 15.0)),
                        )
                      : BoxDecoration(
                          color: Color.fromRGBO(250, 167, 25, 1.0),
                          borderRadius: BorderRadius.all(
                              Radius.circular(screenHeight / 18.0)),
                        ),
                  padding: searchButtonPressed
                      ? EdgeInsets.only(
                          right: screenWidth / 10.5,
                          top: screenWidth / 18.5,
                          left: screenWidth / 10.5,
                        )
                      : EdgeInsets.all(
                          0.0,
                        ),
                  child: searchButtonPressed
                      ? Material(
                          color: Colors.transparent, // button color
                          child: InkWell(
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            child: Container(
                              width: screenHeight / 1.13,
                              height: screenHeight / 10.13,
                              child: Center(
                                child: Material(
                                  elevation: 15.0,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50.0),
                                  ),
                                  child: TextField(
                                    controller: _text,
                                    // autofocus: true,
                                    style: TextStyle(
                                        color: Color.fromRGBO(38, 38, 39, 1.0),
                                        fontSize: screenHeight / 35.0),

                                    cursorColor:
                                        Color.fromRGBO(38, 38, 39, 1.0),
                                    decoration: InputDecoration(
                                      // errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                      hintText: _validate
                                          ? "শব্দ লিখতে ভুলে গেছেন?"
                                          : "শব্দ লিখুন",
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: screenWidth / 15.0,
                                          vertical: screenWidth / 30.0),
                                      suffixIcon: Material(
                                        child: IconButton(
                                          icon: Icon(
                                            SearchIcon.search,
                                            size: screenHeight / 32.0,
                                          ),
                                          onPressed: () {
                                            if (_text.text.isEmpty) {
                                              setState(() {
                                                _validate = true;
                                              });
                                            } else {
                                              if ((_text.text.contains(
                                                      new RegExp(r'[ঀ-৻]'))) &&
                                                  (!(_text.text.contains(
                                                      new RegExp(r'[0-ॹ]')))) &&
                                                  (!(_text.text
                                                      .contains(' '))) &&
                                                  (!(_text.text.contains(
                                                      new RegExp(
                                                          r'[ਅ-𝕩]'))))) {
                                                setState(() {
                                                  languageValidation = true;
                                                  _validate = false;
                                                  Navigator.of(context)
                                                      .pushNamed('/backend',
                                                          arguments:
                                                              _text.text);
                                                });
                                              } else {
                                                setState(() {});
                                                _text.clear();
                                                _validate = false;
                                                Alert(
                                                  context: context,
                                                  style: alertStyle,
                                                  image: Image.asset(
                                                    'assets/images/innovation.png',
                                                    width: screenHeight / 5.0,
                                                    height: screenWidth / 5.0,
                                                  ),
                                                  title:
                                                      "শুধুমাত্র একটি বাংলা শব্দ ব্যবহার করুন",
                                                  desc:
                                                      "বাংলা কিবোর্ড লেআউট ব্যবহার করে শুধু একটি বাংলা শব্দ সার্চ করুন",
                                                  buttons: [
                                                    DialogButton(
                                                      color: Color.fromRGBO(
                                                          38, 38, 39, 1.0),
                                                      child: Text(
                                                        "ঠিক আছে",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20.0),
                                                      ),
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                      width: 120,
                                                    )
                                                  ],
                                                ).show();
                                                languageValidation = false;
                                              }
                                            }
                                          },
                                          color: Colors.white,
                                        ),
                                        elevation: 10.0,
                                        color: Color.fromRGBO(38, 38, 39, 1.0),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(screenHeight / 6.0),
                                        ),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                searchButtonPressed = false;
                                _validate = false;
                                languageValidation = true;
                                _text.clear();
                              });
                            },
                          ),
                        )
                      : ClipOval(
                          child: Material(
                            // color: Color.fromRGBO(250, 167, 25, 1.0), // button color
                            color: Colors.transparent, // button color
                            child: InkWell(
                              // inkwell color
                              child: Container(
                                  width: MediaQuery.of(context).size.height /
                                      12.13,
                                  height: MediaQuery.of(context).size.height /
                                      12.13,
                                  child: Icon(
                                    SearchIcon.search,
                                    color: Color.fromRGBO(38, 38, 39, 1.0),
                                    size: screenHeight / 23.13,
                                  )),
                              onTap: () {
                                setState(() {
                                  searchButtonPressed = true;
                                });
                              },
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

// Route _createRoute() {
//   return PageRouteBuilder(
// pageBuilder: (context, animation, secondaryanimation) => AboutInfo(),
// transitionsBuilder: (context, animation, secondaryanimation, child)
// [
//   return FadeTransition(
//     opacity: ,
//   )
// ];
//   );
// }
