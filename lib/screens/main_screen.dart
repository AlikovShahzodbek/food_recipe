import 'package:flutter/material.dart';
import 'package:practick_project/components/custom_bottom_nav_bar.dart';
import 'package:practick_project/db/controller/local_recipes_data_base.dart';
import 'package:practick_project/pages/add_recipe.dart';
import 'package:practick_project/pages/favorites_page.dart';
import 'package:practick_project/pages/notification_page.dart';
import 'package:practick_project/pages/profile_page.dart';
import 'package:practick_project/routes/home_page_routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.localDB});
  final LocalRecipesDataBase localDB;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void _onTap(BuildContext context, int index) {
    if (_currentIndex == index) {
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _navigatorKeys[_currentIndex].currentState?.canPop() ?? false,
      onPopInvokedWithResult: (didPop, result) {
        final currentNavigator = _navigatorKeys[_currentIndex].currentState!;
        if (currentNavigator.canPop()) {
          currentNavigator.maybePop(false);
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),
            _buildOffstageNavigator(4),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          onTap: (index) => _onTap(context, index),
          currentIndex: _currentIndex,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(int index) {
    return Offstage(
      offstage: _currentIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (settings) {
          switch (index) {
            case 0:
              return generateHomePageRoute(settings);
            case 1:
              return MaterialPageRoute(builder: (_) => FavoritesPage());
            case 2:
              return MaterialPageRoute(builder: (_) => NotificationPage());
            case 3:
              return MaterialPageRoute(builder: (_) => ProfilePage());
            case 4:
              return MaterialPageRoute(
                builder: (_) => AddRecipe(localDB: widget.localDB),
              );
            default:
              return MaterialPageRoute(
                builder: (_) => Scaffold(body: Text('Page not found')),
              );
          }
        },
      ),
    );
  }
}
