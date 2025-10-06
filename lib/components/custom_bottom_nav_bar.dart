import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:practick_project/Theme/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });
  final Function(int) onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final bottomNavBarDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    );
    return Container(
      height: 70,
      decoration: bottomNavBarDecoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navBarIcon(
            'assets/icons/active_icons/home-active.svg',
            'assets/icons/outlined_icons/home-outlined.svg',
            0,
          ),
          _navBarIcon(
            'assets/icons/active_icons/bookmark-active.svg',
            'assets/icons/outlined_icons/bookmark-outlined.svg',
            1,
          ),
          _navBarButton(4),
          _navBarIcon(
            'assets/icons/active_icons/notification-active.svg',
            'assets/icons/outlined_icons/notification-outlined.svg',
            2,
          ),
          _navBarIcon(
            'assets/icons/active_icons/profile-active.svg',
            'assets/icons/outlined_icons/profile-outlined.svg',
            3,
          ),
        ],
      ),
    );
  }

  Widget _navBarIcon(String active, String defolt, int index) {
    final isActive = index == currentIndex;
    return GestureDetector(
      onTap: () => onTap(index),
      child: SvgPicture.asset(
        isActive ? active : defolt,
        height: 25,
        width: 25,
      ),
    );
  }

  Widget _navBarButton(int index) {
    final bottomNavBarButtonDecoration = BoxDecoration(
      color: AppColors().primary100,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
      ],
    );
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        decoration: bottomNavBarButtonDecoration,
        height: 45,
        width: 45,
        child: Center(child: Icon(Icons.add, color: AppColors().white)),
      ),
    );
  }
}
