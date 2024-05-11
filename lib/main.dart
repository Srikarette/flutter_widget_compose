import 'package:flutter/material.dart';
import 'package:flutter_widget_compose/di/get_it.dart';
import 'package:flutter_widget_compose/screens/BottomNavigation.dart';
void main() {
  registerServices();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomNavigation()
    );
  }
}

