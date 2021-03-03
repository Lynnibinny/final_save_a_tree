import 'package:flutter/material.dart';

import 'package:save_a_tree/startgoals_widget.dart';
import 'package:save_a_tree/startmap_widget.dart';
import 'package:save_a_tree/startcomunity_widget.dart';
import 'package:save_a_tree/startprofile_widget.dart';

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
    //selected Widget = Widget list

    StartGoalsWidget(),
    StartMapWidget(),
    StartComunityWidget(),
    StartProfile(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save A Tree'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      backgroundColor: Colors.green,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,

        currentIndex: _currentIndex,

        type: BottomNavigationBarType
            .fixed, //has to be fixed to get the text and the icons for more then three

        items: [
          BottomNavigationBarItem(
            //index 0

            icon: new Icon(
              Icons.eco,
              color: Colors.black,
            ),

            title: new Text('Goals'),
          ),
          BottomNavigationBarItem(
            //index 1

            icon: new Icon(
              Icons.map_outlined,
              color: Colors.black,
            ),

            title: new Text('Map'),
          ),
          BottomNavigationBarItem(
            //index 2

            icon: Icon(
              Icons.chat_bubble_outline,
              color: Colors.black,
            ),

            title: Text('Community'),
          ),
          BottomNavigationBarItem(
            //index 3

            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),

            title: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
