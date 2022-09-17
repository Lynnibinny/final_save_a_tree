
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsManager {

  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance = PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.
      _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
     // _firebaseMessaging.configure();

      // For testing purposes print the Firebase Messaging token
      //String token = await _firebaseMessaging.getToken();
      //print("FirebaseMessaging token: $token");
      
      _initialized = true;
    }
  }
}
/*import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io' show Platform;

class PushNotificationService {
  //FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future initialise() async {
    if (Platform.isIOS) {
     // _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }
}
/*import 'package:firebase_messaging/firebase_messaging.dart';


class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  bool _initialized = false;



  Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.
      firebaseMessaging.requestPermission(sound: true, badge: true, alert: true);
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage data: ${message.data}");
    });
     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('onMessageOpenedApp data: ${message.data}');
      _serialiseAndNavigate(message);
    });
      
     

      _initialized = true;
    }
  }*/
}
*/