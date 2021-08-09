import 'package:flutter/material.dart';

import 'dart:async';
import 'package:save_a_tree/services.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Profile/profileArea_widget.dart';
import 'Profile/profileSettings_widget.dart';

import 'User.dart';
import 'profileGoals_widget.dart';

class StartProfileWidget extends StatefulWidget {
  @override
  _StartProfileWidgetState createState() => _StartProfileWidgetState();
}

class _StartProfileWidgetState extends State<StartProfileWidget> {
  List<bool> _selections = List.generate(3, (_) => false);

  User _filterUser;

  List<User> _user = [];
  double _height;
  double _width;

  var percent = 0;
  double filterUserPercent = 0;

  void asyncState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('registeredUserId');
    getUser(id);
    //hand id over. Therefore getUser methode is able to compare them
    //async State because void initState does not allow async
  }

  void initState() {
    Timer timer;

    timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      print('Percent Update');
      setState(() {
        percent += 1;
       /* if (_filterUser != null) {
          filterUserPercent =
              calcPercent(_filterUser.useGoals, _filterUser.useSavedTrees);
        }*/
        if (percent >= filterUserPercent) {
          timer.cancel();
          // percent=0;
        }
      });
    });
    //_user = [];
    //_filterUser = [];
    //_isUpdating = false;
    // _titleProgress = widget.title;
    //_scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    //_proUserNameController = TextEditingController();
    asyncState();
    super.initState();
  }

  /*double calcPercent(int savedTrees, int goals) {
    if (goals > 0) {
      return (100 / goals * savedTrees);
    } else {
      return (0);
    }
  }*/

  void getUser(int id) {
    //_showProgress('Loading Employees...');
    Services.getUser().then((user) {
      setState(() {
        _user = user;
        // Initialize to the list from Server when reloading...
        _filterUser = user.where((userElement) => userElement.useId == id).toList().first;
        //output has to be one single user
        //.toList cause "where" does not return a List it just returns a where list
        //we can just use first cause in this list there is one single entry anyways
      });
      //_showProgress(widget.title); // Reset the title...
      // print("Length ${user.length}");
    });
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87, //Textcolor
    primary: Colors.white, //Backgroundcolor
    elevation: 0,
    onSurface: Colors.amber,

    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );

  final ButtonStyle raisedButtonStyle1 = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.white,
    elevation: 30,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );

  Widget build(BuildContext context) {
    final size = 50.0;
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    const SizedBox(height: 30);

    //),

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
        //create appbar
        appBar: AppBar(
          //foregroundColor: Colors.white,
          //create title which will be showed in the appbar

          title: const Text('Profile',
              style: TextStyle(
                color: Colors.black,
              )),
          backgroundColor: Color(0x00000000),
          elevation: 0.0,
          //create button to navigate to the profilesettings
          actions: <Widget>[
            IconButton(
              //set the setting-icon as a button
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              //change current Widget when button was pressed
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileSettingsWidget()),
                );
              },
            ),
          ],
        ),
        backgroundColor: Color(0x00000000),
        body: Center(
          child: _filterUser == null
              ? CircularProgressIndicator()
              :
              //String trees = _filterUser.UseSavedTrees;

              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                      //Spacer(flex: 1),
                      Center(
                        child: Container(
                            alignment: Alignment.center,
                            // color: Colors.grey,
                            //padding:const EdgeInsets.all(10.0), //space text edge
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                height: _height / 6,
                                //width: _width / 3,
                                //padding: EdgeInsets.all(20),
                                //color: Colors.white,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Stack(children: [
                                      ShaderMask(
                                        shaderCallback: (rect) {
                                          return LinearGradient(
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topLeft,
                                            stops: [
                                              percent / 100,
                                              percent / 100
                                            ],
                                            colors: [
                                              Colors.lightGreen[500],
                                              Colors.white,
                                              //Colors.lightGreen[400],
                                              // Colors.lightGreen[500],
                                            ],
                                          ).createShader(rect);
                                        },
                                        child: Container(
                                          height: _height / 8,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/TreeGreen.png'))),
                                        ),
                                      ),
                                    ]),
                                  ],
                                ))),
                      ), //Tree

                      SizedBox(height: 20),
                      Text(
                        _filterUser.useUserName,
                        textScaleFactor: 2.0,
                        //style: TextStyle(color: Colors.black),
                        style: TextStyle(fontSize: 30.0),
                      ),
                      SizedBox(height: _height / 30), //UserName
                      //Spacer(flex:1),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 110,
                              child: Align(
                                alignment: Alignment(0.6, 0.0),
                                //child: Center(
                                child: AspectRatio(
                                  aspectRatio: 1.5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      color: Colors.white,
                                    ),

                                    //color: Colors.white,
                                    // ),
                                    padding: const EdgeInsets.all(
                                        10.0), //space text edge
                                    child: Align(
                                      alignment: Alignment.center,
                                      //color: Colors.white,

                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            child: Column(
                                              children: <Widget>[
                                                FittedBox(
                                                  child: Icon(
                                                    Icons.eco,
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                FittedBox(
                                                  child: AutoSizeText(
                                                    "Gerettete \nBäume: ${_filterUser.useSavedTrees}",
                                                    style: TextStyle(
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                //first we had it all in ElevatedButtons so we could define the buttonstyle on top. But we couldn't
                                                //delete the on Pressed function so the user would always see that it is a button. Now we wrapped it in a container with decorations. To still have the
                                                //Button Textsize we used FontWeight.w500.

                                                /* AutoSizeText(
                                                    _filterUser.UseSavedTrees,
                                                  ),*/
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              //color: Colors.amber,
                              height: 110,
                              child: Align(
                                alignment: Alignment(-0.6, 0.0),
                                //child: Center(
                                child: AspectRatio(
                                  aspectRatio: 1.5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      color: Colors.white,
                                    ),

                                    //color: Colors.white,
                                    // ),
                                    padding: const EdgeInsets.all(
                                        10.0), //space text edge
                                    child: Align(
                                      alignment: Alignment.center,
                                      //color: Colors.white,

                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            child: Column(
                                              children: <Widget>[
                                                FittedBox(
                                                  child: Icon(Icons.favorite),
                                                ),
                                                SizedBox(height: 5),
                                                FittedBox(
                                                  child: AutoSizeText(
                                                    "Gespendetes \nGeld: ${_filterUser.useDonated}",
                                                    style: TextStyle(
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),

                                                /* AutoSizeText(
                                                    _filterUser.UseSavedTrees,
                                                  ),*/
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //),
                        ],
                      ), //The two top Widgets of the for end here
                      SizedBox(height: _height / 40),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 110,
                              child: Align(
                                alignment: Alignment(0.6, 0.0),
                                //child: Center(
                                child: AspectRatio(
                                  aspectRatio: 1.5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      color: Colors.white,
                                    ),

                                    //color: Colors.white,
                                    // ),
                                    padding: const EdgeInsets.all(
                                        10.0), //space text edge
                                    child: Align(
                                      alignment: Alignment.center,
                                      //color: Colors.white,

                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            child: Column(
                                              children: <Widget>[
                                                FittedBox(
                                                  child: Icon(
                                                    Icons
                                                        .assistant_photo_rounded,
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                FittedBox(
                                                  child: AutoSizeText(
                                                    "${_filterUser.useGoals} Bäume zu retten \nist Dein Ziel",
                                                    style: TextStyle(
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),

                                                /* AutoSizeText(
                                                    _filterUser.UseSavedTrees,
                                                  ),*/
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: Container(
                              //color: Colors.amber,
                              height: 110,
                              child: Align(
                                alignment: Alignment(-0.6, 0.0),
                                //child: Center(
                                child: AspectRatio(
                                  aspectRatio: 1.5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      color: Colors.white,
                                    ),

                                    //color: Colors.white,
                                    // ),
                                    padding: const EdgeInsets.all(
                                        10.0), //space text edge
                                    child: Align(
                                      alignment: Alignment.center,
                                      //color: Colors.white,

                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            child: Column(
                                              children: <Widget>[
                                                FittedBox(
                                                  child:
                                                      Icon(Icons.celebration),
                                                ),
                                                SizedBox(height: 5),
                                                FittedBox(
                                                  child: AutoSizeText(
                                                    "$percent % hast Du \nbereits erreicht",
                                                    style: TextStyle(
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),

                                                /* AutoSizeText(
                                                    _filterUser.UseSavedTrees,
                                                  ),*/
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //),
                        ],
                      ),

                      SizedBox(height: 20),
                      Expanded(
                        child: Container(
                          //color: Colors.amber,
                          height: 80,
                          child: Align(
                            alignment: Alignment(0.0, 0.0),
                            //child: Center(
                            child: AspectRatio(
                              aspectRatio: 9 / 2,
                              child: ElevatedButton(
                                style: raisedButtonStyle1,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProfileGoalsWidget()),
                                  );
                                },
                                //height:
                                //150, //take care this hight has an effect on the width

                                child: Container(
                                  alignment: Alignment.center,
                                  //color: Colors.grey,
                                  padding: const EdgeInsets.all(10.0),

                                  child: Container(
                                    child: AutoSizeText(
                                      "Jetzt Ziel setzen",
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                    ]),
        ),
      ),
    );
  }
}
