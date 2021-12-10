import 'dart:async';

import 'package:save_a_tree/Project/project_widget.dart';
import 'package:save_a_tree/User.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DoneWidget extends StatefulWidget {
  @override
  _DoneWidgetState createState() => _DoneWidgetState();
}

class _DoneWidgetState extends State<DoneWidget> {
  void initState() {
    Timer timer;

    timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      print('Percent Update');
      setState(() {
        //percent += 1;
        print('in setState');

        if (percent >= 100) {
          timer.cancel();
          //percent=0;
        } else {
          percent += 1;
        }
      });
    });

    super.initState();
  }

  @override
  double _height;
  double _width;

  var percent = -5;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87, //Button Text color
    primary: Colors
        .green, //Color.fromARGB(255, 155, 203, 99), //Button background color
    minimumSize: Size(88, 36),

    shadowColor: Colors.white54, //?
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
  List<bool> _selections = List.generate(3, (_) => false);

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  List<User> _user = [];

  Widget build(BuildContext context) {
    final size = 50.0;
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    const SizedBox(height: 30);
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.lightGreen[200],
              Colors.lightGreen[300],
              Colors.lightGreen[400],
              Colors.lightGreen[500],
            ],
          ),
        ),
        child: Center(
            child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Ziel',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Color(0x00000000),
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.black, //to make the back button black
            ),
          ),
          body: Container(
            child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    //child: AspectRatio(
                    // aspectRatio: 1 / 2,
                    children: <Widget>[
                      //SizedBox(height: _height / 20),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          height: _height / 6,
                          //width: _width / 3,
                          //padding: EdgeInsets.all(20),
                          //color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Stack(children: [
                                ShaderMask(
                                  shaderCallback: (rect) {
                                    return LinearGradient(
                                      colors: [
                                        Colors.lightGreen[500],
                                        Colors.white,
                                        //Colors.lightGreen[400],
                                        // Colors.lightGreen[500],
                                      ],
                                    ).createShader(rect);
                                  },
                                  child: Container(
                                    height: _height / 8,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/TreeGreen.png'))),
                                  ),
                                ),
                              ]),
                            ],
                          )),
                      SizedBox(height: _height / 20),

                      Text(
                        "Dieses Projekt haben wir geschafft!",
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: _height / 20),

                      Text(
                        "100%",
                        style: TextStyle(
                          fontSize: 45.0,
                          //fontWeight: FontWeight.w800
                        ),
                      ),

                      SizedBox(height: _height / 40),
                    ])),
          ),
        )));
  }
}
