import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProjectSix extends StatelessWidget {
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
            'Amba’y Poty',
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
                      child: Text('Amba’y Poty',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Fläche so gross wie 28 Fussballfelder für \nCHF 27’834",
                    style: TextStyle(fontSize: 23.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
'Diese Gemeinschaft hatte sich in einem Privatwald niedergelassen. Der Eigentümer wollte sie vertreiben, konnte jedoch dazu überredet werden, den Wald zu günstigen Bedingungen abzutreten. Heute ist die Gemeinschaft Eigentümerin ihres 20 Hektaren grossen Waldstückes.',
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
