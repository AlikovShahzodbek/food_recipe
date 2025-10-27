import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  // --- Singleton pattern ---
  NotificationService._internal();
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;

  final _notificationPlugin = FlutterLocalNotificationsPlugin();
  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    const initSettingsAndroid = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const initSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIOS,
    );

    await _notificationPlugin.initialize(initSettings);
    _isInitialized = true;
  }

  NotificationDetails _notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'Recipe Notification',
        channelDescription: 'Recipe Notification Channel',
        priority: Priority.high,
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    if (!_isInitialized) {
      await initialize();
    }

    await _notificationPlugin.show(id, title, body, _notificationDetails());
  }
}
