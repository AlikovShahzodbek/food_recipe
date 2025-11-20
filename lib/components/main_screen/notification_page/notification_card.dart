import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:practick_project/controllers/notifications_card_controller.dart';
import 'package:practick_project/db/model/notification_table.dart';
import 'package:practick_project/pages/food_page.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.data});

  final NotificationCardData data;

  Future<void> _openFoodPage(BuildContext context) async {
    final meal = data.meal;
    if (meal != null) {
      await NotificationTable().markAsRead(data.id);
      Navigator.of(
        // ignore: use_build_context_synchronously
        context,
      ).push(MaterialPageRoute(builder: (_) => FoodPage(meal: meal)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Recipe details not available")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    late String icon;
    late String title;

    switch (data.type) {
      case "saved_recipe":
        icon = "assets/icons/outlined_icons/document-favorite-outlined.svg";
        title = 'Saved Recipe: ${data.mealName}';
        break;
      case "added_recipe":
        icon = "assets/icons/outlined_icons/document-text-outlined.svg";
        title = 'Added Recipe: ${data.mealName}';
        break;
      default:
        icon = "assets/icons/outlined_icons/document-text-outlined.svg";
        title = "Notification";
    }

    return GestureDetector(
      onTap: () => _openFoodPage(context),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: data.isRead ? Colors.grey.shade200 : Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(153, 194, 192, 192),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      title,
                      maxLines: 2,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    AutoSizeText(
                      data.meal?.instruction ?? "No description available",
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _formatDate(data.createdAt),
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              SvgPicture.asset(icon, height: 28, width: 28),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 60) {
      return "${difference.inMinutes} mins ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hours ago";
    } else {
      return "${date.day}/${date.month}/${date.year}";
    }
  }
}
