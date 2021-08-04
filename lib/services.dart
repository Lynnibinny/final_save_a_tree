import 'dart:convert';
//import 'dart:html';
import 'package:http/http.dart'
    as http; // add the http plugin in pubspec.yaml file.

import 'User.dart';

class Services {
  static const ROOT = 'https://i-kf.ch/SaveATree/user_actions.php';
  static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
  static const _GET_ALL_ACTION = 'GET_ALL';
  static const _ADD_USER_ACTION = 'ADD_USER';
  static const _UPDATE_USER_ACTION = 'UPDATE_USER';
  static const _DELETE_USER_ACTION = 'DELETE_USER';
  static const _LOGIN_USER_ACTION = 'LOGIN_USER';

  static Future<String> createTable() async {
    try {
      // add the parameters to pass to the request. ich glaub da bruche mir gar nüm
      var map = Map<String, dynamic>();
      map['action'] = _CREATE_TABLE_ACTION;
      final response = await http.post(ROOT, body: map);
      print('Create Table Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  //method to get user from the database
  static Future<List<User>> getUser() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      print('getUser Response: ${response.body}');
      if (200 == response.statusCode) {
        List<User> list = parseResponse(response.body);
        return list;
      } else {
        throw Exception(
            'cannot get the User'); //return "error"; //List<User>();
      }
    } catch (e) {
      throw Exception(
          'cannot get the User'); //return List<User>(); // return an empty list on exception/error
    }
  }

  static Future<List<User>> deleteUser(String UseId) async {
    var map = Map<String, dynamic>();
    map['action'] = _DELETE_USER_ACTION;
    map['UseId'] = UseId;
    final response = await http.post(ROOT, body: map);
    print('deleteUser Response: ${response.body}');
  }

  static List<User> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  // Method to add user to the database...
  static Future<String> addUser(
    String useMail,
    String useUserName,
    String usePassword,
  ) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_USER_ACTION;
      map['UseMail'] = useMail;
      map['UseUserName'] = useUserName;
      //map['UsePicture'] = 0;
      //map['UseSavedTrees'] = useSavedTrees;
      //map['UseDonated'] = 0;
      map['UsePassword'] = usePassword;
      print(map);
      final response = await http.post(ROOT, body: map);
      print('addUser yey: $useMail, $useUserName');
      print('addUser Response: ${response.body} ${response.statusCode}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      print("sysaddus:" + e.toString());
      return "error";
    }
  }

  static Future<String> loginUser(
    String useUserName,
    String usePassword,
  ) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _LOGIN_USER_ACTION;
      map['UseUserName'] = useUserName;
      map['UsePassword'] = usePassword;
      print(map);
      final response = await http.post(ROOT, body: map);
      print('loginUser yey: $useUserName');
      print('loginUser Response: ${response.body} ${response.statusCode}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      print("loginuser:" + e.toString());
      return "error";
    }
  }

  // Method to update a user in Database...
  static Future<String> updateUser(String UseMail, String UseUserName) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_USER_ACTION;
      map['UseMail'] = UseMail;
      map['UseUserName'] = UseUserName;
      final response = await http.post(ROOT, body: map);
      print('updateEmployee Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}
