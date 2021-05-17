import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:save_a_tree/infoAboutus_widget.dart';
import 'package:save_a_tree/infoDeforestation_widget.dart';
import 'package:save_a_tree/profileSettings_widget.dart';
import 'package:save_a_tree/infoBio_widget.dart';
import 'package:save_a_tree/infoCulture_widget.dart';

class StartGoalsWidget extends StatelessWidget {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87, //Button Text color
    primary: Colors.lightGreen[300], //Button background color
    minimumSize: Size(88, 36),

    shadowColor: Colors.white54, //?
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );

  Widget build(BuildContext context) {
    final title = 'Info';
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
          //backgroundColor: Colors.lightGreen[300],
          title: Text(title,
              style: TextStyle(
                color: Colors.black,
              )),
          backgroundColor: Color(0x00000000),
          elevation: 0.0,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          //height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                child: new MaterialButton(
                  padding: EdgeInsets.all(
                      20.0), //space between picture and all the widgets in it and the boarder
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),

                  //minWidth: 200.0,
                  splashColor: Colors.greenAccent, //Fill color on pressed
                  elevation: 8.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          15), // to make the corners round from the pictures

                      image: DecorationImage(
                          image: AssetImage('assets/Biodiv.jpeg'),
                          fit: BoxFit.cover),
                    ),
                    child: Align(
                      alignment: Alignment(0.0,
                          0.8), //to have the text and the button in the under 80 percentage
                      child: FittedBox(
                        //this way it has to fit his parent
                        child: Column(
                            //  padding: const EdgeInsets.all(8.0),

                            children: [
                              SizedBox(
                                width: 300,
                                //height: (MediaQuery.of(context).viewPadding),
                                child: Center(
                                  child: Text(
                                    "Biodiversität",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.white,
                                      //fontWeight: FontWeight.bold //to make the text thicker
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ), // as a Space in between

                              ElevatedButton(
                                style: raisedButtonStyle,
                                onPressed: () {
                                  print('Tapped');
                                },
                                child: Container(
                                  child: AutoSizeText(
                                    'Jetzt spenden',
                                    style: TextStyle(
                                        //fontSize: 25.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoBio()),
                    );
                  },
                ),
              ),
              Container(
                child: new MaterialButton(
                  padding: EdgeInsets.all(
                      20.0), //space between picture and all the widgets in it and the boarder
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),

                  minWidth: 200.0,
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
                      alignment: Alignment(0.0,
                          0.8), //to have the text and the button in the under 80 percentage
                      child: FittedBox(
                        //this way it has to fit his parent
                        child: Column(
                          //  padding: const EdgeInsets.all(8.0),

                          children: [
                            SizedBox(
                              width: 300,
                              child: Center(
                                child: Text(
                                  "Kultur",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.white,
                                    //fontWeight: FontWeight.bold //to make the text thicker
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ), // as a Space in between

                            ElevatedButton(
                                style: raisedButtonStyle,
                                onPressed: () {
                                  print('Tapped');
                                },
                                child: Container(
                                  child: AutoSizeText(
                                    'Jetzt spenden',
                                    style: TextStyle(
                                        //fontSize: 25.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoCulture()),
                    );
                  },
                ),
              ),
              Container(
                child: new MaterialButton(
                  padding: EdgeInsets.all(
                      20.0), //space between picture and all the widgets in it and the boarder
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),

                  minWidth: 200.0,
                  splashColor: Colors.greenAccent,
                  //elevation: 8.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage('assets/BigTree.jpeg'),
                          fit: BoxFit.cover),
                    ),
                    child: Align(
                      alignment: Alignment(0.0,
                          0.8), //to have the text and the button in the under 80 percentage
                      child: FittedBox(
                        //this way it has to fit his parent
                        child: Column(
                          //  padding: const EdgeInsets.all(8.0),

                          children: [
                            SizedBox(
                              width: 300,
                              child: Center(
                                child: Text(
                                  "Abholzung",
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ), // as a Space in between

                            ElevatedButton(
                                style: raisedButtonStyle,
                                onPressed: () {
                                  print('Tapped');
                                },
                                child: Container(
                                  child: AutoSizeText(
                                    'Jetzt spenden',
                                    style: TextStyle(
                                        //fontSize: 25.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ),
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoDeforestation()),
                    );
                  },
                ),
              ),
              Container(
                child: new MaterialButton(
                  padding: EdgeInsets.all(
                      20.0), //space between picture and all the widgets in it and the boarder
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),

                  minWidth: 200.0,
                  splashColor: Colors.greenAccent,
                  //elevation: 8.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage('assets/Leguan.jpeg'),
                          fit: BoxFit.cover),
                    ),
                    child: Align(
                      alignment: Alignment(0.0,
                          0.8), //to have the text and the button in the under 80 percentage
                      child: FittedBox(
                        //this way it has to fit his parent
                        child: Column(
                          //  padding: const EdgeInsets.all(8.0),

                          children: [
                            SizedBox(
                              width: 300,
                              child: Center(
                                child: Text(
                                  "Über uns",
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ), // as a Space in between

                            ElevatedButton(
                                style: raisedButtonStyle,
                                onPressed: () {
                                  print('Tapped');
                                },
                                child: Container(
                                  child: AutoSizeText(
                                    'Jetzt spenden',
                                    style: TextStyle(
                                        //fontSize: 25.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoAboutUs()),
                    );
                  },

                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*class StartGoalsWidget extends StatelessWidget {
  //var promail = "uiuiuiuiui@me.com";
  Future<User> createUser(String promail) async {
    //future da es in der Zukunft einen User machen wird. Es blockt also den Code nicht.
    final response = await http.post(
      Uri.https('i-kf.ch', '/SaveATree/lib/insertdata.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'ProMail': promail,
      }),
    );
    
    //print(response.statusCode);
    if (response.statusCode == 200) {
      print('hurraa');
    } else {
      throw Exception('Faillll');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spaceholderscreen for "StartGoalsWidget"'),
      ),
      body: Center(
        child: RaisedButton(
            onPressed: () {}, color: Colors.green, child: Text(':)')),
      ),
    );
  }
}*/
