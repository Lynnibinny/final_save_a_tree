import 'package:flutter/material.dart';
import 'package:save_a_tree/firstscreen.dart';
import 'dart:async';
import 'package:save_a_tree/services.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Profile/profileArea_widget.dart';
import 'Profile/profileSettings_widget.dart';
import 'Profile/profileTree_widget.dart';
import 'User.dart';

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
  var filterUserPercent = 70;

  void asyncState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString('registeredUserId');
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

  void getUser(String id) {
    //_showProgress('Loading Employees...');
    Services.getUser().then((user) {
      setState(() {
        _user = user;
        // Initialize to the list from Server when reloading...
        _filterUser =
            user.where((userElement) => userElement.useId == id).toList().first;
        //output has to be one single user
        //.toList cause "where" does not return a List it just returns a where list
        //we can just use first cause in this list there is one single entry anyways
      });
      //_showProgress(widget.title); // Reset the title...
      // print("Length ${user.length}");
    });
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.white,
    elevation: 0,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );

  final ButtonStyle raisedButtonStyle1 = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.white,
    elevation: 8,
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
              : //String trees = _filterUser.UseSavedTrees;
              Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Spacer(
                      flex: 1,
                    ),

/*                    Expanded(
                        child: Container(
                          height: 150,
                          child: Align(
                            alignment: Alignment(0.0, 0.0),
                            child: AspectRatio(
                              aspectRatio: 1.5,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 50,
                                child: Container(
                                  alignment: Alignment.center,
                                  // color: Colors.grey,
                                  padding: const EdgeInsets.all(7.0),

                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Icon(
                                      Icons.local_florist,
                                      color: Colors.red.shade900,
                                      size: 50,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //SizedBox(height: 20),
*/
                    Expanded(
                      child: Stack(children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topLeft,
                              stops: [percent / 100, percent / 100],
                              colors: [
                                Colors.lightGreen[500],
                                Colors.white,
                                //Colors.lightGreen[400],
                                // Colors.lightGreen[500],
                              ],
                            ).createShader(rect);
                          },
                          child: Container(
                            width: size,
                            height: size,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('assets/TreeGreen.png'))),
                          ),
                        ),

                        /*Container(
                          width: size - 100,
                          height: size - 100,
                          decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              "$percent",
                              style: TextStyle(fontSize: 40),
                            ),
                          ),
                        ),*/
                      ]),
                    ),
                    Text(
                      _filterUser.useUserName,
                      textScaleFactor: 2.0,
                      //style: TextStyle(color: Colors.black),
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Spacer(flex: 2),
                    /* SizedBox(
                  height: 40,
                ),*/
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
                                child: ElevatedButton(
                                  style: raisedButtonStyle,
                                  onPressed: () {
                                    print('tapped');
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    // color: Colors.grey,
                                    padding: const EdgeInsets.all(
                                        10.0), //space text edge

                                    child: Container(
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
                                                AutoSizeText(
                                                  "gerettete Bäume: ${_filterUser.useSavedTrees}",
                                                  style:
                                                      TextStyle(fontSize: 17.0),
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
                                child: ElevatedButton(
                                  style: raisedButtonStyle,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProfileArea()),
                                    );
                                  },
                                  //height:
                                  //150, //take care this hight has an effect on the width
                                  child: Container(
                                    alignment: Alignment.center,
                                    // color: Colors.grey,
                                    padding: const EdgeInsets.all(
                                        10.0), //space text edge
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            child: Column(
                                              children: <Widget>[
                                                FittedBox(
                                                  child: Icon(Icons.favorite),
                                                ),
                                                SizedBox(height: 5),
                                                AutoSizeText(
                                                  "gespendetes Geld: ${_filterUser.useDonated}",
                                                  style:
                                                      TextStyle(fontSize: 17.0),
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
                        ),

                        //),
                      ],
                    ),
                    SizedBox(height: 10),
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
                                child: ElevatedButton(
                                  style: raisedButtonStyle,
                                  onPressed: () {
                                    print('tapped');
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    // color: Colors.grey,
                                    padding: const EdgeInsets.all(
                                        10.0), //space text edge

                                    child: Container(
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
                                                AutoSizeText(
                                                  "gerettete Bäume: ${_filterUser.useSavedTrees}",
                                                  style:
                                                      TextStyle(fontSize: 17.0),
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
                                child: ElevatedButton(
                                  style: raisedButtonStyle,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProfileArea()),
                                    );
                                  },
                                  //height:
                                  //150, //take care this hight has an effect on the width
                                  child: Container(
                                    alignment: Alignment.center,
                                    // color: Colors.grey,
                                    padding: const EdgeInsets.all(
                                        10.0), //space text edge
                                    child: Container(
                                      height: _height,
                                      width: _width,
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,

                                        /*
                                              children: [
                                                Stack(children: [
                                                  ShaderMask(
                                                    shaderCallback: (rect) {
                                                      return LinearGradient(
                                                        begin: Alignment
                                                            .bottomLeft,
                                                        end: Alignment.topLeft,
                                                        stops: [
                                                          percent / 100,
                                                          percent / 100
                                                        ],
                                                        colors: [
                                                          Colors
                                                              .lightGreen[500],
                                                          Colors.white,
                                                          //Colors.lightGreen[400],
                                                          // Colors.lightGreen[500],
                                                        ],
                                                      ).createShader(rect);
                                                    },
                                                    child: Container(
                                                      width: size,
                                                      height: size,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/TreeGreen.png'))),
                                                    ),
                                                  ),

                                                  /*Container(
                      width: size - 100,
                      height: size - 100,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Center(
                          child: Text(
                        "$percent",
                        style: TextStyle(fontSize: 40),
                      )),
                    
                  ),*/
                                                ]),




                                              ],
                                              */
                                      ),
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
                                          ProfileSettingsWidget()),
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
                                    "Jetzt Spenden",
                                    style: TextStyle(fontSize: 30.0),
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
                  ],
                ),
        ),
      ),
    );
  }
}
