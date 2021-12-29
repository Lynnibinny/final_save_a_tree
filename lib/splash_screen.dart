/*----------------------------------------------------------------------------------
splash_screen.dart

Author: Lynn Nüesch and Yarina Vetterli
Date: 10.12.2021

History:
Version Date Who Changes

Copyright © 2021 Lynn Nüesch und Yarina Vetterli, Switzerland. All rights reserved.
-----------------------------------------------------------------------------------*/
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class SplashScreen extends StatelessWidget {
  Future<void> isRegistered(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //in shared preferences the userids get saved to figure out if the user has registered before or not
    var id = prefs.getInt('registeredUserId');
    if (id == null || id == 0) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.FirstScreenRoute, (route) => false);
    } else {
      print('RegisteredUserId is: $id' );
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.StartProfileRoute, (route) => false);
      //the files which are underneath get removed until they recieve true. But we never want to go back to the SplashScreen. Therefore we have it always on false. with Remove Untile
      //if getString has already a Value we recieve true an thats how we figure out if the has user logged in before or not.
      //if getString is empty we recieve false
    }
  }

  @override
  Widget build(BuildContext context) {
    isRegistered(context);
    return Scaffold(
      body: Center(
        child: Text('Wilkommen'),
        // this is the first text the user sees the first time he loggs in
      ),
    );
  }
}
