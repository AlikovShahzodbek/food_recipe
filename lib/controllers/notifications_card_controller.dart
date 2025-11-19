import 'package:practick_project/db/model/local_recipes_table.dart';
import 'package:practick_project/db/model/notification_table.dart';
import 'package:practick_project/models/food_content_model.dart';
import 'package:practick_project/services/meal_repository.dart';

enum NotificationsFilter { all, read, unread }

class NotificationCardData {
  NotificationCardData({
    required this.id,
    required this.type,
    required this.isRead,
    required this.createdAt,
    required this.meal,
    required this.mealName,
  });

  final int id;
  final String type;
  final bool isRead;
  final DateTime createdAt;
  final String mealName;
  final FoodContentModel? meal;
}

class NotificationsCardController {
  NotificationsCardController(
    this.localDB,
    this.notificationDB,
    this.mealRepository,
  );

  final NotificationTable notificationDB;
  final LocalRecipesTable localDB;
  final MealRepository mealRepository;

  Future<List<NotificationCardData>> load(NotificationsFilter filter) async {
    final notifList = await notificationDB.getAllNotifications();

    final filtered = notifList.where((item) {
      if (filter == NotificationsFilter.all) return true;
      if (filter == NotificationsFilter.read) return item['is_read'] == 1;
      return item['is_read'] == 0;
    });

    final result = <NotificationCardData>[];

    for (var item in filtered) {
      final mealId = int.tryParse(item['meal_id']) ?? 0;
      final meal = await mealRepository.findMeal(mealId);

      result.add(
        NotificationCardData(
          id: item['id'] as int,
          type: item['type'] as String,
          isRead: item['is_read'] == 1,
          createdAt: DateTime.parse(item['created_at']),
          meal: meal,
          mealName: item['meal_name'],
        ),
      );
    }
    return result;
  }
}
