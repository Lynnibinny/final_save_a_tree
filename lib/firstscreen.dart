import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'User.dart';
import 'services.dart';
import 'main.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key key, this.title}) : super(key: key);

  // This widget is used as our register form. After the splash screen will the user
  // get on this page if he has never logged in before.

  final String title;

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  List<User> _user;
  List<User> _filterUser;
  TextEditingController _proMailController;
  TextEditingController _proUserNameController;
  String _titleProgress;
  @override
  void initState() {
    super.initState();
    _user = [];
    //_filterEmployees = [];
    //_isUpdating = false;
    _titleProgress = widget.title;
    //_scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    _proMailController = TextEditingController();
    _proUserNameController = TextEditingController();
    //_getEmployees();
  }

  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _addUser() {
    if (_proMailController.text.isEmpty ||
        _proUserNameController.text.isEmpty) {
      print('Empty Fields');
      return;
    }
    _showProgress('Adding Employee...');
    Services.addUser(_proMailController.text, _proUserNameController.text)
        .then((result) async {
      if ('success' == result) {
        //do würe mir 5 becho
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('registeredUserId', '5'); //später statt 5 result
        //_getEmployees(); // Refresh the List after adding each employee...
        //_clearValues();
      }
    });
  }

  _getUser() {
    _showProgress('Loading Employees...');
    Services.getUser().then((user) {
      setState(() {
        _user = user;
        // Initialize to the list from Server when reloading...
        //_filterEmployees = employees;
      });
      _showProgress(widget.title); // Reset the title...
      print("Length ${user.length}");
    });
  }

  Widget build(BuildContext context) {
    final proMailField = TextField(
      controller: _proMailController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final proUserNameField = TextField(
      controller: _proUserNameController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Passwort",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordcompareField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Passwort bestätigen",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final registrationButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _addUser();
          _getUser();
          Navigator.pushNamed(context, '/second');
        },
        child: Text("Registrieren",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  //child: Image.asset(
                  //"assets/logo.png",
                  //fit: BoxFit.contain,
                  //),
                ),
                SizedBox(height: 45.0), //SizedBox as a space
                proMailField,
                SizedBox(height: 45.0),
                proUserNameField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(height: 25.0),
                passwordcompareField,
                SizedBox(
                  height: 35.0,
                ),
                registrationButon,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
