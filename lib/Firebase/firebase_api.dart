import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseApi {
  // Create an instance of the firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;
  //  Create an instance of the firebase Real Time Database
  final _database = FirebaseDatabase.instance.ref();

// Function to initialize the notification
  Future<void> initNotification() async {
    // Request permission from the user (will prompt user)
    await _firebaseMessaging.requestPermission();

    // Fetch FCM token for the device
    final fCMToken = await _firebaseMessaging.getToken();

    // Print the token
    print("Token: $fCMToken");

// Send the Token to Firebase Real Time Database
    final iotRef = _database.child('/');
    iotRef.child('token').set(fCMToken);
  }
}
