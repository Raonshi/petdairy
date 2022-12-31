import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:petdiary/config.dart';
import 'package:petdiary/repository/repository.dart';

class NotificationProvider with ChangeNotifier {
  late FlutterLocalNotificationsPlugin plugin;
  final Repository _repository = Repository();

  NotificationProvider() {
    init();
  }

  void init() {
    initNoti();
    initFcm();
  }

  void initFcm() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    String token = await messaging.getToken(
          vapidKey: 'BNDU4B7okgsP3OMX--pATl9i3CzhPuHb7jT8YjwHZB2mk_XSwu3I5-J1hoMKFsrPAyRSTGbGO_VlUP7HNpjzbHw',
        ) ??
        '';

    await _repository.setToken(token);
    lgr.d(token);

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      lgr.d(message);
      if (message.notification != null) {
        showNotification(
          message.hashCode,
          message.notification?.title,
          message.notification?.body,
        );
      }
    });
  }

  void initNoti() async {
    plugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');
    DarwinInitializationSettings initializationSettingsDarwin = const DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await plugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      lgr.d('notification payload: $payload');
    }
  }

  Future<void> showNotification(int id, String? title, String? body) async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.max,
      showWhen: false,
    );

    const DarwinNotificationDetails iosNotificationDetails = DarwinNotificationDetails(
      badgeNumber: 1,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );

    if (body == null && title == null) return;

    await plugin.show(0, title, body, notificationDetails);
  }
}
