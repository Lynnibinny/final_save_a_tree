import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:save_a_tree/nav.dart';
>>>>>>> b6650f21916188a4fb4c36b504b570646ea598c9
import 'dart:async';
import 'dart:convert';
//import 'dart:html';
import 'package:http/http.dart' as http;
<<<<<<< HEAD

class StartGoalsWidget extends StatelessWidget {
  var promail = "jjjhhhh@gmx.ch";
  Future<http.Response> createUser(String promail) {
    return http.post(
      Uri.https("https://i-kf.ch/SaveATree/lib/insertdata.php", "ProMail"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UFT-8",
      },
      body: jsonEncode(<String, String>{
        "ProMail": promail,
/*"ProUserName": ProUserName,
"ProPicture": ProPicture,
"ProSavedTrees": ProSavedTrees,
"ProDonated": ProDonated,
"ProPassword": ProPassword*/
      }),
    );
=======

class User {
  final String promail;

  User({this.promail});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(promail: json['ProMail']);
  }
}

class StartGoalsWidget extends StatelessWidget {
  //var promail = "uiuiuiuiui@me.com";
  Future<User> createUser(String promail) async {
    
    final response = await http.post(
      Uri.https('i-kf.ch', '/SaveATree/lib/insertdata.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'ProMail': promail,
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('hurraa');
    } else {
      throw Exception('Faillll');
    }
>>>>>>> b6650f21916188a4fb4c36b504b570646ea598c9
  }

  Widget build(BuildContext context) {
    const SizedBox(height: 30);
<<<<<<< HEAD
    return Column(children: <Widget>[
=======

    return Column(children: <Widget>[
      SizedBox(
        height: 250.0,
      ),
      RaisedButton(onPressed: () async {
        var response = await createUser('babybaum');
        print(response);
        //print(response.body);
      }),
>>>>>>> b6650f21916188a4fb4c36b504b570646ea598c9
      RaisedButton(
        onPressed: () {},
        child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
      ),
<<<<<<< HEAD
      RaisedButton(onPressed: () async {
        var response = await createUser('test');
        print(response);
        print(response.body);
      }),
=======
>>>>>>> b6650f21916188a4fb4c36b504b570646ea598c9
    ]);
  }
}
