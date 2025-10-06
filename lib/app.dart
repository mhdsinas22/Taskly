// Importing required packages and files
import 'package:borading_week2/core/constants/appcolors.dart'; // App color constants
import 'package:borading_week2/views/home_screen.dart'; // Home Screen UI
import 'package:flutter/material.dart'; // Flutter material widgets

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor with optional key for widget identity

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Removes the debug banner on top-right corner
      // App-wide theme configuration
      theme: ThemeData(
        primaryColor: AppColors.primaryColor, // Primary brand color
        scaffoldBackgroundColor:
            AppColors.surfaceColor, // Background color for Scaffold
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: AppColors.onSurface,
          ), // Default text color
        ),
      ),

      // Starting screen of the application
      home: const HomeScreen(),
    );
  }
}
