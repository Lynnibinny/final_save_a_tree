import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';

class InfoBio extends StatelessWidget {
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
            'Biodiversität',
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
            //AspectRatio(
            // aspectRatio: 1 / 2,
            // child:
            Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Text('Unsere wertvollste Resource',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    'Die Vielfalt der Tiere und Pflanzen ist von grosser Wichtigkeit. Zusammen leben sie in einer Balance, die von uns Menschen ins schwanken gebracht wird. Durch die Zerstörung von Lebensräumen einiger Arten werden wiederum andere Pflanzen oder Tiere, welche in einer Symbiose lebten aussterben.',
                    style: TextStyle(fontSize: 20.0),
                  ),

                  /*Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('assets/BigTree.jpeg'),
                            fit: BoxFit.cover),
                      ),
                      child: FittedBox(
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                    ),*/

                  //Bild einfügen?!
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
                              child: Center(
                                  /*child: Text(
                                  "Kultur",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.bold //to make the text thicker
                                  ),
                                ),*/
                                  ),
                            ),

                            // ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    'Die Gefahr der schrumpfenden Biodiversität ist, dass einzele Pflanzen oder Tiere die überhand nehmen. Die Wahrscheinlichkeit, dass einzelne Arten überleben im Falle einer Klimakrise Parasitenbefall, oder bei Krankheiten ist viel geringer als sie wäre bei einer grossen Diversität. Dies kann auch für uns Menschen schwere folgen haben, da unsere Wirtschaft auf der Landwirtschaft basiert die bei immer geringerer Biodiversität schlecht auf andere Sorten umsteigen kann.',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
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
                      )),
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
