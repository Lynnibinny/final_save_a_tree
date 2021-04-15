import 'package:flutter/material.dart';
//import 'package:save_a_tree/startmap_widget.dart';
import 'package:save_a_tree/profileSettings_widget.dart';

class StartProfileWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    const SizedBox(height: 30);
    return Scaffold(
      //create appbar
      appBar: AppBar(
        //create title which will be showed in the appbar
        title: Text('Profile'),
        //create button to navigat to the profilesettings
        actions: <Widget>[
          IconButton(
            //set the setting-icon as a button
            icon: Icon(
              Icons.settings,
              color: Colors.white,
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
      body: Center(
        //create Button
        child: RaisedButton(
          child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
          //change current Widget when pressed
          onPressed: () {
            null;
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => StartMapWidget()),
            // );
          },
        ),
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
