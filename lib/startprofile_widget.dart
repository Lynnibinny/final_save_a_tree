import 'package:flutter/material.dart';
import 'package:save_a_tree/services.dart';
import 'package:save_a_tree/profileSettings_widget.dart';
import 'package:save_a_tree/startcomunity_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'User.dart';
import 'nav.dart';

var savedtrees = 100;

class StartProfileWidget extends StatefulWidget {
  @override
  _StartProfileWidgetState createState() => _StartProfileWidgetState();
}

class _StartProfileWidgetState extends State<StartProfileWidget> {
  List<bool> _selections = List.generate(3, (_) => false);

  User _filterUser;

  List<User> _user = [];
  void asyncState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString('registeredUserId');
    getUser(id);
    //hand id over. Therefore getUser methode is able to compare them
    //async State because void initState does not allow async
  }

  void initState() {
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
            user.where((userElement) => userElement.id == id).toList().first;
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
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  Widget build(BuildContext context) {
    const SizedBox(height: 30);

    return Scaffold(
      //create appbar
      appBar: AppBar(
        //foregroundColor: Colors.white,
        //create title which will be showed in the appbar

        title: const Text('Profile',
            style: TextStyle(
              color: Colors.black,
            )),
        //create button to navigat to the profilesettings
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
      backgroundColor: Colors.blue.shade100,
      body: Center(
        //child: CircularProgressIndicator(),
        child: _filterUser == null
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                    /*SizedBox(
                  height: 200.0,
                ),*/
                    Spacer(
                      flex: 2,
                    ),
                    Expanded(
                      child: Container(
                        height: 150,
                        child: Align(
                          alignment: Alignment(0.0, 0.0),
                          //child: Center(
                          child: AspectRatio(
                            aspectRatio: 1.5,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              child: Container(
                                alignment: Alignment.center,
                                // color: Colors.grey,
                                padding: const EdgeInsets.all(10.0),

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
                    Text(
                      _filterUser.proUserName,
                      textScaleFactor: 2.0,
                      //style: TextStyle(color: Colors.black),
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Spacer(),
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileSettingsWidget()),
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    // color: Colors.grey,
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.eco,
                                            size: 40.0,
                                          ),
                                          AutoSizeText(
                                            "gerettete Bäume: 5",
                                            style: TextStyle(fontSize: 20.0),
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
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.emoji_people_sharp,
                                            size: 40.0,
                                          ),
                                          AutoSizeText(
                                            "dein Team",
                                            style: TextStyle(fontSize: 20.0),
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
                    Spacer(),
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
                              style: raisedButtonStyle,
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
                  ]),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:save_a_tree/startcomunity_widget.dart';
import 'package:save_a_tree/startgoals_widget.dart';

class StartProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StartProfileState();
  }
}

class _StartProfileState extends State<StartProfile> {
  int _currentIndex = 0;

  void function1() {
    setState(() {
      _currentIndex = 1;
    });
  }

  void function2() {
    setState(() {
      _currentIndex = 2;
    });
  }

  List<Widget> _widgetoptions = Widget[
    StartProfile(),
    StartGoalsWidget(),
    StartMapWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      //Container(
      //width: 50,
      //height: 50,
      children: [
        child: _widgetOptions.elementAt(_currentIndex),
        backgroundColor: Colors.green,
        FittedBox(
          alignment: Alignment.center,
          child: //<Widget> [
              ElevatedButton(
            onPressed: function,
            child: Column(children: <Widget>[
              Icon(Icons.cake),
              Text("en guete"),
              currentIndex: _currentIndex;
            ]),
          ),
        ),
        FittedBox(
          alignment: Alignment.center,
          child: //<Widget> [
              ElevatedButton(
            onPressed: function,
            child: Column(children: <Widget>[
              Icon(Icons.play_arrow_outlined),
              Text("viel Spass"),
            ]),
          ),
        ),
      ],
    );
  }
}

class _Container extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
//      margin: new EdgeInsets.all(8.0),
      child: ListBody(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 200,
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: new TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Product Name', border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
*/

/*class _AppBar extends State<StartProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
    );
  }
}
*/
//
/*class Nav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavState();
  }
}

class _NavState extends State<Nav> {
  int _currentIndex = 0; //current Index to describe wheter button was pressed or not

  void onPressedPressed() {
    setState(() {
      _currentIndex = 1;
    });
  }

  Widget buildButton(BuildContext context) {
    return new Scaffold(
      body: new ElevatedButton(
        child: Text("Button"),
        child: Icon(Icons.access_alarm),
        onPressed: onPressedPressed,
      ),
    );
  }

import 'package:save_a_tree/main.dart';
import 'package:save_a_tree/startgoals_widget.dart';

var ProUserName = "Yarina";

class StartProfileWidget extends StatelessWidget {
  List<bool> _selections = List.generate(3, (_) => false);
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        SizedBox(
          height: 250.0,
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50,
          child: Icon(
            Icons.local_florist,
            color: Colors.red.shade900,
            size: 50,
          ),
        ),
        Text(
          ProUserName,
          textScaleFactor: 2.0,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        */
/* TextFormField(
  decoration: InputDecoration(
    labelText: 'Enter your username'
  ),
);
      ]),
    );
  }
}
*/
/*class StartProfileWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    const SizedBox(height: 30);
    return Center(
        child: SizedBox(
      width: 200.0,
      height: 300.0,
      child: const Card(child: Text('Hello World!')),
    ));
  }

  Widget buildButton(BuildContext context) {
    const SizedBox(height: 30);
    return Center(
      child: RaisedButton(
        onPressed: () {},
        child: const Text('Jetzt spenden!', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
*/
/*void main () async{
  class Profile {
    final int id;
    final String name;
    final Image picture;
    final int trees;
    final int money;

    Profile({this.id, this.name, this.age});
  }
}
*/
