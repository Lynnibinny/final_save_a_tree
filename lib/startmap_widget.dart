import 'package:flutter/material.dart';

class StartMapWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    const SizedBox(height: 30);
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
    );
    return Center(
      child: RaisedButton(
        onPressed: () {},
        child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
