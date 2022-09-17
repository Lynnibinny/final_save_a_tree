/*----------------------------------------------------------------------------------
firstscreen.dart

Author: Lynn Nüesch and Yarina Vetterli
Date: 10.12.2021

History:
Version Date Who Changes

Copyright © 2021 Lynn Nüesch und Yarina Vetterli, Switzerland. All rights reserved.
-----------------------------------------------------------------------------------*/
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:save_a_tree/nav.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'User.dart';
import 'firebase_options.dart';
import 'services.dart';
import 'package:email_validator/email_validator.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key, this.title}) : super(key: key);

  // This widget is used as our register form. After the splash screen will the user
  // get on this page if he has never logged in before.

  final String? title;

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with WidgetsBindingObserver {
  late Future<String> permissionStatusFuture;

  var permGranted = "granted";
  var permDenied = "denied";
  var permUnknown = "unknown";
  var permProvisional = "provisional";

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  List<User>? _user;
  List<User>? _filterUser;
  TextEditingController? _UseMailController;
  TextEditingController? _UseUserNameController;
  TextEditingController? _UsePasswordController;
  TextEditingController? _UseCompareController;
  bool passwordfail = false;
  bool passwordfail1 = false;
  bool emptyfield1 = false;
  bool emptyfield2 = false;
  bool registerfail = false;
  bool registerfailId = false;
  bool mailstructure = false;
  bool register = false;
  bool buttonPressed = false;
  bool errorNet = false;

  String? _titleProgress;

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
   // print('Handling a background message ${message.messageId}');
  }

  @override
  void initState() {
    super.initState();
    permissionStatusFuture = getCheckNotificationPermStatus();
    WidgetsBinding.instance!.addObserver(this);
    _user = [];
    _titleProgress = widget.title;
    //_scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    _UseMailController = TextEditingController();
    _UseUserNameController = TextEditingController();
    _UsePasswordController = TextEditingController();
    _UseCompareController = TextEditingController();
    //_getEmployees();
  }

  Future<String> getCheckNotificationPermStatus() {
    return NotificationPermissions.getNotificationPermissionStatus()
        .then((status) {
      switch (status) {
        case PermissionStatus.denied:
          return permDenied;
        case PermissionStatus.granted:
          return permGranted;
        case PermissionStatus.unknown:
          return permUnknown;
        case PermissionStatus.provisional:
          return permProvisional;
        //default:
        //  return null;
      }
    });
  }

  _showProgress(String? message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _mail() {
    if (buttonPressed == true) {
      bool validateMailStructure(String value) {
        return EmailValidator.validate(value);

        //return true;
      }

      //if (register == false) {
      //register = true;
      if (_UseMailController!.text.isEmpty) {
        setState(() {
          //print('Empty Fields');
          emptyfield1 = true;
          //register = false;
        });
      } else if (_UseMailController!.text.isNotEmpty) {
        setState(() {
          //print('No Empty Fields');
          emptyfield1 = false;
        });
      }
      if (!validateMailStructure(_UseMailController!.text)) {
        setState(() {
          //print('not validate mail structure');
          mailstructure = true;
          //register = false;
        });
      } else if (validateMailStructure(_UseMailController!.text)) {
        setState(() {
          //print(' validate mail structure');
          mailstructure = false;
        });
      }
      //}
    }
  }

  _userName() {
    if (buttonPressed == true) {
      if (_UseUserNameController!.text.isEmpty) {
        setState(() {
          //print('Empty Fields');
          //register = false;
          emptyfield2 = true;
        });
      } else if (_UseUserNameController!.text.isNotEmpty) {
        setState(() {
          //print('No Empty Fields');
          emptyfield2 = false;
        });
      }
    }
  }

  _password() {
    if (buttonPressed == true) {
      bool validateStructure(String value) {
        String pattern =
            r'^(?=.*?[A-Za-z])((?=.*?[0-9])|(?=.*?[!@#\$&*~\+\(\)\{\}\=\%\/\?\^öäüÖÄÜ£\-\_\;\:\,\.<>§€\[\]\|\¥])).{6,}$';
        RegExp regExp = new RegExp(pattern);
        return regExp.hasMatch(value);

        //return true;
      }

      if (!validateStructure(_UsePasswordController!.text)) {
        setState(() {
          //print('passwordfail1');
          register = false;
          passwordfail1 = true;
        });
      } else if (validateStructure(_UsePasswordController!.text)) {
        setState(() {
          //print('No passwordfail1');
          passwordfail1 = false;
        });
      }

      if (_UsePasswordController!.text != _UseCompareController!.text) {
        // if ("hallo" != "hallo"){
        setState(() {
          passwordfail = true;
          register = false;
          //print('Passwörter ungleich');
        });
      } else if (_UsePasswordController!.text == _UseCompareController!.text) {
        setState(() {
          passwordfail = false;
          //print('Passwörter gleich');
        });
      }
    }
  }

  _addUser() {
    bool validateStructure(String value) {
      String pattern =
          r'^(?=.*?[A-Za-z])((?=.*?[0-9])|(?=.*?[!@#\$&*~\+\(\)\{\}\=\%\/\?\^öäüÖÄÜ£\-\_\;\:\,\.<>§€\[\]\|\¥])).{6,}$';
      RegExp regExp = new RegExp(pattern);
      return regExp.hasMatch(value);

      //return true;
    }

    bool validateMailStructure(String value) {
      return EmailValidator.validate(value);

      //return true;
    }

//mail
    if (register == false) {
      register = true;
      if (_UseMailController!.text.isEmpty) {
        setState(() {
          //print('Empty Fields');
          emptyfield1 = true;
          register = false;
        });
      } else if (_UseMailController!.text.isNotEmpty) {
        setState(() {
          //print('No Empty Fields');
          emptyfield1 = false;
        });
      }
      if (!validateMailStructure(_UseMailController!.text)) {
        setState(() {
          //print('not validate mail structure');
          mailstructure = true;
          register = false;
        });
      } else if (validateMailStructure(_UseMailController!.text)) {
        setState(() {
          //print(' validate mail structure');
          mailstructure = false;
        });
      }
//UserName

      if (_UseUserNameController!.text.isEmpty) {
        setState(() {
          //print('Empty Fields');
          register = false;
          emptyfield2 = true;
        });
      } else if (_UseUserNameController!.text.isNotEmpty) {
        setState(() {
          //print('No Empty Fields');
          emptyfield2 = false;
        });
      }

//Password

      if (!validateStructure(_UsePasswordController!.text)) {
        setState(() {
          //print('passwordfail1');
          register = false;
          passwordfail1 = true;
        });
      } else if (validateStructure(_UsePasswordController!.text)) {
        setState(() {
          //print('No passwordfail1');
          passwordfail1 = false;
        });
      }

      if (_UsePasswordController!.text != _UseCompareController!.text) {
        // if ("hallo" != "hallo"){
        setState(() {
          passwordfail = true;
          register = false;
          //print('Passwörter ungleich');
        });
      } else if (_UsePasswordController!.text == _UseCompareController!.text) {
        setState(() {
          passwordfail = false;
          //print('Passwörter gleich');
        });
      }
    }
    if (register == true) {
      Services.addUser(_UseMailController!.text, _UseUserNameController!.text,
              _UsePasswordController!.text, 0, 0.0, 0)
          .then((result) async {
        if ('errorId' == result) {
          //print('User gibt es schon. $result');
          setState(() {
            registerfailId = true;
          });
        } else if ('error' == result) {
          //print('konnte nicht registriert werden.');
          setState(() {
            registerfail = true;
          });
        } else if ('errorNet' == result) {
          //print('konnte nicht registriert werden.');
          setState(() {
            errorNet = true;
          });
        } else {
          //print('konnte fast registriert werden');
          //here we get the id

          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setInt(
              'registeredUserId', int.parse(result)); //später statt 5 result
          //_getEmployees(); // Refresh the List after adding each employee...
          //_clearValues();
          //print('wurde registriert');
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (BuildContext context) => Nav()),
              ModalRoute.withName('/second'));

          _getUser();
        }
      });
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
      //print("Length ${user.length}");
    });
  }

  Widget build(BuildContext context) {
    final UseMailField = TextField(
      controller: _UseMailController,
      obscureText: false,
      style: style,
      onChanged: (String value) {
        _mail();
      },
      decoration: InputDecoration(
          errorText: emptyfield1
              ? 'Leeres Feld'
              : registerfail
                  ? 'Hast du Netz?'
                  : registerfailId
                      ? 'Dieser Benutzer existiert schon'
                      : mailstructure
                          ? 'Ungültige E-Mail-Adresse'
                          : errorNet
                              ? 'Hast du Netz?'
                              : null,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      //onChanged: ,
    );
    //print('an errorText vorbei');
    final UseUserNameField = TextField(
      controller: _UseUserNameController,
      obscureText: false,
      style: style,
      onChanged: (String value) {
        _userName();
      },
      decoration: InputDecoration(
          errorText: emptyfield2
              ? 'Leeres Feld'
              : registerfailId
                  ? 'Dieser Benutzer existiert schon'
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
      onChanged: (String value) {
        _password();
      },
      decoration: InputDecoration(
          errorText: passwordfail1
              ? 'Mind. 6 Zeichen, Zahlen und Spezialzeichen'
              : null,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Passwort",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final UsePasswordCompareField = TextField(
      controller: _UseCompareController,
      obscureText: true,
      style: style,
      onChanged: (String value) {
        _password();
      },
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
          buttonPressed = true;
          //_getUser();
          NotificationPermissions.requestNotificationPermissions(
                  iosSettings: const NotificationSettingsIos(
                      sound: true,  
                      alert: true,
                      badge: true,
                      ))
              .then((_) {
            // when finished, check the permission status
            setState(() {
              permissionStatusFuture = getCheckNotificationPermStatus();
            });
            //Navigator.pushReplacementNamed(context, '/second');
          });
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
                      "assets/TreeGreen.png",
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
