import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
//import 'dart:html';
import 'package:http/http.dart' as http;

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
  }

  Widget build(BuildContext context) {
    const SizedBox(height: 30);
    return Column(children: <Widget>[
      RaisedButton(
        onPressed: () {},
        child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
      ),
      RaisedButton(onPressed: () async {
        var response = await createUser('test');
        print(response);
        print(response.body);
      }),
    ]);
  }
}
