import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hayat/firebase_options.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print(message.notification!.title);
  print(message.notification!.body);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print('====================');
}

class FirebaseApi {
  static String? fcmToken;
  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'id',
    ' name',
    description: 'description',
    importance: Importance.defaultImportance,
  );
  final _localNotifications = FlutterLocalNotificationsPlugin();

  Future<String> getFCMToken() async {
    final fcmToken = await _firebaseMessaging.getToken();
    return fcmToken!;
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final FcmToken = await _firebaseMessaging.getToken();
    print('fcmToken');
    print(FcmToken);
    fcmToken = FcmToken;
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;

      _localNotifications.show(notification.hashCode, notification.title,
          notification.body, NotificationDetails(),
          payload: jsonEncode(message.toMap()));
    });

    // await _localNotifications.initialize(InitializationSettings(
      // android: android,
    // ));
    _firebaseMessaging.subscribeToTopic('general');
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
    });
    initlocalNotification();
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
