import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class StartGoalsWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    const SizedBox(height: 30);

    return Center(
      child: RaisedButton(
        onPressed: () {},
        child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
/*class StartGoalsWidget extends StatelessWidget {
  //var promail = "uiuiuiuiui@me.com";
  Future<User> createUser(String promail) async {
    //future da es in der Zukunft einen User machen wird. Es blockt also den Code nicht.
    final response = await http.post(
      Uri.https('i-kf.ch', '/SaveATree/lib/insertdata.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'ProMail': promail,
      }),
    );
    
    //print(response.statusCode);
    if (response.statusCode == 200) {
      print('hurraa');
    } else {
      throw Exception('Faillll');
    }
  }

  Widget build(BuildContext context) {
    const SizedBox(height: 30);
    return Scaffold(
      body: Column(children: <Widget>[
        SizedBox(
          height: 250.0,
        ),
        RaisedButton(onPressed: () async {
          var response = await createUser('babybaum');
          print(response);
          //print(response.body);
        }),
        RaisedButton(
          onPressed: () {},
          child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
        ),
        RaisedButton(onPressed: () async {
          var response = await createUser('test');
          print(response);
          //print(response.body);
        }),
      ]),
    );
  }
}*/
