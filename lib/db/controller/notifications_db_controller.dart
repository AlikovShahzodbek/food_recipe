import 'package:practick_project/db/model/notification_table.dart';

class NotificationsDbController {

  Future<void> saveNotificationToDB({
  required String type,
  required String mealId,
  required String mealName,
}) async {
   await NotificationTable().insertNotification({
      'type': type,
      'meal_id': mealId,
      'meal_name': mealName,
      'is_read': 0,
      'created_at': DateTime.now().toIso8601String(),
   });
}


}