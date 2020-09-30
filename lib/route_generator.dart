import 'package:flutter/material.dart';
import 'package:cbtest/main.dart';
import 'package:cbtest/home.dart';
import 'package:cbtest/launch.dart';
import 'package:cbtest/backend.dart';
import 'package:cbtest/about.dart';
import 'dart:async';

Future<bool> isNewRouteSameAsCurrent = Future<bool>.value(false);

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        isNewRouteSameAsCurrent = Future<bool>.value(false);
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case '/intro':
        isNewRouteSameAsCurrent = Future<bool>.value(false);
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case '/home':
        isNewRouteSameAsCurrent = Future<bool>.value(true);
        return MaterialPageRoute(builder: (_) => TestScreen());

      case '/backend':
        isNewRouteSameAsCurrent = Future<bool>.value(false);
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => Backend(
                 data: args,
                ),
          );
        }
        return _errorRoute();

        break;

      case '/about':
        isNewRouteSameAsCurrent = Future<bool>.value(false);
        return MaterialPageRoute(builder: (_) => AboutInfo());
      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.
      default:
        isNewRouteSameAsCurrent = Future<bool>.value(false);
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR ROUTE!! GO BACK'),
        ),
      );
    });
  }
}
