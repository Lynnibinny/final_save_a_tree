import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProjectTwo extends StatelessWidget {
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
            Colors.lightGreen[500],
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Westlich von Takuapí',
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
                      child: Text('Westlich von Takuapí',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Fläche so gross wie 14 Fussballfelder für \nUS \$70’000 ",
                    style: TextStyle(fontSize: 23.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Südlich angrenzend an das Land von Takuapí kann ein Grundstück von 20 Hektaren erworben werden. Der grösste Teil davon ist Wald. Ein Bereich könnte für Hütten und Pflanzungen genutzt werden, auf 4 Hektaren steht ein Yerba Mate-Feld. Verá Mirí (Hilario Agosta) möchte dieses Grundstück für 7 Familien sicherstellen, die momentan noch direkt an einer Strasse wohnen müssen und ihren 12-jährigen Jungen durch einen Unfall auf dieser verloren haben.',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 350.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage('assets/youngLeader.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Sie möchten unbedingt den Ort der Trauer verlassen und ihren Kindern eine sicherere Umgebung bieten. Das Angebot des Verkäufers ist sehr hoch, da er nicht verkaufen muss. Die 20 Hektaren verbinden jedoch zwei Mäander des Cuña Pirú. Die 35 Hektaren in der Schleife des Flusses sind eine gefangene Parzelle ohne Wegrecht. Die 20 Hektaren in der Hand der Mbyá, würden daher die ganze Schleife sichern. Die Mbyá hätten zudem gemäss Artikel 75 der argentinischen Verfassung das Recht, die 35 Hektaren das entspricht 25 Fussballfelder als Teil ihres Lebensraums zu beanspruchen, womit Eingriffe nur noch in Absprache mit ihnen möglich wären. Damit würde diese Parzelle für die weisse Eigentümerschaft praktisch wertlos.',
                    style: TextStyle(fontSize: 20.0),
                  ),
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
