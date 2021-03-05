import 'package:flutter/material.dart';
import 'package:save_a_tree/nav.dart';
import 'dart:async';
import 'dart:convert';
//import 'dart:html';
import 'package:http/http.dart' as http;

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
  }

  Widget build(BuildContext context) {
    const SizedBox(height: 30);

    return Column(children: <Widget>[
      SizedBox(
        height: 250.0,
      ),
      RaisedButton(onPressed: () async {
        var response = await createUser('babybaum');
        print(response);
        // print(response.body);
      }),
      RaisedButton(
        onPressed: () {},
        child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
      ),
    ]);
  }
}
