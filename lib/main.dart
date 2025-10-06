// Flutter entry point file: main.dart
// Author: mohame Sinaas p
// Purpose: Initializes and launches the Flutter application
// Date: 6/10/2005
// Notes: This file should remain minimal; all app-level configuration should be in app.dart
import 'package:flutter/material.dart';
import 'package:borading_week2/app.dart';

/// The main function is the entry point of the Flutter application.
/// It calls runApp() to inflate the given widget (MyApp) and attach it
/// to the screen as the root of the widget tree.
void main() {
  // Ensure that Flutter framework is initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  // Launch the application by passing the root widget (MyApp)
  runApp(const MyApp());
}
