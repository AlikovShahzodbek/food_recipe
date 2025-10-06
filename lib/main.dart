import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/components/main_screen/home_page/custom_filter_wrap.dart';
import 'package:practick_project/routes/main_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  resetIndices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: AppColors().primary100,
        ),
      ),
      title: "Food Recipe",
      onGenerateRoute: generateRoute,
      initialRoute: AppRoutes.welcome,
    );
  }
}
