import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';

class StartProfileWidget extends StatelessWidget {
  List<bool> _selections = List.generate(3, (_) => false);
  Widget build(BuildContext context) {
    return Center(
      child: ToggleButtons(
          children: <Widget>[
            Icon(Icons.eco),
            Icon(Icons.group_rounded),
            Icon(Icons.cake),
          ],
          isSelected: _selections,
          onPressed: (int index) {
            setState(() {
              _selections[index] = !_selections[index];
            });
          }),
    );
  }

  void setState(Null Function() param0) {}
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
