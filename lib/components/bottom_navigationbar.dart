import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class BottomNavigationBarComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 5,
      backgroundColor: Colors.purple,
      selectedItemColor: Colors.yellow[900],
      unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
      ],
    );
  }
}
