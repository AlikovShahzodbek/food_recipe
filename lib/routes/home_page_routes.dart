import 'package:flutter/material.dart';
import 'package:practick_project/pages/home_page.dart';
import 'package:practick_project/pages/search_page.dart';

class HomePageRoutes {
  static const home = '/home';
  static const search = '/home/search';
}

Route<dynamic> generateHomePageRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
    case HomePageRoutes.home:
      return MaterialPageRoute(builder: (_) => HomePage());
    case HomePageRoutes.search:
      return MaterialPageRoute(builder: (_) => SearchPage());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(body: Center(child: Text("Page Not Found"))),
      );
  }
}
