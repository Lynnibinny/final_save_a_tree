/*----------------------------------------------------------------------------------
infoCulture_widget.dart

Author: Lynn Nüesch and Yarina Vetterli
Date: 10.12.2021

History:
Version Date Who Changes

Copyright © 2021 Lynn Nüesch und Yarina Vetterli, Switzerland. All rights reserved.
-----------------------------------------------------------------------------------*/
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class InfoCulture extends StatelessWidget {
  double fontBig = 25;
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
            'Kultur',
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
                      child: Text('Kultur der Mbyá Guaraní',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child:
                          Text('Weltanschauung                                ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: fontBig,
                              ))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Die Weltanschauung und Spiritualität der Mbyá ist sehr komplex und ganz auf das Leben in und mit der Natur ausgerichtet. Die Mbyá sehen sich nicht als Krone der Schöpfung, sondern als allen Organismen des Waldes gleichgestellte Wesen. Alle Tier- und Pflanzenarten haben einen Beschützer in einer geistigen Welt. Menschen, Tiere und Pflanzen sind aufeinander angewiesen. Sie leben mit- und voneinander. Keine Art darf jedoch eine andere übernutzen oder ihr sonst ungerechtfertigt Schaden zufügen. Mit dieser Einstellung leben die Mbyá seit Jahrtausenden im Einklang mit der Natur ohne sie zu zerstören.",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage('assets/houses.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Soziale Gemeinschaft",
                          style: TextStyle(fontSize: fontBig))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Die Mbyá bilden offene Gemeinschaften, deren Zusammensetzung sich immer wieder ändern kann. Entscheidungen, welche die Gemeinschaft betreffen, werden in Versammlungen, an denen alle teilnehmen können, intensiv besprochen. Erst am nächsten Tag wird die definitive Entscheidung gefällt. Geleitet wird sie von der/vom Mburuvicha, dem Oberhaupt der Gemeinschaft. Frauen und Männer sind gleichberechtigt. \n\nDie Mburuvichas der verschiedenen Gemeinschaften treffen sich zu den sogenannten „Aty´“-Versammlungen. Auch an diesen Treffen können alle Interessierten teilnehmen. In diesen Versammlungen werden, manchmal in 2- bis 3-tägigen Prozessen, gemeinschaftsübergreifende Entscheidungen getroffen.",
                      style: TextStyle(fontSize: 20.0)),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    height: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage('assets/aroundFire.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Das Zuhause der Mbyà",
                          style: TextStyle(fontSize: fontBig))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Die Häuser der Mbyá Guaraní bestehen traditionellerweise aus Palmpfosten. Die Wände werden mit einem Bambusgeflecht stabilisiert und mit lehmiger Erde isoliert. Das Dach besteht aus Rundhölzern und wird mit Palmblättern gedeckt. Heute kommen auch Bretter und Wellblech zum Einsatz. Ein wichtiger Teil der heutigen Lebensgrundlage der Mbyá ist der Pflanzenbau. Auf engstem Raum werden hauptsächlich viele verschiedene Mais-Sorten, Bohnen, Maniok, Süsskartoffeln und Melonen angebaut. Die Mbyá kennen natürlich auch alles Essbare, was im Wald gedeiht. Leider ist diese Nahrungsquelle heute stark eingeschränkt, weil die Waldstücke immer kleiner werden.",
                      style: TextStyle(fontSize: 20.0)),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage('assets/IndHouseII.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child:
                          Text("Medizin", style: TextStyle(fontSize: fontBig))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Die Mbyá Medizinerinnen und Mediziner haben, im Gegensatz zur ausschliesslich mechanistisch und chemisch orientierten Schulmedizin, einen ganzheitlichen Blick auf den Menschen und seine Gesundheit. \n\nDie Lebensaufgabe, welche ein Mensch zu erfüllen hat, ist bei den Mbyá wichtiger Teil der Diagnose. Des Weiteren kennen die Mbyá die Vielfalt der pflanzlichen Sekundärstoffe und deren Wirkung. Dank der enormen Artenvielfalt ist ihr Nutzen viel grösser als derjenige der europäischen Volksmedizin.",
                      style: TextStyle(fontSize: 20.0)),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage('assets/medecin.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
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
