
import 'package:cbtest/route_generator.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      title: 'ছন্দ বাকশো',
      theme: ThemeData(primaryColor: Colors.orange, accentColor: Colors.orange),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      // routes: ,
    );
  }
}