import 'package:flutter/material.dart';
import 'package:project_space/Core/Constants/app_colors.dart';
import 'package:project_space/Ui/Planet_details/planet_details_screen.dart';
import 'package:project_space/Ui/Screens/home_screen.dart';
import 'package:project_space/Ui/Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.red,
            foregroundColor: AppColors.white,
            padding: const EdgeInsets.all(16),
          ),
        ),
      ),
      initialRoute: SplashScreen.routName,
      routes: {
        SplashScreen.routName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        PlanetDetailsScreen.roteName:(context)=> PlanetDetailsScreen(),
      },
    );
  }
}
