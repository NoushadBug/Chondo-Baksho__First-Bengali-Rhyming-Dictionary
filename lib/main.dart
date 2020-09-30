import 'package:flutter/material.dart';
import 'dart:async';
import 'route_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(
      title: 'ছন্দ বাকশো',
      theme: ThemeData(
          fontFamily: 'ShorifTeesta',
          primaryColor: Colors.orange,
          accentColor: Colors.orange),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      // routes: ,
    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (!_seen) {
      // Navigator.of(context).pushNamed('/intro');
      Navigator.pushReplacementNamed(context, '/intro');

      await prefs.setBool('seen', true);
    } else {
      Navigator.pushReplacementNamed(context, '/home');
      // Navigator.of(context).pushNamed('/home');
    }
  }

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 4), () {
      print("splash Done!");
      checkFirstSeen();
      // Navigator.of(context).pushNamed('/second');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Image.asset(
                'assets/images/splashlogo.png',
                height: MediaQuery.of(context).size.height / 4.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
