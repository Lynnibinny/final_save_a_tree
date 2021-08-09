import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:save_a_tree/User.dart';
import 'package:save_a_tree/firstscreen.dart';
import 'package:save_a_tree/login.dart';

import 'package:save_a_tree/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'nav.dart';

class ProfileGoalsWidget extends StatefulWidget {
  @override
  _ProfileGoalsWidgetState createState() => _ProfileGoalsWidgetState();
}

class _ProfileGoalsWidgetState extends State<ProfileGoalsWidget> {
  double _height;
  double _width;

  var percent = 0;
  double filterUserPercent = 0;
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

  User _filterUser;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  List<User> _user = [];
  void asyncState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('registeredUserId');
    getUser(id);
    //hand id over. Therefore getUser methode is able to compare them
    //async State because void initState does not allow async
  }

  _deleteUser() {
    Services.deleteUser(_filterUser.useId); //.then((user) {
    //print("Length ${user.length}");
    //);
  }

  _updateUser() {
    Services.updateUser(
            _filterUser.useId,
            _filterUser.useMail,
            _filterUser.useUserName,
            //_useUserNameController.text,
            _filterUser.useSavedTrees,
            _filterUser.useDonated,
            _filterUser.useGoals)
        .then(
      (result) async {
        if ('error' == result) {
          print('konnte nicht upgedated werden.');
          // error control print("'${_filterUser.useId}', '${_filterUser.useUserName}', '${_filterUser.useMail}', '${_filterUser.useSavedTrees}', '${_filterUser.useDonated}', '${_filterUser.useGoals}'");
        } else {
          print('konnte ubgedated werden');
          //here we get the id

        }
      },
    );
  }

  bool _isEditingText = false;
  TextEditingController _editingController;
  String initialText = "neuer Name";
  void getUser(int id) {
    //_showProgress('Loading Employees...');
    Services.getUser().then((user) {
      setState(() {
        _user = user;
        // Initialize to the list from Server when reloading...
        _filterUser =
            user.where((userElement) => userElement.useId == id).toList().first;
        //output has to be one single user
        //.toList cause "where" does not return a List it just returns a where list
        //we can just use first cause in this list there is one single entry anyways
      });
      //_showProgress(widget.title); // Reset the title...
      // print("Length ${user.length}");
    });
  }

  @override
  void initState() {
    Timer timer;

    timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      print('Percent Update');
      setState(() {
        percent += 1;
        /* if (_filterUser != null) {
          filterUserPercent =
              calcPercent(_filterUser.useGoals, _filterUser.useSavedTrees);
        }*/
        if (percent >= filterUserPercent) {
          timer.cancel();
          // percent=0;
        }
      });
    });
    super.initState();
    asyncState();
    _editingController = TextEditingController(text: initialText);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  TextEditingController _useGoalsController;
  Widget _editTitleTextField() {
    if (_isEditingText)
      return Center(
        child: TextField(
          autofocus: true,
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Dein Ziel",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0))),
          controller: _useGoalsController,
          onSubmitted: (newValue) {
            setState(() {
              _filterUser.useGoals = int.parse(newValue);
              _isEditingText = false;
            });
            _updateUser();
          },
        ),
   
      
 
      
          
    );
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,  
        children: <Widget>[
          SizedBox(width: _width/13,),
          Text(
            _filterUser.useGoals.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.black,
            onPressed: () {},
          )
        ],
      ),
    );
  }

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
          actions: <Widget>[
            IconButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => Nav()),
                  ModalRoute.withName('/first')),

              //_updateUserWithRoot,
              //() => Navigator.pop(context),
              icon: Icon(
                Icons.done,
                size: 30.0,
                color: Colors.green,
              ),
            ),
          ],
        ),
        body: _filterUser == null
            ? CircularProgressIndicator()
            : Column(
                //child: AspectRatio(
                // aspectRatio: 1 / 2,
                children: <Widget>[
                  SizedBox(height: _height / 20),
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
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topLeft,
                                  stops: [percent / 100, percent / 100],
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
                    "Wieviele Bäume möchtest du retten?",
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
                  ),
                   Container(
                      padding: const EdgeInsets.all(30.0),
                      child: _editTitleTextField(),
                    
                  ),
                ],
              ),
      ),
    );
  }
}
