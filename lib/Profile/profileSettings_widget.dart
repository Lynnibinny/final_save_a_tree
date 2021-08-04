import 'package:auto_size_text/auto_size_text.dart';
import 'package:save_a_tree/User.dart';
import 'package:save_a_tree/firstscreen.dart';
import 'package:save_a_tree/login.dart';
import 'package:save_a_tree/main.dart';
import 'package:save_a_tree/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileSettingsWidget extends StatefulWidget {
  @override
  _ProfileSettingsWidgetState createState() => _ProfileSettingsWidgetState();
}

class _ProfileSettingsWidgetState extends State<ProfileSettingsWidget> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87, //Button Text color
    primary: Color.fromARGB(255, 155, 203, 99), //Button background color
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
    var id = prefs.getString('registeredUserId');
    getUser(id);
    //hand id over. Therefore getUser methode is able to compare them
    //async State because void initState does not allow async
  }

  bool _isEditingText = false;
  TextEditingController _editingController;
  String initialText = "neuer Name";
  void getUser(String id) {
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

  /*void updateUser(String id) {
    Services.updateUser().then((user) {
      setState(() {
        _user = user;
        user.where((userElement) => userElement.id == id).toList().first =
            _filterUser;
      });
    });
  }*/

  @override
  void initState() {
    super.initState();
    asyncState();
    _editingController = TextEditingController(text: initialText);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  TextEditingController _proUserNameController;
  Widget _editTitleTextField() {
    if (_isEditingText)
      return Center(
        child: TextField(
          autofocus: true,
          obscureText: false,
          style: style,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0))),

          controller: _proUserNameController,
          onSubmitted: (newValue) {
            setState(() {
              _filterUser.useUserName = newValue;
              _isEditingText = false;
            });
          },

          // controller: _editingController,
        ),
      );

    /*  decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );*/
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
        });
      },
      child: Row(
        children: <Widget>[
          Text(
            _filterUser.useUserName,
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

  _deleteUser() {
    Services.deleteUser(_filterUser.useId); //.then((user) {
    /*setState(() {
        _user = user;
        // Initialize to the list from Server when reloading...
      });*/

    //print("Length ${user.length}");
    //);
  }

  
  
    
    

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.cyan[100],
            Colors.cyan[200],
            Colors.cyan[300],
            Colors.cyan[400],
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Einstellungen',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0x00000000),
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black, //to make the back button black
          ),
        ),
        body: Center(
          child: _filterUser == null
              ? CircularProgressIndicator()
              : Center(
                  child: ListView(
                    //child: AspectRatio(
                    // aspectRatio: 1 / 2,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(30.0),
                        child: _editTitleTextField(),
                      ),
                      FractionallySizedBox(
                          widthFactor: 0.8, //means 80% of app width
                          child: (ElevatedButton(
                              // style: raisedButtonStyle,
                              onPressed: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.remove('registeredUserId');
                                Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (BuildContext context) => Login()),
    ModalRoute.withName('/login'));
                              },
                              child: Container(
                                  child: Column(children: <Widget>[
                                AutoSizeText(
                                  'abmelden',
                                  style: TextStyle(
                                      //fontSize: 25.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]))))),
                      FractionallySizedBox(
                          widthFactor: 0.8, //means 80% of app width
                          child: (ElevatedButton(
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove(
                                  'registeredUserId'); //to delete Userid in the Instance
                              _deleteUser(); //to delete User in database
                              //Navigator.pushNamed(context, '/first');
                              Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (BuildContext context) => FirstScreen()),
    ModalRoute.withName('/first'));
                            },
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  AutoSizeText(
                                    'Konto löschen',
                                    style: TextStyle(
                                        //fontSize: 25.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )))
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
