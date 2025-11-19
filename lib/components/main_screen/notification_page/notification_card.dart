import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practick_project/controllers/notifications_card_controller.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({super.key, required this.data});

  final NotificationCardData data;

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  final cardDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    final meal = widget.data.meal;
    final data = widget.data;
    late String icon;
    late String title;

    switch (data.type) {
      case "saved_recipe":
        icon = "assets/icons/outlined_icons/document-favorite-outlined.svg";
        title = 'New Recipe ${data.mealName}';
        break;
      case "added_recipe":
        icon = "assets/icons/outlined_icons/document-text-outlined.svg";
        title = 'Save Recipe ${data.mealName}';
        break;
      default:
        icon = "assets/icons/outlined_icons/document-text-outlined.svg";
        title = "Notification";
    }

    return Container(
      decoration: cardDecoration,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(title, maxLines: 2),
                  AutoSizeText(
                    meal?.instruction ?? "No description",
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(icon, height: 24, width: 24),
          ],
        ),
      ),
    );
  }
}
