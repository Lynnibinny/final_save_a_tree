import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'User.dart';
import 'services.dart';
import 'main.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  // This widget is used as our register form. After the splash screen will the user
  // get on this page if he has never logged in before.

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  List<User> _user;
  List<User> _filterUser;
  TextEditingController _UseUserNameController;
  TextEditingController _UsePasswordController;
  bool loginfail = false;

  String _titleProgress;
  @override
  void initState() {
    super.initState();
    _user = [];
    //_filterEmployees = [];
    //_isUpdating = false;
    _titleProgress = widget.title;
    //_scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar

    _UseUserNameController = TextEditingController();
    _UsePasswordController = TextEditingController();

    //_getEmployees();
  }

  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _loginUser() {
    if (_UseUserNameController.text.isEmpty ||
        _UsePasswordController.text.isEmpty) {
      print('Empty Fields');
      return;
    }
    if (_UseUserNameController.text.isNotEmpty ||
        _UsePasswordController.text.isNotEmpty) {
      print('$_UseUserNameController');
    } //just to find errors

    Services.loginUser(
      _UseUserNameController.text,
      _UsePasswordController.text,
    ).then((result) async {
      if ('error' == result) {
        print('konnte sich nicht einlogen.');
        //Navigator.pushNamed(context, '/first');
        // logError;
        setState((){
           loginfail = true; //loginfail is bool
          });
      } else {
        print('konnte sich fast einlogen');
        //here we get the id
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(
            'registeredUserId', result);
            Navigator.pushReplacementNamed(context, '/second'); 
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
    final logError = Text("konnte nicht einlogen");
    final UseUserNameField = TextField(
      controller: _UseUserNameController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        errorText: loginfail ? 'Benutzername oder Passwort stimmen nicht überein' : null,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Benutzername",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final UsePasswordField =
        /*PasswordField(
      controller: _UsePasswordController,*/
        TextField(
      controller: _UsePasswordController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        errorText: loginfail ? 'Benutzername oder Passwort stimmen nicht überein' : null,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Passwort",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final backRegistrationButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.pushNamed(context, '/first');
        },
        child: Text("zurück zur Registration",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _loginUser();
          _getUser();
          
          
        },
        child: Text("Login",
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
                  //SizedBox(
                  //  height: 155.0,

                  //),
                  SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      "assets/tree.png",
                      height: 10,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 45.0), //SizedBox as a space

                  UseUserNameField,
                  SizedBox(height: 25.0),
                  UsePasswordField,

                  SizedBox(
                    height: 35.0,
                  ),
                  loginButon,
                  SizedBox(
                    height: 15.0,
                  ),
                  backRegistrationButon,
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
