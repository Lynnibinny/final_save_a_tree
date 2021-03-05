import 'package:flutter/material.dart';
import 'package:save_a_tree/nav.dart';
import 'dart:async';
import 'dart:convert';
//import 'dart:html';
import 'package:http/http.dart' as http;

var ProMail = "uiuiuiuiui@me.com";
/*var ProUserName = "lele";
var ProPicture = "00110";
var ProSavedTrees = "4";
var ProDonated = "5.5";
var ProPassword = "ililil";
*/

/*
var ProMail = "uiuiuiuiui@me.com";
var ProUserName = "lele";
var ProPicture = "00110";
var ProSavedTrees = "4";
var ProDonated = "5.5";
var ProPassword = "ililil";

Future<http.Response> createUser(String ProMail) {
  return http.post(
    Uri.https("https://i-kf.ch/SaveATree/lib/insertdata.php", "ProMail"),
    headers: <String, String>{
      "Content-Type": "application/json; charset=UFT-8",
    },
    body: jsonEncode(<String, String>{
      "ProMail": ProMail,
      /*"ProUserName": ProUserName,
      "ProPicture": ProPicture,
      "ProSavedTrees": ProSavedTrees,
      "ProDonated": ProDonated,
      "ProPassword": ProPassword*/
    }),
  );
}
*/
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Nav Bar',
      color: Colors.black,
      home: Nav(),
    );
  }
}
