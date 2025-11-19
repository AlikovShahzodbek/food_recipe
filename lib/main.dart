import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/routes/main_routes.dart';
import 'package:practick_project/services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
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
