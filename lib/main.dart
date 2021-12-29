/*----------------------------------------------------------------------------------
main.dart

Author: Lynn Nüesch and Yarina Vetterli
Date: 10.12.2021

History:
Version Date Who Changes

Copyright © 2021 Lynn Nüesch und Yarina Vetterli, Switzerland. All rights reserved.
-----------------------------------------------------------------------------------*/
import 'package:flutter/material.dart';
import 'package:save_a_tree/login.dart';
import 'package:save_a_tree/profileGoals_widget.dart';

import 'package:save_a_tree/splash_screen.dart';
import 'package:save_a_tree/startprofile_widget.dart';

import 'firstscreen.dart';
import 'nav.dart';
import 'package:save_a_tree/nav.dart';
//import 'dart:async';
//import 'dart:convert';

//import 'dart:html';
//import 'package:http/http.dart' as http;

class Routes {
  static const SplashScreenRoute = '/'; //String den wir überall benutzen können
  static const FirstScreenRoute = '/first';
  static const StartProfileRoute = '/second';
  static const StartProfileWidgetRoute = '/profile';
  static const ProfileGoalsWidget = '/goal';



}

void main() async {
  runApp(new MyApp()); //hier kann ich etwas mitgeben, prefs MyApp übergeben
}

/*class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Bottom Nav Bar',
      color: Colors.black,
      home: Nav(),
    );
  }
}*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Named Routes Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.white,
          ),
          scaffoldBackgroundColor: Colors.transparent),
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: Routes.SplashScreenRoute,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => SplashScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => Nav(),
        '/first': (context) => FirstScreen(),
        '/login': (context) => Login(),
        '/profile': (context) => StartProfileWidget(),
        '/goal': (context) => ProfileGoalsWidget()
        
      },
    );
  }
}
