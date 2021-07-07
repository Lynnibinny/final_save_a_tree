import 'package:flutter/material.dart';

import 'package:save_a_tree/Info/info_widget.dart';
import 'package:save_a_tree/startcomunity_widget.dart';
import 'package:save_a_tree/startprofile_widget.dart';

import 'Map/startmap_widget.dart';

class Nav extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavState();
  }
}

class _NavState extends State<Nav> {
  int _currentIndex =
      0; // current Index to describe which Icon in the Nav Bar is pressed

  List<Widget> _widgetOptions = <Widget>[
    StartGoalsWidget(),
    HomePage(),
    //StartComunityWidget(),
    StartProfileWidget(),
  ]; //selected Widget = Widget list

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  } //index saved in current index

  @override
  Widget build(BuildContext context) {
    /*return Container(
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
      ),*/
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Save A Tree'),
      ),*/
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        //elevation: 0.5,
        //backgroundColor: Color(0x00000000),
        backgroundColor: Colors.white12,
        currentIndex: _currentIndex,

        type: BottomNavigationBarType
            .fixed, //has to be fixed to get the text and the icons for more then three

        items: [
          BottomNavigationBarItem(
            //index 0

            icon: new Icon(
              Icons.eco,
              color: Colors.white,
            ),

            title: new Text(
              'Info',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            //index 1

            icon: new Icon(
              Icons.map_outlined,
              color: Colors.white,
            ),

            title: new Text(
              'Map',
              style: TextStyle(color: Colors.white),
            ),
          ),

          /*BottomNavigationBarItem(
              //index 2

              icon: Icon(
                Icons.chat_bubble_outline,
                color: Colors.black,
              ),

              title: Text(
                'Community',
                style: TextStyle(color: Colors.black),
              ),
            ),
            */
          BottomNavigationBarItem(
            //index 3

            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),

            title: Text(
              'Profil',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
