import 'package:flutter/material.dart';
//import 'package:save_a_tree/nav.dart';
import 'dart:async';
import 'dart:convert';
//import 'dart:html';
//import 'package:http/http.dart' as http;  //wieder reinnehmen(!)

class User {
  final String promail;

  User({required this.promail});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(promail: json['ProMail']);
  }
}

class StartGoalsWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spaceholderscreen for "StartGoalsWidget"'),
      ),
      body: Center(
        child: RaisedButton(
            onPressed: () {}, color: Colors.green, child: Text(':)')),
      ),
    );
  }
  // //var promail = "uiuiuiuiui@me.com";
  // Future<User> createUser(String promail) async {
  //   //future da es in der Zukunft einen User machen wird. Es blockt also den Code nicht.
  //   final response = await http.post(
  //     Uri.https('i-kf.ch', '/SaveATree/lib/insertdata.php'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'ProMail': promail,
  //     }),
  //   );

  //   //print(response.statusCode);
  //   if (response.statusCode != 200) {
  //     print('hurraa');
  //   } else {
  //     throw Exception('Faillll');
  //   }
  //   //throw Exception('hö?');
  // }

  // Widget build(BuildContext context) {
  //   const SizedBox(height: 30);
  //   return Scaffold(
  //     body: Column(children: <Widget>[
  //       SizedBox(
  //         height: 250.0,
  //       ),
  //       RaisedButton(onPressed: () async {
  //         var response = await createUser('babybaum');
  //         print(response);
  //         //print(response.body);
  //       }),
  //       RaisedButton(
  //         onPressed: () {},
  //         child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
  //       ),
  //       RaisedButton(onPressed: () async {
  //         var response = await createUser('test');
  //         print(response);
  //         //print(response.body);
  //       }),
  //     ]),
  //   );
  // }
}
