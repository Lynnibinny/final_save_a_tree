/*----------------------------------------------------------------------------------
nav.dart

Author: Lynn Nüesch and Yarina Vetterli
Date: 10.12.2021

History:
Version Date Who Changes

Copyright © 2021 Lynn Nüesch und Yarina Vetterli, Switzerland. All rights reserved.
-----------------------------------------------------------------------------------*/
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:save_a_tree/Info/info_widget.dart';
import 'package:save_a_tree/Project/project_widget.dart';
import 'package:save_a_tree/startprofile_widget.dart';
import 'Map/startmap_widget.dart';

class Nav extends StatefulWidget {
  final int? index;
  Nav({this.index});
  @override
  _NavState createState() => _NavState(index: index);

  // @override
  // State<StatefulWidget> createState() {
  //  return _NavState();
  //}
}

class _NavState extends State<Nav> {
  late int _currentIndex;
  //late int _totalNotifications;
  _NavState({int? index}) {
    _currentIndex = index ?? 0;
  }
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    if (message.data['type'] == 'goal') {
      Navigator.pushNamed(
        context,
        '/goal',
        //arguments: ChatArguments(message),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        Navigator.pushNamed(
          context,
          '/goal',
          // arguments: MessageArguments(message, true),
        );
      }
    });
    // Run code required to handle interacted messages in an async function
    // as initState() must not be async
    setupInteractedMessage();
  }
  //int _currentIndex =
  //    0; // current Index to describe which Icon in the Nav Bar is pressed

  List<Widget> _widgetOptions = <Widget>[
    StartProjectWidget(),
    StartMapWidget(),
    StartGoalsWidget(),
    StartProfileWidget(),
  ]; //selected Widget = Widget list

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  } //index saved in current index

  @override
  Widget build(BuildContext context) {
    //return Text(_currentIndex.toString());

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        //elevation: 0.5,
        //backgroundColor: Color(0x00000000),
        // backgroundColor: Colors.white,
        currentIndex: _currentIndex,

        type: BottomNavigationBarType
            .fixed, //has to be fixed to get the text and the icons for more then three
        backgroundColor: Colors.black, // <-- This works for fixed
        selectedItemColor: Colors.lightGreen[400],
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            //index 2

            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),

            label: 'Projekte',
          ),
          BottomNavigationBarItem(
            //index 1

            icon: new Icon(
              Icons.map_outlined,
              color: Colors.white,
            ),
            label: 'Karte',
          ),
          BottomNavigationBarItem(
            //index 0

            icon: new Icon(
              Icons.eco,
              color: Colors.white,
            ),
            label: 'Info',

            /*title: new Text(
              'Info',
              style: TextStyle(color: Colors.white),
            ),*/
          ),
          BottomNavigationBarItem(
            //index 3

            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: 'Profil',

            /*title: Text(
              'Profil',
              style: TextStyle(color: Colors.white),
            ),*/
          ),
        ],
      ),
    );
  }
}
