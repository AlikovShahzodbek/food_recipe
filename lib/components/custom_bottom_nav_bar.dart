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
    // final bottomNavBarDecoration = BoxDecoration(
    //   color: Colors.white,
    //   borderRadius: const BorderRadius.only(
    //     topLeft: Radius.circular(24),
    //     topRight: Radius.circular(24),
    //   ),
    // );
    return NavigationBar(
      backgroundColor: Colors.white,
      indicatorColor: Colors.transparent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      destinations: [
        NavigationDestination(
          icon: _navBarIcon(
            'assets/icons/active_icons/home-active.svg',
            'assets/icons/outlined_icons/home-outlined.svg',
            0,
          ),
          label: '',
        ),
        NavigationDestination(
          icon: _navBarIcon(
            'assets/icons/active_icons/bookmark-active.svg',
            'assets/icons/outlined_icons/bookmark-outlined.svg',
            1,
          ),
          label: '',
        ),
        NavigationDestination(icon: _navBarButton(4), label: ''),
        NavigationDestination(
          icon: _navBarIcon(
            'assets/icons/active_icons/notification-active.svg',
            'assets/icons/outlined_icons/notification-outlined.svg',
            2,
          ),
          label: '',
        ),
        NavigationDestination(
          icon: _navBarIcon(
            'assets/icons/active_icons/profile-active.svg',
            'assets/icons/outlined_icons/profile-outlined.svg',
            3,
          ),
          label: '',
        ),
      ],
    );
  }

  _navBarIcon(String active, String defolt, int index) {
    final isActive = index == currentIndex;
    return InkWell(
      onTap: () => onTap(index),
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        child: SvgPicture.asset(
          isActive ? active : defolt,
          height: 25,
          width: 25,
        ),
      ),
    );
  }

  _navBarButton(int index) {
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
