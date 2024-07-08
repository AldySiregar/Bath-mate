import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase/Screen/home_page.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _database = FirebaseDatabase.instance.ref();

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print("Token: $fCMToken");

    final iotRef = _database.child('/');
    iotRef.child('token').set(fCMToken);
  }
}
