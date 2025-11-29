import 'package:flutter/material.dart';
import 'package:practick_project/components/main_screen/notification_page/notification_tab_bar.dart';
import 'package:practick_project/db/models/notifications_card_model.dart';
import 'package:practick_project/db/repositorys/notifications_card_repository.dart';
import 'package:practick_project/components/main_screen/notification_page/notification_card.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationsCardModel> all = [];
  List<NotificationsCardModel> filtered = [];

  @override
  void initState() {
    super.initState();
    loadNotifications();
  }

  Future<void> loadNotifications() async {
    all = await NotificationsCardRepository.getDatabase();
    setState(() {
      filtered = all; // default All
    });
  }

  void changeTab(int index) {
    setState(() {
      if (index == 0) {
        filtered = all;
      } else if (index == 1) {
        filtered = all.where((n) => n.isRead == true).toList();
      } else if (index == 2) {
        filtered = all.where((n) => n.isRead == false).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // TABBAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: NotificationTabBar(onTabChanged: changeTab),
          ),

          const SizedBox(height: 20),

          // NOTIFICATIONS LIST
          Expanded(
            child: filtered.isEmpty
                ? const Center(
                    child: Text(
                      "No notifications yet",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final n = filtered[index];

                      return NotificationCard(
                        type: n.type,
                        title: n.title,
                        subtitle: n.subtitle,
                        isRead: n.isRead ? 1 : 0,
                        createdAt: n.createdAt.toIso8601String(),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
