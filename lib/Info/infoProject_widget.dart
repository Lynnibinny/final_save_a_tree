import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class InfoProject extends StatelessWidget {
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
            'Projekte',
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
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Folgendes Projekt ist in Bearbeitung: ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Tekoa Guapo'y Poty:",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w700)),
                        Text(
                          "24 Hektaren Hektaren - US \$ 36’000 - Vertragsabschluss 2021 \nDiese Gemeinschaft lebt direkt am Fluss Paraná. Sie ist in den letzten Jahren stark gewachsen. Das Grundstück gehört dem Erziehungsministerium und wurde bisher wegen bürokratischer Hindernisse nicht auf die Gemeinschaft übertragen. Viele Mbyá sind über den Paraná vor dem Soja-Anbau geflüchtet. Das Grundstück wird eng: Heute leben auf 18 Hektaren 35 Familien. Für sie sollen nun insgesamt rund 24 Hektaren Land erworben werden. ",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: new MaterialButton(
                      //padding: EdgeInsets.all(
                      // 20.0), //space between picture and all the widgets in it and the boarder
                      textColor: Colors.white,
                      //shape: RoundedRectangleBorder(
                      //  borderRadius:
                      //       BorderRadius.all(Radius.circular(20.0))),

                      height: 200.0,
                      splashColor: Colors.greenAccent,
                      //elevation: 8.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/Kids.jpg'),
                              fit: BoxFit.cover),
                        ),
                        child: Align(
                          //alignment: Alignment(0.0,
                          //   0.8), //to have the text and the button in the under 80 percentage
                          child: FittedBox(
                            //this way it has to fit his parent
                            child:
                                //  padding: const EdgeInsets.all(8.0),

                                SizedBox(
                              width: 200,
                              height: 400,
                              child: Center(),
                            ),

                            // ),
                          ),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Neue Projekte:',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Wald am Chafaríz, nahe Soberbio:",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        Text("400 Hektaren – US \$ 600'000",
                            style: TextStyle(fontSize: 20.0)),
                        Text(
                            "Der Chafaríz ist ein kleiner Fluss in der Nähe von Soberbio, der in den Rio Uruguay mündet. Es gibt eine grosse Gemeinschaft, die dort am Rande eines Waldes und in diesem lebt. Er gehört einem 78-jährigen Mann. Dieser lässt die Mbyá gewähren, kann aber den Wald nun ohne Nutzung nicht mehr halten. Der Schamane bat den Gott Ñanderú, dass er eine Lösung finden möge. Die Erwartungshaltung ist entsprechend gross!",
                            style: TextStyle(fontSize: 20.0)),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200.0,
                          
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Kids.jpg'),
                              //fit: BoxFit.fill,
                            ),
                            
                          ),
                        ),
                         SizedBox(
                          height: 20,
                        ),
                        Text("Westlich von Takuapí:",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        Text("20 Hektaren – US \$ 70'000",
                            style: TextStyle(fontSize: 20.0)),
                        Text(
                            "Südlich angrenzend an das Land von Takuapí kann ein Grundstück von 20 Hektaren erworben werden. Der grösste Teil davon ist Wald. Ein Bereich könnte für Hütten und Pflanzungen genutzt werden, auf 4 Hektaren steht ein Yerba Mate-Feld. Verá Mirí (Hilario Agosta) möchte dieses Grundstück für 7 Familien sicherstellen, die momentan noch direkt an einer Strasse wohnen müssen und ihren 12-jährigen Jungen durch einen Unfall auf dieser verloren haben. Sie möchten unbedingt den Ort der Trauer verlassen und ihren Kindern eine sicherere Umgebung bieten. Das Angebot des Verkäufers ist sehr hoch, da er nicht verkaufen muss. Die 20 Hektaren verbinden jedoch zwei Mäander des Cuña Pirú. Die 35 Hektaren in der Schleife des Flusses sind eine gefangene Parzelle ohne Wegrecht. Die 20 Hektaren in der Hand der Mbyá, würden daher die ganze Schleife sichern. Die Mbyá hätten zudem gemäss Artikel 75 der argentinischen Verfassung das Recht, die 35 Hektaren als Teil ihres Lebensraums zu beanspruchen, womit Eingriffe nur noch in Absprache mit ihnen möglich wären. Damit würde diese Parzelle für die weisse Eigentümerschaft praktisch wertlos.",
                            style: TextStyle(fontSize: 20.0)),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200.0,
                          
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Kids.jpg'),
                              //fit: BoxFit.fill,
                            ),
                            
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Am Rand des Provinzparks „Valle del Cuña Pirú“:",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        Text("300 Hektaren - US \$ 450’000",
                            style: TextStyle(fontSize: 20.0)),
                        Text(
                            "300 Hektaren könnten angrenzend an den Provinzpark „Valle del Cuña Pirú“ erworben werden.  Dieser unberührte Wald wäre aus ökologischer Sicht und für die Mbyá von grosser Bedeutung. In ihm leben Jaguare. Mario Borjas von Kaa'á Kupé möchte eine neue Gemeinschaft gründen und mit ihr in diesem Wald leben. ",
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
                      ]),
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
