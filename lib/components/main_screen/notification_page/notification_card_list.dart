import 'package:flutter/material.dart';
import 'package:practick_project/components/main_screen/notification_page/notification_card.dart';
import 'package:practick_project/db/controllers/notifications_card_controller.dart';

class NotificationCardList extends StatefulWidget {
  const NotificationCardList({super.key});

  @override
  State<NotificationCardList> createState() => _NotificationCardListState();
}

class _NotificationCardListState extends State<NotificationCardList> {
  void _update() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    NotificationsCardController.instance.addListener(_update);
    NotificationsCardController.instance.load();
  }

  @override
  void dispose() {
    NotificationsCardController.instance.removeListener(_update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifications = NotificationsCardController.instance.notifications;

    if (notifications.isEmpty) {
      return const Center(child: Text("No notifications yet"));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];

        return NotificationCard(
          type: notification.type,
          title: notification.title,
          subtitle: notification.subtitle,
          isRead: notification.isRead ? 1 : 0,
          createdAt: notification.createdAt.toIso8601String(),
        );
      },
    );
  }
}
