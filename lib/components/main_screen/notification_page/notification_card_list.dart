import 'package:flutter/material.dart';
import 'package:practick_project/components/main_screen/notification_page/notification_card.dart';
import 'package:practick_project/controllers/notifications_card_controller.dart';

class NotificationCardList extends StatefulWidget {
  const NotificationCardList({super.key, required this.items});

  final List<NotificationCardData> items;

  @override
  State<NotificationCardList> createState() => _NotificationCardListState();
}

class _NotificationCardListState extends State<NotificationCardList> {
  @override
  Widget build(BuildContext context) {
    final items = widget.items;

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: NotificationCard(data: items[index]),
        );
      },
    );
  }
}
