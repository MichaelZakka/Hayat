import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hayat/firebase_options.dart';

class FirebaseApi {
  static String? fcmToken;

  Future<String> getFCMToken() async {
    final fcmToken = await _firebaseMessaging.getToken();
    return fcmToken!;
  }

  // final _firebaseMessaging = FirebaseMessaging.instance;
  // Future<void> initNotifications() async {
  //   await _firebaseMessaging.requestPermission();

  //   fcmToken = await _firebaseMessaging.getToken();
  //   print('FcmToken');
  //   print(fcmToken);
  //   initPushNotifications();
  // }

  // void handleMessage(RemoteMessage? message) {
  //   if (message == null) return;
  // }

  // Future initPushNotifications() async {
  //   FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  //   FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  // }
  final _firebaseMessaging = FirebaseMessaging.instance;
//////////////////////////////////////////////////
  final _androidChannel = const AndroidNotificationChannel(
    'id',
    ' name',
    description: 'description',
    importance: Importance.defaultImportance,
  );
  final _localNotifications = FlutterLocalNotificationsPlugin();
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final FcmToken = await _firebaseMessaging.getToken();
    print('fcmToken');
    print(FcmToken);
    fcmToken = FcmToken;
    initPushNotifications();
    initlocalNotification();
  }

  Future initPushNotifications() async {
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;

      _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
                  _androidChannel.id, _androidChannel.name,
                  channelDescription: _androidChannel.description,
                  icon: 'ic_launcher')),
          payload: jsonEncode(message.toMap()));
    });
  }

  Future initlocalNotification() async {
    const android = AndroidInitializationSettings('ic_launcher');
    const settings = InitializationSettings(android: android);
    await _localNotifications.initialize(
      settings,

    );

    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform!.createNotificationChannel(_androidChannel);
  }
}


Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print(message.notification!.title);
  print(message.notification!.body);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print('====================');
}
