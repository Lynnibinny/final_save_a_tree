import 'package:flutter/material.dart';
import 'package:save_a_tree/nav.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'User.dart';
import 'services.dart';

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
  TextEditingController _UseMailController;
  TextEditingController _UseUserNameController;
  TextEditingController _UsePasswordController;
  TextEditingController _UseCompareController;
  bool passwordfail = false;
  bool emptyfield1 = false;
  bool emptyfield2 = false;
  bool registerfail = false;
  bool registerfailId = false;

  String _titleProgress;
  @override
  void initState() {
    super.initState();
    _user = [];
    _titleProgress = widget.title;
    //_scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    _UseMailController = TextEditingController();
    _UseUserNameController = TextEditingController();
    _UsePasswordController = TextEditingController();
    _UseCompareController = TextEditingController();
    //_getEmployees();
  }

  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _addUser() {
    if (_UseMailController.text.isEmpty) {
      setState(() {
        print('Empty Fields');
        emptyfield1 = true;
      });
    } else if (_UseUserNameController.text.isEmpty) {
      setState(() {
        print('Empty Fields');
        emptyfield2 = true;
      });
    } else {
      if (_UseMailController.text.isNotEmpty ||
          _UseUserNameController.text.isNotEmpty ||
          _UsePasswordController.text.isNotEmpty ||
          _UseCompareController.text.isNotEmpty) {
        print(
            '$_UseMailController, $_UseUserNameController, $_UseCompareController, $_UsePasswordController');
      } //just to find errors

      if (_UsePasswordController.text != _UseCompareController.text) {
        // if ("hallo" != "hallo"){
        setState(() {
          passwordfail = true; //loginfail is bool
          print('Passwörter ungleich');
        });
      } else {
        Services.addUser(_UseMailController.text, _UseUserNameController.text,
                _UsePasswordController.text, 0, 0.0, 0)
            .then((result) async {
          if ('errorId' == result) {
            print('User gibt es schon. $result');
            setState(() {
              registerfailId = true;
            });
          } else if ('error' == result) {
            print('konnte nicht registriert werden.');
            setState(() {
              registerfail = true;
            });
          } else {
            print('konnte fast registriert werden');
            //here we get the id

            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt(
                'registeredUserId', int.parse(result)); //später statt 5 result
            //_getEmployees(); // Refresh the List after adding each employee...
            //_clearValues();
            print('wurde registriert');
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (BuildContext context) => Nav()),
                ModalRoute.withName('/second'));

            _getUser();
          }
        });
      }
    }
  }

  _getUser() {
    _showProgress('Loading User...');
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
    final UseMailField = TextField(
      controller: _UseMailController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          errorText: emptyfield1
              ? 'Leeres Feld'
              : registerfail
                  ? 'Registrierung fehlgeschlagen'
                  : registerfailId
                      ? 'Dieser Benutzer existierst schon'
                      : null,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    print('an errorText vorbei');
    final UseUserNameField = TextField(
      controller: _UseUserNameController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          errorText: emptyfield2
              ? 'Leeres Feld'
              : registerfailId
                  ? 'Dieser Benutzer existierst schon'
                  : null,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Benutzername",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final UsePasswordField = TextField(
      controller: _UsePasswordController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Passwort",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final UsePasswordCompareField = TextField(
      controller: _UseCompareController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          errorText: passwordfail ? 'Passwörter stimmen nicht überein' : null,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Passwort bestätigen",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.lightGreen[700],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final registrationButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.lightGreen[700],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _addUser();
          //_getUser();

          //Navigator.pushReplacementNamed(context, '/second');
        },
        child: Text("Registrieren",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      //resizeToAvoidBottomInset: false,

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      "assets/tree.png",
                      height: 10,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 45.0), //SizedBox as a space
                  UseMailField,
                  SizedBox(height: 25.0),
                  UseUserNameField,
                  SizedBox(height: 25.0),
                  UsePasswordField,
                  SizedBox(height: 25.0),
                  UsePasswordCompareField,
                  SizedBox(height: 35.0),
                  registrationButton,
                  SizedBox(height: 15.0),
                  loginButton,
                  SizedBox(height: 15.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
