import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class SplashScreen extends StatelessWidget {
  Future<void> isRegistered(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //in shared preferences the userids get saved to figure out if the user has registered before or not
    var id = prefs.getString('registeredUserId');
    if (id == null || id.isEmpty) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.FirstScreenRoute, (route) => false);
    } else {
      print(id);
      Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.StartProfileRoute,
          (route) =>
              false); 
      //the files which are underneath get removed until they recieve true. But we never want to go back to the SplashScreen. Therefore we have it always on false. with Remove Untile 
      //if getString has already a Value we recieve true an thats how we figure out if the has user logged in before or not.
      //if getString is empty we recieve false
    }
  }

  @override
  Widget build(BuildContext context) {
    isRegistered(context);
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
        backgroundColor: Color(0x00000000),
        body: Center(
          child: Container(
    width: 75.0,
    height: 75.0,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/tree.png"),
             
            fit: BoxFit.cover
        )
    ),
)

      ),),
    );
  }
}

