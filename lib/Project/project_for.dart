/*----------------------------------------------------------------------------------
project_for.dart

Author: Lynn Nüesch and Yarina Vetterli
Date: 10.12.2021

History:
Version Date Who Changes

Copyright © 2021 Lynn Nüesch und Yarina Vetterli, Switzerland. All rights reserved.
-----------------------------------------------------------------------------------*/
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProjectFor extends StatelessWidget {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87, //Button Text color
    primary: Colors.white, //Button background color
    minimumSize: Size(200, 60),

    shadowColor: Colors.white54, //?
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.lightGreen[200]!,
            Colors.lightGreen[300]!,
            Colors.lightGreen[400]!,
            Colors.lightGreen[400]!,
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Gemeinschaft Guaviramí',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0x00000000),
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black, //to make the back button black
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('Gemeinschaft Guaviramí',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Fläche so gross wie 170 Fussballfelder für \nCHF 179'400",
                    style: TextStyle(fontSize: 23.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Diese Gemeinschaft bildete sich aus einer Gruppe von Mbyá, welchen kein fester Lebensraum zur Verfügung stand. Die juristische Person wurde erst gebildet, nachdem sie sich in ihrem Wald eingerichtet hatten. Es handelt sich um 100 Hektaren aus wenig verändertem Urwald bestehend und 21 Hektaren Land, welche einst gerodet und mit schnellwachsenden Pinien bepflanzt wurden. Daraus hat sich in den letzten 20 Jahren wieder ein dichter Wald entwickelt.',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 280.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage('assets/forestPalm.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              //),
            ),
          ],
        ),
      ),
    );
  }
}
