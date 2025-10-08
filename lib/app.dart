// Importing required packages and files
import 'package:borading_week2/bloc/task_bloc/task_bloc.dart';
import 'package:borading_week2/bloc/task_bloc/task_event.dart';
import 'package:borading_week2/core/constants/appcolors.dart'; // App color constants
import 'package:borading_week2/services/task_service.dart';
import 'package:borading_week2/views/home_screen.dart'; // Home Screen UI
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Flutter material widgets

// Root widget of the application
class MyApp extends StatelessWidget {
  final TaskService taskService;
  const MyApp({
    super.key,
    required this.taskService,
  }); // Constructor with optional key for widget identity

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(taskService)..add(LoadTask()),
      child: MaterialApp(
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
        home: HomeScreen(taskService: taskService),
      ),
    );
  }
}
