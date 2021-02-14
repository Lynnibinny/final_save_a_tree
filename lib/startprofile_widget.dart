import 'package:flutter/material.dart';

/*import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
*/

class StartProfileWidget extends StatelessWidget {
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