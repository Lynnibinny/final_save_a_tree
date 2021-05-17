import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StartGoalsWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    final title = 'Info';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(title,
              style: TextStyle(
                color: Colors.black,
              )),
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
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),

                  minWidth: 200.0,
                  splashColor: Colors.greenAccent,
                  //elevation: 8.0,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
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
                            Text(
                              "Biodiversitättttttttttttttttttttt",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 20,
                            ), // as a Space in between

                            MaterialButton(
                              padding: EdgeInsets.all(
                                  8.0), //space between button and text also button size

                              textColor: Colors.black,
                              color: Colors.greenAccent,
                              elevation: 8.0,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Jetzt Spenden"),
                                ),
                              ),
                              // ),
                              onPressed: () {
                                print('Tapped');
                              },
                            ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // ),
                  onPressed: () {
                    print('Tapped');
                  },
                ),
              ),
              Container(
                child: new MaterialButton(
                  padding: EdgeInsets.all(8.0),
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),

                  minWidth: 200.0,
                  splashColor: Colors.greenAccent,
                  elevation: 8.0,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Align(
                      alignment: Alignment(0.0, 0.8),
                      child: FittedBox(
                        child: Column(
                          //  padding: const EdgeInsets.all(8.0),

                          children: [
                            Text(
                              "Biodiversität",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            MaterialButton(
                              padding: EdgeInsets.all(8.0),

                              textColor: Colors.black,
                              color: Colors.greenAccent,
                              elevation: 8.0,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Jetzt Spenden"),
                                ),
                              ),
                              // ),
                              onPressed: () {
                                print('Tapped');
                              },
                            ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // ),
                  onPressed: () {
                    print('Tapped');
                  },
                ),
              ),
              Container(
                child: new MaterialButton(
                  padding: EdgeInsets.all(8.0),
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),

                  minWidth: 200.0,
                  splashColor: Colors.greenAccent,
                  elevation: 8.0,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Align(
                      alignment: Alignment(0.0, 0.8),
                      child: FittedBox(
                        child: Column(
                          //  padding: const EdgeInsets.all(8.0),

                          children: [
                            Text(
                              "Biodiversität",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            MaterialButton(
                              padding: EdgeInsets.all(8.0),

                              textColor: Colors.black,
                              color: Colors.greenAccent,
                              elevation: 8.0,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Jetzt Spenden"),
                                ),
                              ),
                              // ),
                              onPressed: () {
                                print('Tapped');
                              },
                            ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // ),
                  onPressed: () {
                    print('Tapped');
                  },
                ),
              ),
              Container(
                child: new MaterialButton(
                  padding: EdgeInsets.all(8.0),
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),

                  minWidth: 200.0,
                  splashColor: Colors.greenAccent,
                  elevation: 8.0,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Align(
                      alignment: Alignment(0.0, 0.8),
                      child: FittedBox(
                        child: Column(
                          //  padding: const EdgeInsets.all(8.0),

                          children: [
                            Text(
                              "Biodiversität",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            MaterialButton(
                              padding: EdgeInsets.all(8.0),

                              textColor: Colors.black,
                              color: Colors.greenAccent,
                              elevation: 8.0,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Jetzt Spenden"),
                                ),
                              ),
                              // ),
                              onPressed: () {
                                print('Tapped');
                              },
                            ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // ),
                  onPressed: () {
                    print('Tapped');
                  },
                ),
              ),
              Container(
                child: new MaterialButton(
                  padding: EdgeInsets.all(8.0),
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),

                  minWidth: 200.0,
                  splashColor: Colors.greenAccent,
                  elevation: 8.0,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Align(
                      alignment: Alignment(0.0, 0.8),
                      child: FittedBox(
                        child: Column(
                          //  padding: const EdgeInsets.all(8.0),

                          children: [
                            Text(
                              "Biodiversität",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            MaterialButton(
                              padding: EdgeInsets.all(8.0),

                              textColor: Colors.black,
                              color: Colors.greenAccent,
                              elevation: 8.0,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Jetzt Spenden"),
                                ),
                              ),
                              // ),
                              onPressed: () {
                                print('Tapped');
                              },
                            ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // ),
                  onPressed: () {
                    print('Tapped');
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
