import 'package:flutter/material.dart';
import 'package:flutter_widget_compose/screens/home_screen.dart';
import 'package:flutter_widget_compose/screens/user_profile_screen.dart';

class BottomNavigationExample extends StatefulWidget {
  const BottomNavigationExample({super.key});

  @override
  _BottomNavigationExampleState createState() => _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State<BottomNavigationExample> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(), 
    const UserProfile(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
