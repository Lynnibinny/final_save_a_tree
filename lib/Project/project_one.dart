/*----------------------------------------------------------------------------------
project_one.dart

Author: Lynn Nüesch and Yarina Vetterli
Date: 10.12.2021

History:
Version Date Who Changes

Copyright © 2021 Lynn Nüesch und Yarina Vetterli, Switzerland. All rights reserved.
-----------------------------------------------------------------------------------*/
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProjectOne extends StatelessWidget {
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
            Colors.lightGreen[200],
            Colors.lightGreen[300],
            Colors.lightGreen[400],
            Colors.lightGreen[400],
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Wald am Chafariz',
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
                      child: Text('Wald am Chafaríz',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Fläche so gross wie 540 Fussballfelder für \nCHF 600'000",
                    style: TextStyle(fontSize: 23.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Der Chafaríz ist ein kleiner Fluss in der Nähe von Soberbio, der in den Rio Uruguay mündet. Es gibt eine grosse Gemeinschaft, die dort am Rande eines Waldes und in diesem lebt. Er gehört einem 78-jährigen Mann. Dieser lässt die Mbyá gewähren, kann aber den Wald nun ohne Nutzung nicht mehr halten. Der Schamane bat den Gott Ñanderú, dass er eine Lösung finden möge. Die Erwartungshaltung ist entsprechend gross!',
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
                        image: AssetImage('assets/riverForest.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  /*Text(
                    'Die Gefahr der schrumpfenden Biodiversität ist, dass einzele Pflanzen oder Tiere die überhand nehmen. Die Wahrscheinlichkeit, dass einzelne Arten überleben im Falle einer Klimakrise Parasitenbefall, oder bei Krankheiten ist viel geringer als sie wäre bei einer grossen Diversität. Dies kann auch für uns Menschen schwere folgen haben, da unsere Wirtschaft auf der Landwirtschaft basiert die bei immer geringerer Biodiversität schlecht auf andere Sorten umsteigen kann.',
                    style: TextStyle(fontSize: 20.0),
                  ),*/
                  SizedBox(
                    height: 20,
                  ),
                  /*ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () {
                        print('Tapped');
                      },
                      child: Container(
                        child: AutoSizeText(
                          'Jetzt spenden',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                        ),
                      )),*/
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
