import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    InitializationSettings initializationSettings = const InitializationSettings(
      android: AndroidInitializationSettings("ic_launcher"),
      iOS: IOSInitializationSettings(),
    );

    tz.initializeTimeZones();
    await _notifications.initialize(initializationSettings, onSelectNotification: onSelectNotification);

    final _scheduledTime = DateTime.now().add(const Duration(hours: 4));
    scheduleNotification(
      1,
      'Prices Update',
      'Crypto prices have been updated, find new prices in the app.',
      _scheduledTime,
      'payload',
    );
  }

  final NotificationDetails notificationDetails = const NotificationDetails(
    android: AndroidNotificationDetails(
      '1',
      "notificationChannel",
      channelDescription: "This channel is responsible for all the local notifications",
      playSound: true,
      priority: Priority.high,
      importance: Importance.high,
    ),
    iOS: IOSNotificationDetails(),
  );

  Future<void> requestIOSPermissions() async {
    await _notifications.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> showNotification(int id, String title, String body, String payload) async {
    await _notifications.show(id, title, body, notificationDetails, payload: payload);
  }

  Future<void> scheduleNotification(
    int id,
    String title,
    String body,
    DateTime scheduledTime,
    String payload, [
    DateTimeComponents? dateTimeComponents,
  ]) async {
    await _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      notificationDetails,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      payload: payload,
      matchDateTimeComponents: dateTimeComponents,
    );
  }

  Future<void> cancelNotification(int id) async {
    await _notifications.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }
}

Future<void> onSelectNotification(String? payload) async {
  // await navigatorKey.currentState?.push(MaterialPageRoute(builder: (_) => DetailsPage(payload: payload)));
}
