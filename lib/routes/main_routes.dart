import 'package:flutter/material.dart';
import 'package:practick_project/db/controller/local_recipes_data_base.dart';
import 'package:practick_project/pages/search_page.dart';
import 'package:practick_project/screens/login_screen.dart';
import 'package:practick_project/screens/main_screen.dart';
import 'package:practick_project/screens/registration_screen.dart';
import 'package:practick_project/screens/welcome_screen.dart';

class AppRoutes {
  static const welcome = '/';
  static const login = '/login';
  static const register = '/register';
  static const main = '/main';
  static const search = '/search';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  final LocalRecipesDatabase localDB = LocalRecipesDatabase();
  switch (settings.name) {
    case AppRoutes.welcome:
      return MaterialPageRoute(builder: (_) => WelcomeScreen());
    case AppRoutes.login:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case AppRoutes.register:
      return MaterialPageRoute(builder: (_) => RegistrationScreen());
    case AppRoutes.main:
      return MaterialPageRoute(builder: (_) => MainScreen(localDB: localDB));
    case AppRoutes.search:
      return MaterialPageRoute(builder: (_) => SearchPage());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(body: Center(child: Text("Page Not Found"))),
      );
  }
}
