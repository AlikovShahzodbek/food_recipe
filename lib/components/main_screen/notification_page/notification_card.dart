import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isRead,
    required this.createdAt,
    required this.type,
  });

  final String type;
  final String title;
  final String subtitle;
  final int isRead;
  final String createdAt;

  String getHeader() {
    switch (type) {
      case 'added_meal':
        return 'New Recipe: $title';
      case 'saved_meal':
        return 'Saved Recipe: $title';
      default:
        return title;
    }
  }

  SvgPicture getIcon() {
    switch (type) {
      case 'added_meal':
        return SvgPicture.asset(
          'assets/icons/outlined_icons/document-text-outlined.svg',
          width: 28,
        );
      case 'saved_meal':
        return SvgPicture.asset(
          'assets/icons/outlined_icons/document-favorite-outlined.svg',
          width: 28,
        );
      default:
        return SvgPicture.asset(
          'assets/icons/outlined_icons/document-text-outlined.svg',
          width: 28,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    getHeader(),
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  AutoSizeText(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    createdAt,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            getIcon(),
          ],
        ),
      ),
    );
  }
}
