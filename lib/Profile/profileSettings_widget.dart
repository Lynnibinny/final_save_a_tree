/*----------------------------------------------------------------------------------
profileSettings_widget.dart

Author: Lynn Nüesch and Yarina Vetterli
Date: 10.12.2021

History:
Version Date Who Changes

Copyright © 2021 Lynn Nüesch und Yarina Vetterli, Switzerland. All rights reserved.
-----------------------------------------------------------------------------------*/
import 'package:auto_size_text/auto_size_text.dart';
import 'package:save_a_tree/User.dart';
import 'package:save_a_tree/firstscreen.dart';
import 'package:save_a_tree/login.dart';
import 'package:save_a_tree/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../nav.dart';

class ProfileSettingsWidget extends StatefulWidget {
  @override
  _ProfileSettingsWidgetState createState() => _ProfileSettingsWidgetState();
}

class _ProfileSettingsWidgetState extends State<ProfileSettingsWidget> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87, //Button Text color
    primary: Colors
        .green, //Color.fromARGB(255, 155, 203, 99), //Button background color
    minimumSize: Size(88, 36),

    shadowColor: Colors.white54, //?
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
  List<bool> _selections = List.generate(3, (_) => false);

  User _filterUser;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  List<User> _user = [];
  void asyncState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('registeredUserId');
    getUser(id);
    //hand id over. Therefore getUser methode is able to compare them
    //async State because void initState does not allow async
  }

  _deleteUser() {
    Services.deleteUser(_filterUser.useId); //.then((user) {
    //print("Length ${user.length}");
    //);
  }

  _updateUser() {
    Services.updateUser(
            _filterUser.useId,
            _filterUser.useMail,
            _filterUser.useUserName,
            //_useUserNameController.text,
            _filterUser.useSavedTrees,
            _filterUser.useDonated,
            _filterUser.useGoals)
        .then(
      (result) async {
        if ('error' == result) {
          //print('konnte nicht upgedated werden.');
          // error control print("'${_filterUser.useId}', '${_filterUser.useUserName}', '${_filterUser.useMail}', '${_filterUser.useSavedTrees}', '${_filterUser.useDonated}', '${_filterUser.useGoals}'");
        } else {
          //print('konnte ubgedated werden');
          //here we get the id

        }
      },
    );
  }

  bool _isEditingText = false;
  TextEditingController _editingController;
  String initialText = "neuer Name";

  void getUser(int id) {
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

  @override
  void initState() {
    super.initState();
    asyncState();
    _editingController = TextEditingController(text: initialText);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  TextEditingController _useUserNameController;
  Widget _editTextField() {
    if (_isEditingText)
      return Center(
        child: TextField(
          autofocus: true,
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "neuer Benutzername",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0))),
          controller: _useUserNameController,
          onSubmitted: (newValue) {
            setState(() {
              _filterUser.useUserName = newValue;
              _isEditingText = false;
            });
            _updateUser();
          },
        ),
      );

    /*  decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );*/
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
        });
      },
      child: Row(
        children: <Widget>[
          Text(
            _filterUser.useUserName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.black,
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
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
            Colors.lightGreen[400],
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => Nav(index: 3)),
                (route) => false),
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20.0,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Einstellungen',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0x00000000),
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black, //to make the back button black
          ),
        ),
        body: Center(
          child: _filterUser == null
              ? CircularProgressIndicator()
              : Center(
                  child: ListView(
                    //child: AspectRatio(
                    // aspectRatio: 1 / 2,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(30.0),
                        child: _editTextField(),
                      ),
                      FractionallySizedBox(
                          widthFactor: 0.8, //means 80% of app width
                          child: (ElevatedButton(
                              style: raisedButtonStyle,
                              onPressed: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.remove('registeredUserId');
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Login()),
                                    ModalRoute.withName('/login'));
                              },
                              child: Container(
                                  child: Column(children: <Widget>[
                                AutoSizeText(
                                  'Abmelden',
                                  style: TextStyle(
                                      //fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]))))),
                      FractionallySizedBox(
                          widthFactor: 0.8, //means 80% of app width
                          child: (ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove(
                                  'registeredUserId'); //to delete Userid in the Instance
                              _deleteUser(); //to delete User in database
                              //Navigator.pushNamed(context, '/first');
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          FirstScreen()),
                                  ModalRoute.withName('/first'));
                            },
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  AutoSizeText(
                                    'Konto löschen',
                                    style: TextStyle(
                                        //fontSize: 25.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )))
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
