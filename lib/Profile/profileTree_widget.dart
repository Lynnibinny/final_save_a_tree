import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfileTree extends StatelessWidget {
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
            AspectRatio(
              aspectRatio: 1 / 2,
              child: Container(
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
                      'Die Vielfalt der Tiere und Pflanzen ist von grosser Wichtigkeit. Zusammen leben sie in einer Balance, die von uns Menschen ins schwanken gebracht wird. Durch die Zerstörung von Lebensräumen einiger Arten werden wiederum andere Pflanzen oder Tiere, welche in einer Symbiose lebten aussterben. Die Gefahr der schrumpfenden Biodiversität ist, dass einzele Pflanzen oder Tiere die überhand nehmen. Die Wahrscheinlichkeit, dass einzelne Arten überleben im Falle einer Klimakrise Parasitenbefall, oder bei Krankheiten ist viel geringer als sie wäre bei einer grossen Diversität. Dies kann auch für uns Menschen schwere folgen haben, da unsere Wirtschaft auf der Landwirtschaft basiert die bei immer geringerer Biodiversität schlecht auf andere Sorten umsteigen kann.',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
