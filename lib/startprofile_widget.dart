//import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:save_a_tree/main.dart';
import 'package:save_a_tree/startgoals_widget.dart';

var ProUserName = "Yarina";

class StartProfileWidget extends StatelessWidget {
  List<bool> _selections = List.generate(3, (_) => false);
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        SizedBox(
          height: 250.0,
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50,
          child: Icon(
            Icons.local_florist,
            color: Colors.red.shade900,
            size: 50,
          ),
        ),
        Text(
          ProUserName,
          textScaleFactor: 2.0,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        /* TextFormField(
  decoration: InputDecoration(
    labelText: 'Enter your username'
  ),
);*/
      ]),
    );
  }
}

/*class StartProfileWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    const SizedBox(height: 30);
    return Center(
        child: SizedBox(
      width: 200.0,
      height: 300.0,
      child: const Card(child: Text('Hello World!')),
    ));
  }

  Widget buildButton(BuildContext context) {
    const SizedBox(height: 30);
    return Center(
      child: RaisedButton(
        onPressed: () {},
        child: const Text('Jetzt spenden!', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
*/
/*void main () async{
  class Profile {
    final int id;
    final String name;
    final Image picture;
    final int trees;
    final int money;

    Profile({this.id, this.name, this.age});
  }
}
*/
