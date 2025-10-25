import 'package:flutter/material.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:practick_project/db/controller/local_recipes_data_base.dart';
import 'package:practick_project/routes/main_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localDB = LocalRecipesDataBase();
  runApp(MyApp(localDB: localDB,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.localDB});
  final LocalRecipesDataBase localDB;

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
