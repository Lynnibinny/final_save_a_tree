import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class InfoCulture extends StatelessWidget {
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
            Colors.lightGreen[500],
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
                  Text('Kultur der Mbyá Guaraní',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Die Mbyá Guarani sind eine indigene Bevölkerungsgruppe in Südamerika. Indigen bedeutet, dass sie von einer Bevölkerungsgruppe abstammen, die das Land oder eine Region zum Zeitpunkt der Eroberung oder Kolonialisierung bewohnt hatten. Sie leben in einer Symbiose mit dem Wald und beziehen ihre ganze medizinische Versorgung aus den Pflanzen des Waldes. Der subtropische Regenwald von Argentinien war schon lange vor der Kolonialisierung ihr zuhause. Die Mbyá haben eine Kultur bei welcher Demut, Akzeptanz und Achtsamkeit im Mittelpunkt stehen. Ihre Häuser bauen sie mit Bambus und sie kochen mit Feuer.',
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
                              image: AssetImage('assets/aroundFire.jpeg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Ihnen ist nicht geholfen, wenn die Regierung Häuser aus Zement baut. (vgl. Doku 2 von) Das Feuer wird aber nicht nur zum Kochen gebraucht, es ist auch der Platz, an dem ihre Kultur durch das Erzählen von Geschichten weitergegeben wird. Die Mbyá haben nämlich keine Schrift in ihrer Sprache. In Argentinien sind die Waldbestände kritisch, weshalb die Mbyá zur Schule gehen müssen, um auch langfristig Nahrung besorgen zu können. Immer mehr Familien müssen sich Einnahmen sichern, weswegen viele ihre selbstgemachten Körbe oder Kunstwerke verkaufen. Auch für ihre medizinische Versorgung stellt die Waldrodung grosse Probleme dar. Die Mbyá haben ein von Schamane zu Schamane weitergegebenes Wissen über die Heilpflanzen im Wald. Doch es wird immer schwieriger für sie, die richtigen Pflanzen zu finden (sagittaria.prostevia.ch).  «Wir sind nicht arm, wenn wir nicht haben, was wir nicht brauchen. Arm sind wir erst, wenn wir keinen Wald mehr haben.» (Jachukà Reté) Dieser Bevölkerungsgruppe steht das Recht zu, Wald steuerfrei zu besitzen. Jedoch dürfen sie ihn nicht roden oder weiterverkaufen.',
                    style: TextStyle(fontSize: 20.0)),
                  
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
                      Container(
                          height: 250.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            image: DecorationImage(
                              image: AssetImage('assets/indHouse.jpeg'),
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
