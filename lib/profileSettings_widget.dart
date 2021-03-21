import 'package:flutter/material.dart';

class ProfileSettingsWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    const SizedBox(height: 30);
    return Scaffold(
        appBar: AppBar(
          title: Text('Placeholder'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {},
            child: const Text('This is a button', style: TextStyle(fontSize: 20)),
          ),
        ));
  }
}