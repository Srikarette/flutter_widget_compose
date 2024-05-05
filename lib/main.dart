import 'package:flutter/material.dart';
import 'package:flutter_widget_compose/widgets/compounds/navbar/bottom_bar.dart'; // Import your new structure

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomNavigationExample(), // Start with the bottom navigation example
    );
  }
}
