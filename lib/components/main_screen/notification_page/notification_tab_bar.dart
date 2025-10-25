import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';

class NotificationTabBar extends StatefulWidget {
  const NotificationTabBar({super.key});

  @override
  State<NotificationTabBar> createState() => _NotificationTabBarState();
}

class _NotificationTabBarState extends State<NotificationTabBar> {
  final List<String> _tabContent = ['All', 'Read', 'Unread'];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const horizontalPadding = 20.0;
    final tabWidth =
        (screenWidth - (horizontalPadding * 2)) / _tabContent.length;
    return Column(
      children: [
        const SizedBox(height: 40),
        SizedBox(
          height: 40,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: _tabContent.length,
            itemBuilder: (context, index) {
              final isSelected = _selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  width: tabWidth,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors().primary100
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      _tabContent[index],
                      style: TextStyle(
                        fontSize: 15,
                        color: isSelected
                            ? AppColors().white
                            : AppColors().primary100,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
