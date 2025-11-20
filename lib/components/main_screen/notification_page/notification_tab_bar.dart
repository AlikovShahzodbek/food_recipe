import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/controllers/notifications_card_controller.dart';
import 'package:practick_project/components/main_screen/notification_page/notification_card_list.dart';
import 'package:practick_project/db/controller/local_recipe_db_controller.dart';
import 'package:practick_project/db/model/local_recipes_table.dart';
import 'package:practick_project/db/model/notification_table.dart';
import 'package:practick_project/services/meal_repository.dart';

class NotificationTabBar extends StatefulWidget {
  const NotificationTabBar({super.key});

  @override
  State<NotificationTabBar> createState() => _NotificationTabBarState();
}

class _NotificationTabBarState extends State<NotificationTabBar> {
  final List<String> _tabs = ['All', 'Read', 'Unread'];
  int _selectedIndex = 0;

  late final NotificationsCardController controller;

  List<NotificationCardData> all = [];
  List<NotificationCardData> read = [];
  List<NotificationCardData> unread = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    controller = NotificationsCardController(
      LocalRecipesTable(),
      NotificationTable(),
      MealRepository(LocalRecipeDbController()),
    );

    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    final allData = await controller.load(NotificationsFilter.all);
    final readData = await controller.load(NotificationsFilter.read);
    final unreadData = await controller.load(NotificationsFilter.unread);

    setState(() {
      all = allData;
      read = readData;
      unread = unreadData;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const horizontalPadding = 20.0;
    final tabWidth = (screenWidth - (horizontalPadding * 2)) / _tabs.length;

    List<NotificationCardData> currentList;
    if (_selectedIndex == 0) {
      currentList = all;
    } else if (_selectedIndex == 1) {
      currentList = read;
    } else {
      currentList = unread;
    }

    return Column(
      children: [
        const SizedBox(height: 20),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _tabs.length,
            itemBuilder: (context, index) {
              final isSelected = index == _selectedIndex;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  width: tabWidth,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors().primary100
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      _tabs[index],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isSelected
                            ? Colors.white
                            : AppColors().primary100,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 20),
        Expanded(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : currentList.isEmpty
              ? const Center(child: Text("No notifications"))
              : NotificationCardList(),
        ),
      ],
    );
  }
}
