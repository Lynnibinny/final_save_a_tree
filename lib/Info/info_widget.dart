import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:save_a_tree/Info/infoAboutus_widget.dart';
import 'package:save_a_tree/Info/infoProject_widget.dart';
import 'package:save_a_tree/Info/infoBio_widget.dart';
import 'package:save_a_tree/Info/infoCulture_widget.dart';
import 'package:save_a_tree/Info/infoSupporter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class StartGoalsWidget extends StatefulWidget {
  @override
  State<StartGoalsWidget> createState() => StartGoalsState();
}

class StartGoalsState extends State<StartGoalsWidget> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87, //Button Text color
    primary: Color.fromARGB(255, 155, 203, 99), //Button background color
    minimumSize: Size(88, 36),
    shadowColor: Colors.white54, //?
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
  AssetImage BigTree;
  double _width;
  double iTop = 10.0;
  double iRight = 10.0;
  double iSize = 27.0;
  double bQuotient = 0.85;
  double borderRadius = 15;
  void asyncState() async {
    BigTree = AssetImage('assets/BigTree.jpeg');
    /*SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString('registeredUserId');
    getUser(id);
    //hand id over. Therefore getUser methode is able to compare them
    //async State because void initState does not allow async
    */
  }

  void initState() {
    //_user = [];
    //_filterUser = [];
    //_isUpdating = false;
    // _titleProgress = widget.title;
    //_scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    //_proUserNameController = TextEditingController();
    //asyncState();
    //precacheImage(new AssetImage('assets/BigTree.jpeg'),context);
    super.initState();
  }

  void main() {
    runApp(new Scaffold(
      body: new Center(
        child: new ElevatedButton(
          onPressed: _launchURL,
          child: new Text('Show Flutter homepage'),
        ),
      ),
    ));
  }

  _launchURL() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('registeredUserId');
    String url = 'https://i-kf.ch/SaveATree/spenden.php?id=' + id.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
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
                fontSize: 25,
              )),
          backgroundColor: Color(0x00000000),
          elevation: 0.0,
        ),
        body:
            /*Center(
          child: BigTree == null
              ? CircularProgressIndicator()
              : */
            Container(
          margin: EdgeInsets.symmetric(vertical: 0.0),
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

                  minWidth: 200.0,
                  splashColor: Colors.greenAccent,
                  //elevation: 8.0,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius),
                        image: DecorationImage(
                            image: AssetImage('assets/Biodiv.jpeg'),
                            fit: BoxFit.cover),
                      ),
                      child: Stack(children: [
                        Positioned(
                          top: iTop,
                          right: iRight,
                          child: Icon(
                            Icons.info_rounded,
                            size: iSize,
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.0,
                              0.8), //to have the text and the button in the under 80 percentage
                          child: FittedBox(
                            //this way it has to fit his parent
                            child: Column(
                              //  padding: const EdgeInsets.all(8.0),

                              children: [
                                SizedBox(
                                  width: _width * bQuotient,
                                  child: Center(
                                    child: Text(
                                      "Biodiversität",
                                      style: TextStyle(
                                          fontSize: 30.0, color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ), // as a Space in between

                                /*ElevatedButton(
                                    style: raisedButtonStyle,
                                    onPressed: _launchURL,
                                    child: Container(
                                      child: AutoSizeText(
                                        'Jetzt spenden',
                                        style: TextStyle(
                                            //fontSize: 30.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),*/
                              ],
                            ),
                          ),
                        ),
                      ])),
                  // ),
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
                      borderRadius: BorderRadius.circular(borderRadius),
                      image: DecorationImage(
                          image: AssetImage('assets/Kids.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(children: [
                      Positioned(
                        top: iTop,
                        right: iRight,
                        child: Icon(
                          Icons.info_rounded,
                          size: iSize,
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.0,
                            0.8), //to have the text and the button in the under 80 percentage
                        child: FittedBox(
                          //this way it has to fit his parent and it also makes the Alignement work
                          child: Column(
                            //  padding: const EdgeInsets.all(8.0),

                            children: [
                              SizedBox(
                                width: _width * bQuotient,
                                child: Center(
                                  child: Text(
                                    "Kultur",
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.white,
                                      //fontWeight: FontWeight.bold //to make the text thicker
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ), // as a Space in between

                              /*ElevatedButton(
                                  style: raisedButtonStyle,
                                  onPressed: _launchURL,
                                  child: Container(
                                    child: AutoSizeText(
                                      'Jetzt spenden',
                                      style: TextStyle(
                                          //fontSize: 25.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),*/
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
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
                      borderRadius: BorderRadius.circular(borderRadius),
                      image: DecorationImage(
                          image: AssetImage('assets/Corn.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(children: [
                      Positioned(
                        top: iTop,
                        right: iRight,
                        child: Icon(
                          Icons.info_rounded,
                          size: iSize,
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.0,
                            0.8), //to have the text and the button in the under 80 percentage
                        child: FittedBox(
                          //this way it has to fit his parent and it also makes the Alignement work
                          child: Column(
                            //  padding: const EdgeInsets.all(8.0),

                            children: [
                              SizedBox(
                                width: _width * bQuotient,
                                child: Center(
                                  child: Text(
                                    "Unterstützer",
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.white,
                                      //fontWeight: FontWeight.bold //to make the text thicker
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ), // as a Space in between

                              /*ElevatedButton(
                                  style: raisedButtonStyle,
                                  onPressed: _launchURL,
                                  child: Container(
                                    child: AutoSizeText(
                                      'Jetzt spenden',
                                      style: TextStyle(
                                          //fontSize: 25.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),*/
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoSupporter()),
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
                      borderRadius: BorderRadius.circular(borderRadius),
                      image: DecorationImage(
                          image: AssetImage('assets/Leguan.jpeg'),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(children: [
                      Positioned(
                        top: iTop,
                        right: iRight,
                        child: Icon(
                          Icons.info_rounded,
                          size: iSize,
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.0,
                            0.8), //to have the text and the button in the under 80 percentage
                        child: FittedBox(
                          //this way it has to fit his parent and it also makes the Alignement work
                          child: Column(
                            //  padding: const EdgeInsets.all(8.0),

                            children: [
                              SizedBox(
                                width: _width * bQuotient,
                                child: Center(
                                  child: Text(
                                    "Über uns",
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.white,
                                      //fontWeight: FontWeight.bold //to make the text thicker
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ), // as a Space in between

                              /*ElevatedButton(
                                  style: raisedButtonStyle,
                                  onPressed: _launchURL,
                                  child: Container(
                                    child: AutoSizeText(
                                      'Jetzt spenden',
                                      style: TextStyle(
                                          //fontSize: 25.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),*/
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),

                  // ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoAboutUs()),
                    );
                  },
                ),
              ),
              /*Container(
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
                      borderRadius: BorderRadius.circular(borderRadius),
                      image: DecorationImage(
                          image: AssetImage('assets/Kids.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(children: [
                      Positioned(
                        top: iTop,
                        right: iRight,
                        child: Icon(
                          Icons.info_rounded,
                          size: iSize,
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.0,
                            0.8), //to have the text and the button in the under 80 percentage
                        child: FittedBox(
                          //this way it has to fit his parent and it also makes the Alignement work
                          child: Column(
                            //  padding: const EdgeInsets.all(8.0),

                            children: [
                              SizedBox(
                                width: 300,
                                child: Center(
                                  child: Text(
                                    "Unterstützer",
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.white,
                                      //fontWeight: FontWeight.bold //to make the text thicker
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ), // as a Space in between

                              /*ElevatedButton(
                                  style: raisedButtonStyle,
                                  onPressed: _launchURL,
                                  child: Container(
                                    child: AutoSizeText(
                                      'Jetzt spenden',
                                      style: TextStyle(
                                          //fontSize: 25.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),*/
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),

                  // ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoSupporter()),
                    );
                  },
                ),
              )*/
              /*Container(
                child: new MaterialButton(
                  padding: EdgeInsets.all(
                      20.0), //space between picture and all the widgets in it and the boarder
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),

                  child: ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: _launchURL,
                      child: Container(
                        child: AutoSizeText(
                          'Jetzt spenden',
                          style: TextStyle(fontSize: 25.0, color: Colors.white),
                        ),
                      )),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoAboutUs()),
                    );
                  },
                ),
              ),*/
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