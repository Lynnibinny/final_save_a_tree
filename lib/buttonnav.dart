import 'package:flutter/material.dart';
import 'package:save_a_tree/startgoals_widget.dart';
import 'package:save_a_tree/startmap_widget.dart';
import 'package:save_a_tree/startprofile_widget.dart';

class Button extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ButtonState();
  }
}

class _ButtonState extends State<Button> {
  int _currentIndex = 0;

  void function1() {
    setState(() {
      _currentIndex = 1;
    });
  }

  void function2() {
    setState(() {
      _currentIndex = 2;
    });
  }

  List<Widget> _widgetoptions = <Widget>[
    StartProfileWidget(),
    StartGoalsWidget(),
    StartMapWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      //backgroundColor: Colors.green,
      //Container(
      //width: 50,
      //height: 50,
      children: <Widget>[
        FittedBox(
          child: _widgetoptions.elementAt(_currentIndex),
        ),
        ElevatedButton(
          onPressed: function1,
          child: Column(children: <Widget>[
            Icon(Icons.cake),
            Text("en guete"),
            //currentIndex: _currentIndex;
          ]),
        ),
        /*FittedBox(
          alignment: Alignment.center,
          child: //<Widget> [*/

        ElevatedButton(
          onPressed: function2,
          child: Column(children: <Widget>[
            Icon(Icons.play_arrow_outlined),
            Text("viel Spass"),
          ]),
        ),
        //),
      ],
    );
  }
}

class _Container extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
//      margin: new EdgeInsets.all(8.0),
      child: ListBody(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 200,
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: new TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Product Name', border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
