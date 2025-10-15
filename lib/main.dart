// Flutter entry point file: main.dart
// Author: Mohame Sinas P
// Purpose: Initializes and launches the Flutter application with Bloc setup
// Date: 8/10/2025

import 'package:borading_week2/app.dart';
import 'package:borading_week2/services/task_service.dart';
import 'package:borading_week2/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final TaskService taskService = TaskService(); // ✅ single instance
  runApp(MyApp(taskService: taskService));
}
