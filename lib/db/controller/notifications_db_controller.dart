import 'package:flutter/foundation.dart';
import 'package:practick_project/db/model/notification_table.dart';

class NotificationsDbController extends ChangeNotifier {
  static final NotificationsDbController _instance =
      NotificationsDbController._internal();
  factory NotificationsDbController() => _instance;
  NotificationsDbController._internal();

  final NotificationTable _dbTable = NotificationTable();
  List<Map<String, dynamic>> _notifications = [];

  List<Map<String, dynamic>> get notifications => _notifications;

  Future<void> fetchAllNotifications() async {
    _notifications = await _dbTable.getAllNotifications();
    notifyListeners();
  }

  Future<int> saveNotificationToDB({
    required String type,
    required String mealId,
    required String mealName,
  }) async {
    final now = DateTime.now().toIso8601String();
    final notification = {
      'type': type,
      'meal_id': mealId,
      'meal_name': mealName,
      'is_read': 0,
      'created_at': now,
    };
    final id = await NotificationTable().insertNotification(notification);
    await fetchAllNotifications();
    return id;
  }

  Future<void> markAsRead(int id) async {
    await _dbTable.markAsRead(id);
    await fetchAllNotifications();
  }

  Future<void> deleteNotification(int id) async {
    await _dbTable.delete(id);
    await fetchAllNotifications();
  }
}
