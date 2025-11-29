import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';

class NotificationTabBar extends StatefulWidget {
  const NotificationTabBar({super.key, required this.onTabChanged});

  final Function(int index) onTabChanged;

  @override
  State<NotificationTabBar> createState() => _NotificationTabBarState();
}

class _NotificationTabBarState extends State<NotificationTabBar> {
  final List<String> _tabs = ['All', 'Read', 'Unread'];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const horizontalPadding = 20.0;
    final tabWidth = (screenWidth - (horizontalPadding * 2)) / _tabs.length;

    return SizedBox(
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

              widget.onTabChanged(index);
            },
            child: Container(
              width: tabWidth,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors().primary100 : Colors.transparent,
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
                    color: isSelected ? Colors.white : AppColors().primary100,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
