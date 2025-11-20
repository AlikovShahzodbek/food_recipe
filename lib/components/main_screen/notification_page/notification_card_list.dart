import 'package:flutter/material.dart';
import 'package:practick_project/components/main_screen/notification_page/notification_card.dart';
import 'package:practick_project/controllers/notifications_card_controller.dart';
import 'package:practick_project/db/controller/notifications_db_controller.dart';

class NotificationCardList extends StatelessWidget {
  const NotificationCardList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NotificationsDbController();
    controller.fetchAllNotifications();

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final notifications = controller.notifications;

        if (notifications.isEmpty) {
          return const Center(child: Text("No notifications yet"));
        }

        final items = notifications.map((n) {
          return NotificationCardData(
            id: n['id'] as int,
            type: n['type'] as String,
            mealName: n['meal_name'] as String,
            meal: null, // пока без загрузки блюда
            isRead: (n['is_read'] as int) == 1,
            createdAt: DateTime.parse(n['created_at'] as String),
          );
        }).toList();

        // используем NotificationCard для дизайна
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: NotificationCard(data: items[index]),
            );
          },
        );
      },
    );
  }
}
