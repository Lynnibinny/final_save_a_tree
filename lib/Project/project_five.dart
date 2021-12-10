import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProjectFive extends StatelessWidget {
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
            'Gemeinschaft Takuapí',
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
                      child: Text('Gemeinschaft Takuapí',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Fläche so gross wie 8.5 Fussballfelder für \nCHF 7'000",
                    style: TextStyle(fontSize: 23.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
'Die Gemeinschaft lebt auf einem teilweise bewaldeten Grundstück, das von kirchlichen Kreisen in der Schweiz gekauft und den Mbyá überlassen wurde. Nachdem man ihnen ihre Hütten, Kultstätten und den Friedhof weggenommen und zerstört hatte, fanden sie hier einen neuen Lebensraum. \n\n6 Hektaren, welche an dieses neue Grundstück angrenzten, wurden von der wachsenden   Gemeinschaft besiedelt. Der Grundeigentümer wehrte sich und wollte die Hütten abreissen lassen. Soweit kam es zum Glück nicht. Sagittaria konnte in einem Vergleich dieses Grundstück für die Mbyá erwerben.',                    
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
