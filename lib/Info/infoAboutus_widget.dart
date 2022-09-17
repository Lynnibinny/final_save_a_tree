/*----------------------------------------------------------------------------------
infoAboutus_widget.dart

Author: Lynn Nüesch and Yarina Vetterli
Date: 10.12.2021

History:
Version Date Who Changes

Copyright © 2021 Lynn Nüesch und Yarina Vetterli, Switzerland. All rights reserved.
-----------------------------------------------------------------------------------*/
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InfoAboutUs extends StatelessWidget {
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
            'Über uns',
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
                      child: Text('Save A Tree und Sagittaria',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Save A Tree ist die App von Sagittaria. "Sagittaria – Schweizerische Vereinigung für Naturschutz in Argentinien" ist ein Verein mit Sitz in Baden, Schweiz. Dieser Verein veranstaltet verschiedene Anlässe und versucht mit Herzblut Spenden für die, in Projekte beschriebenen Anliegen, zu sammeln. Derzeit ist Sagittaria ein vergleichsweise kleiner Verein, dem alles daran liegt, den Urwald zu erhalten. All die Spenden, die an Sagittaria gehen, werden direkt und ohne Abzug für bürokratisches, für die Urwalderhaltung verwendet. Sobald genug Geld für eine neu zu kaufende Fläche zusammen ist, wird dies sofort getan.',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage('assets/Butterfly.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Unsere Philosophie ist es, dass niemand zu klein ist, etwas an eine bessere Welt beizutragen. In den Medien wird oft vom Klimawandel und seinen Folgen gesprochen, dies kann das Gefühl von Überforderung auslösen. "Es gibt so viele Probleme auf der Welt, ach wo soll ich helfen und wo ist mein Platz?" Vielleicht sollten wir alle ein, zwei Anliegen suchen und uns für deren Bekämpfung einsetzen. Wir müssen nicht die ganze Welt retten, wir sind ja nicht alleine.',
                    style: TextStyle(fontSize: 20.0),
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
